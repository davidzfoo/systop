package com.systop.common.modules.dept.webapp;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;
import com.opensymphony.xwork2.validator.annotations.ValidatorType;
import com.systop.common.modules.dept.DeptConstants;
import com.systop.common.modules.dept.model.Dept;
import com.systop.common.modules.dept.service.DeptManager;
import com.systop.common.modules.dept.service.DeptSerialNoManager;
import com.systop.core.util.RequestUtil;
import com.systop.core.webapp.struts2.action.ExtJsCrudAction;

/**
 * 部门管理Action
 * 
 * @author Sam Lee
 * 
 */
@SuppressWarnings( { "serial", "unchecked" })
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class DeptAction extends ExtJsCrudAction<Dept, DeptManager> {
  /**
   * 当前上级部门ID
   */
  private Integer parentId;

  /**
   * 部门序列号管理器
   */
  private DeptSerialNoManager serialNoManager;

  /**
   * 用于查询的部门名称
   */
  private String deptName = StringUtils.EMPTY;
  
  
  private List depts;


  /**
   * 部门查询。根据指定的上级部门id(通过{@link #parentId}属性)，查询下级部门。 
   * 如果{@link #parentId}为null,则查询顶级部门（没有上级部门的）
   */
  @Override
  @SkipValidation
  public String index() {
    /*
    if (parentId == null) {
      items = getManager().query(
          "from Dept d where d.parentDept is null and d.name like ?",
          MatchMode.ANYWHERE.toMatchString(deptName));
    } else {
      items = getManager()
          .query(
              "from Dept d where d.parentDept.id = ? and d.name like ?",
              new Object[] { parentId,
                  MatchMode.ANYWHERE.toMatchString(deptName) });
    }*/
    return INDEX;
  }
  
  /**
   * Build a tree as json format.
   */
  public String deptTree() {
    if(RequestUtil.isJsonRequest(getRequest())) {
      Map deptTree = getDeptTree(null, true);
      //First dept is the organization, so, we have to get its child depts
      depts = (List) deptTree.get("children");
      return JSON;
    } 
    return INDEX;
  }

  /**
   * 根据指定的父部门id查询子部门
   */
  private List<Dept> getByParentId(Integer parentDeptId) {
    List list = Collections.EMPTY_LIST;
    if (parentDeptId == null || parentDeptId.equals(DeptConstants.TOP_DEPT_ID)) {
      list = getManager().query("from Dept d where d.parentDept is null");
    } else {
      list = getManager().query("from Dept d where d.parentDept.id = ?",
          parentDeptId);
    }

    return list;
  }

  /**
   * 返回部门树形列表，每一个部门用一个<code>java.util.Map</code>表示，子部门
   * 用Map的“childNodes”key挂接一个<code>java.util.List</code>.<br>
   * 本方法供DWR调用，Map中key符合jsam dojo Tree的要求。
   * @param parent 父部门，如果为null，则表示顶级部门
   * @param nested 是否递归查询子部门，true表示递归查询子部门
   * @return
   */
  public Map getDeptTree(Map parent, boolean nested) {
    if (parent == null || parent.isEmpty() || parent.get("id") == null) {
      parent = new HashMap();
      parent.put("text", DeptConstants.TOP_DEPT_NAME);
      parent.put("id", DeptConstants.TOP_DEPT_ID);
    }
    // 得到子部门
    List<Dept> depts = this.getByParentId((Integer) parent.get("id"));

    logger.debug("Dept {} has {} children." , parent.get("text"), depts.size());
    // 转换所有子部门为Map对象，一来防止dwr造成延迟加载，
    // 二来可以符合Ext的数据要求.
    List children = new ArrayList();
    for (Iterator<Dept> itr = depts.iterator(); itr.hasNext();) {
      Dept dept = itr.next();
      Map child = new HashMap();
      child.put("id", dept.getId());
      child.put("text", dept.getName());
      child.put("descn", dept.getDescn());
      if (nested) { // 递归查询子部门
        child = this.getDeptTree(child, nested);
      }
      children.add(child);
    }
    if (!children.isEmpty()) {
      parent.put("children", children);
      parent.put("childNodes", children);
      parent.put("leaf", false);
    } else {
      parent.put("leaf", true);
    }

    return parent;
  }

  /**
   * @return 当前上级部门ID
   */
  public Integer getParentId() {
    return parentId;
  }

  /**
   * @param parentId the parentId to set
   */
  public void setParentId(Integer parentId) {
    this.parentId = parentId;
  }

  /**
   * 得到当前部门（通过{@link #parentId}指定）的上级部门.
   */
  public Dept getParent() {
    if (parentId == null || parentId.equals(DeptConstants.TOP_DEPT_ID)) {
      Dept dept = new Dept();
      dept.setName(DeptConstants.TOP_DEPT_NAME);
      return dept;
    }

    return getManager().get(parentId);
  }

  /**
   * @return the deptName
   */
  public String getDeptName() {
    return deptName;
  }

  /**
   * @param deptName the deptName to set
   */
  public void setDeptName(String deptName) {
    this.deptName = deptName;
  }

  /**
   * 覆盖父类，处理父部门ID为{@link DeptConstants#TOP_DEPT_ID}的情况。
   */
  @Override
  @Validations(requiredStrings = { @RequiredStringValidator(type = ValidatorType.SIMPLE, fieldName = "model.name", message = "部门名称是必须的.")})
  public String save() {
    // 如果页面选择了顶级部门作为父部门，则设置父部门为null
    if (getModel().getParentDept() != null
        && getModel().getParentDept().getId() != null
        && getModel().getParentDept().getId().equals(DeptConstants.TOP_DEPT_ID)) {
      getModel().setParentDept(null);
    }
    if (getModel().getParentDept() == null
        || getModel().getParentDept().getId() == null) {
      logger.debug("保存第一级部门.");
    }
    return super.save();
  }

  /**
   * 处理parentDept为null的情况
   */
  @Override
  @SkipValidation
  public String edit() {
    if (getModel().getId() != null) {
      setModel(getManager().get(getModel().getId()));
      if (getModel().getParentDept() == null) {
        Dept dept = new Dept(); // 构建一个父部门
        dept.setId(DeptConstants.TOP_DEPT_ID);
        dept.setName(DeptConstants.TOP_DEPT_NAME);
        getModel().setParentDept(dept);
        getManager().getDao().evict(getModel()); // 将dept脱离hibernate
        logger.debug("编辑第一级部门");
      }
    }
    return INPUT;
  }

  /**
   * 重置所有部门编号
   */
  @SkipValidation
  public String updateSerialNo() {
    serialNoManager.updateAllSerialNo();
    return SUCCESS;
  }

  public DeptSerialNoManager getSerialNoManager() {
    return serialNoManager;
  }
  
  @Autowired(required = true)
  public void setSerialNoManager(DeptSerialNoManager serialNoManager) {
    this.serialNoManager = serialNoManager;
  }
  


  public List getDepts() {
    return depts;
  }

  public void setDepts(List depts) {
    this.depts = depts;
  }
}
