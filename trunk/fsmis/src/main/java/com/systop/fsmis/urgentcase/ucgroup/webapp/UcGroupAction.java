package com.systop.fsmis.urgentcase.ucgroup.webapp;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.systop.cms.utils.PageUtil;
import com.systop.common.modules.dept.model.Dept;
import com.systop.common.modules.security.user.LoginUserService;
import com.systop.core.dao.support.Page;
import com.systop.core.webapp.struts2.action.DefaultCrudAction;
import com.systop.fsmis.FsConstants;
import com.systop.fsmis.model.UrgentGroup;
import com.systop.fsmis.model.UrgentType;
import com.systop.fsmis.urgentcase.UcConstants;
import com.systop.fsmis.urgentcase.ucgroup.service.UcGroupManager;

/**
 * 应急指挥组维护action
 * 
 * @author yj
 * 
 */
@SuppressWarnings( { "serial" })
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class UcGroupAction extends
		DefaultCrudAction<UrgentGroup, UcGroupManager> {
	/**
	 * 登陆用户信息管理
	 */
	@Autowired
	private LoginUserService loginUserService;

	/** 应急指挥类别ID */
	private Integer ucTypeId;

	/**
	 * 保存组
	 */
	@Override
	public String save() {
		if (ucTypeId != null) {
			getModel().setUrgentType(getUrgentType(ucTypeId));
			getModel().setIsPublic(FsConstants.N);
		} else {
			getModel().setIsPublic(FsConstants.Y);
		}
		try {
			Dept dept = loginUserService.getLoginUserCounty(getRequest());
			if (dept == null) {
				addActionError("当前用户部门为空");
			}
			getModel().setIsOriginal(UcConstants.GROUP_ORIGINAL_YES);
			getModel().setCounty(dept);
			getManager().save(getModel());
			return SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
			return INPUT;
		}
	}

	/**
	 * 组查询列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public String index() {
		Page page = PageUtil.getPage(getPageNo(), getPageSize());
		StringBuffer sql = new StringBuffer(
				"from UrgentGroup ug where ug.isOriginal = ? ");
		List args = new ArrayList();
		args.add(UcConstants.GROUP_ORIGINAL_YES);
		Dept dept = loginUserService.getLoginUserCounty(getRequest());
		if (dept != null) {
			sql.append(" and ug.county.id = ?");
			args.add(dept.getId());
			if (ucTypeId != null) {
				sql.append(" and (ug.urgentType.id = ? or ");
				args.add(ucTypeId);
				// 列表页面显示类别信息使用
				getRequest().setAttribute("ucType", getUrgentType(ucTypeId));
				getRequest().setAttribute("msg",
						getManager().getUcGroupName(getUrgentType(ucTypeId)));
			} else {
				sql.append(" and (");
			}
			sql.append(" ug.urgentType.id is null) order by ug.isPublic desc");
			page = getManager().pageQuery(page, sql.toString(), args.toArray());
			restorePageData(page);
		}
		return INDEX;
	}

	/**
	 * 根据id获得应急类别
	 * 
	 * @param id
	 * @return
	 */
	private UrgentType getUrgentType(Integer id) {
		return getManager().getDao().get(UrgentType.class, id);
	}

	@SuppressWarnings("unchecked")
	public Map getIsPublicList() {
		return FsConstants.YN_MAP;
	}

	@SuppressWarnings("unchecked")
	public Map getSortMap() {
		Map SortMap = new LinkedHashMap();
		SortMap.put(UcConstants.INNER, "内部");
		SortMap.put(UcConstants.OUTER, "外部");
		return SortMap;
	}

	@SuppressWarnings("unchecked")
	public Map getCategoryMap() {
		Map categoryMap = new LinkedHashMap();
		if (ucTypeId != null) {
			categoryMap.put(UcConstants.AFTER_HANDLE, "善后处理");
			categoryMap.put(UcConstants.ACCIDENT_HANDLE, "事故调查处理");
		} else {
			categoryMap.put(UcConstants.LEADERSHIP, "指挥部");
			categoryMap.put(UcConstants.OFFICE, "办公室");
			categoryMap.put(UcConstants.DEFEND, "警戒保卫");
			categoryMap.put(UcConstants.MEDICAL_RESCUE, "医疗救护");
			categoryMap.put(UcConstants.REAR_SERVICE, "后勤保障");
			categoryMap.put(UcConstants.NEWS_REPORT, "新闻报道");
			categoryMap.put(UcConstants.EXPERT_TECHNOLOGY, "技术专家");
			categoryMap.put(UcConstants.RECEIVE, "接待");
		}

		return categoryMap;
	}

	public Integer getUcTypeId() {
		return ucTypeId;
	}

	public void setUcTypeId(Integer ucTypeId) {
		this.ucTypeId = ucTypeId;
	}
}
