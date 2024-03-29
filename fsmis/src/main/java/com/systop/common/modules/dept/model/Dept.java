package com.systop.common.modules.dept.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.hibernate.annotations.GenericGenerator;

import com.systop.common.modules.security.user.model.User;
import com.systop.core.model.BaseModel;
import com.systop.fsmis.model.Corp;
import com.systop.fsmis.model.FsCase;
import com.systop.fsmis.model.Supervisor;
import com.systop.fsmis.model.TaskDetail;

/**
 * The persistent class for the depts database table.
 * 
 * @author Sam Lee
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "depts", uniqueConstraints = {})
public class Dept extends BaseModel {

	/** id */
	private Integer id;

	/**
	 * 部门描述
	 */
	private String descn;

	/**
	 * 部门名称
	 */
	private String name;

	/**
	 * 部门类别
	 */
	private String type;

	/**
	 * 部门编号规则：两位数字，从1自动排；
	 */
	private String serialNo;

	/**
	 * 部门类别
	 */
	private String deptSort = "0";

	/**
	 * 部门的角色
	 * 
	 * private Set<Role> roles = new HashSet<Role>(0);
	 */

	/**
	 * 上级部门
	 */
	private Dept parentDept;

	/**
	 * 下级部门
	 */
	private Set<Dept> childDepts = new HashSet<Dept>(0);

	/**
	 * 部门下用户
	 */
	private Set<User> users = new HashSet<User>(0);

	/**
	 * 部门下企业
	 */
	private Set<Corp> corps = new HashSet<Corp>(0);

	/**
	 * 部门下信息员
	 */
	private Set<Supervisor> supervisors = new HashSet<Supervisor>(0);

	/**
	 * 部门对应的一般事件
	 */
	private Set<FsCase> fsCases = new HashSet<FsCase>(0);

	/**
	 * 部门对应的任务详情
	 */
	private Set<TaskDetail> taskDetails = new HashSet<TaskDetail>(0);

	/**
	 * 缺省构造
	 */
	public Dept() {
	}

	/**
	 * @param name
	 *            部门名称
	 * @param type
	 *            部门类别
	 */
	public Dept(String name, String type) {
		this.name = name;
		this.type = type;
	}
	/**
	 * 为在Red5中应用中属性查询而加的构造
	 * @param id
	 * @param parentDept
	 */
	public Dept(Integer id, Dept parentDept) {
		this.id = id;
		this.parentDept = parentDept;
	}

	@Id
	@GeneratedValue(generator = "hibseq")
	@GenericGenerator(name = "hibseq", strategy = "hilo")
	@Column(name = "ID", nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "descn")
	public String getDescn() {
		return this.descn;
	}

	public void setDescn(String descn) {
		this.descn = descn;
	}

	@Column(name = "name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "serial_no")
	public String getSerialNo() {
		return this.serialNo;
	}

	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}

	@Column(name = "dept_sort")
	public String getDeptSort() {
		return deptSort;
	}

	public void setDeptSort(String deptSort) {
		this.deptSort = deptSort;
	}

	/**
	 * 隐藏部门管理，对应的角色关联关系删除
	 * 
	 * @ManyToMany(cascade = {}, fetch = FetchType.LAZY, targetEntity =
	 *                     Role.class)
	 * @JoinTable(name = "dept_role", joinColumns =                 {@JoinColumn(name
	 *  = "dept_id")}, inverseJoinColumns =
	 *                 {@JoinColumn(name = "role_id")}) public
	 *                 Set<Role> getRoles() { return this.roles; }
	 * 
	 *                 public void setRoles(Set<Role> roles) { this.roles =
	 *                 roles; }
	 */

	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumn(name = "parent_id")
	public Dept getParentDept() {
		return this.parentDept;
	}

	public void setParentDept(Dept parentDept) {
		this.parentDept = parentDept;
	}

	@OneToMany(cascade = {}, fetch = FetchType.LAZY, mappedBy = "parentDept")
	public Set<Dept> getChildDepts() {
		return this.childDepts;
	}

	public void setChildDepts(Set<Dept> childDepts) {
		this.childDepts = childDepts;
	}

	@OneToMany(cascade = {}, fetch = FetchType.LAZY, mappedBy = "dept")
	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	@OneToMany(cascade = {}, fetch = FetchType.LAZY, mappedBy = "dept")
	public Set<Corp> getCorps() {
		return corps;
	}

	public void setCorps(Set<Corp> corps) {
		this.corps = corps;
	}

	@OneToMany(cascade = {}, fetch = FetchType.LAZY, mappedBy = "dept")
	public Set<Supervisor> getSupervisors() {
		return supervisors;
	}

	public void setSupervisors(Set<Supervisor> supervisors) {
		this.supervisors = supervisors;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "county")
	public Set<FsCase> getFsCases() {
		return this.fsCases;
	}

	public void setFsCases(Set<FsCase> fsCases) {
		this.fsCases = fsCases;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "dept")
	public Set<TaskDetail> getTaskDetails() {
		return this.taskDetails;
	}

	public void setTaskDetails(Set<TaskDetail> taskDetails) {
		this.taskDetails = taskDetails;
	}

	@Transient
	public boolean getHasChild() {
		return this.getChildDepts().size() > 0;
	}

	/**
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof Dept)) {
			return false;
		}
		Dept castOther = (Dept) other;
		return new EqualsBuilder().append(this.getId(), castOther.getId())
				.isEquals();
	}

	/**
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		return new HashCodeBuilder().append(getId()).toHashCode();
	}

	/**
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return new ToStringBuilder(this).append("id", getId()).toString();
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
