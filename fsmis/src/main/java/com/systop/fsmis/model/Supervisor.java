package com.systop.fsmis.model;

import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.systop.common.modules.dept.model.Dept;
import com.systop.core.model.BaseModel;

/**
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "SUPERVISORS", schema = "FSMIS")
public class Supervisor extends BaseModel {

	/** 主键 */
	private Integer id;
	/** 身份证号 */
	private String idNumber;
	/** 部门 */
	private Dept dept;
	/** 姓名 */
	private String name;
	/** 性别 */
	private String gender;
	/** 出生日期 */
	private Date birthday;
	/** 编号 */
	private String code;
	/** 单位 */
	private String unit;
	/** 职务 */
	private String duty;
	/** 手机 */
	private String mobile;
	/** 固话 */
	private String phone;
	/** 监管区域 */
	private String superviseRegion;
	/** 坐标 */
	private String coordinate;
	/** 相片Url */
	private String photoUrl;
	/** 是否负责人 */
	private String isLeader;
	/** 一般案件 */
	private Set<FsCase> fsCase = new HashSet<FsCase>(0);

	@Id
	@GeneratedValue(generator = "hibseq")
	@GenericGenerator(name = "hibseq", strategy = "hilo")
	@Column(name = "ID", nullable = false, precision = 10, scale = 0)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "DEPT")
	public Dept getDept() {
		return this.dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	@Column(name = "NAME", length = 510)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "GENDER", length = 4)
	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "BIRTHDAY", length = 11)
	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@Column(name = "CODE", length = 510)
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "UNIT", length = 510)
	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Column(name = "DUTY", length = 510)
	public String getDuty() {
		return this.duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	@Column(name = "MOBILE", length = 255)
	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Column(name = "PHONE", length = 255)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "SUPERVISE_REGION", length = 255)
	public String getSuperviseRegion() {
		return this.superviseRegion;
	}

	public void setSuperviseRegion(String superviseRegion) {
		this.superviseRegion = superviseRegion;
	}

	@Column(name = "COORDINATE", length = 255)
	public String getCoordinate() {
		return this.coordinate;
	}

	public void setCoordinate(String coordinate) {
		this.coordinate = coordinate;
	}

	@Column(name = "PHOTO_URL", length = 255)
	public String getPhotoUrl() {
		return this.photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	@Column(name = "IS_LEADER", length = 1, columnDefinition = "char(1) default '0'")
	public String getIsLeader() {
		return isLeader;
	}

	public void setIsLeader(String isLeader) {
		this.isLeader = isLeader;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "supervisor")
	public Set<FsCase> getFsCase() {
		return this.fsCase;
	}

	public void setFsCase(Set<FsCase> fsCase) {
		this.fsCase = fsCase;
	}

	@Column(name = "ID_NUMBER", length = 255)
	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
}