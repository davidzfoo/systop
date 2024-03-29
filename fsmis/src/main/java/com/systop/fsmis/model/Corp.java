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
import org.hibernate.annotations.Type;

import com.systop.common.modules.dept.model.Dept;
import com.systop.core.model.BaseModel;

/**
 * 企业表
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "CORPS", schema = "FSMIS")
public class Corp extends BaseModel {

	/**
	 * 主键
	 */
	private Integer id;
	/**
	 * 部门
	 */
	private Dept dept;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 描述
	 */
	private String descn;
	/**
	 * 编号
	 */
	private String code;
	/**
	 * 法人身份证号
	 */
	private String idNumber;
	/**
	 * 诚信等级
	 */
	private String integrityGrade;
	/**
	 * 诚信记录
	 */
	private String integrityRecord;
	/**
	 * 法人
	 */
	private String legalPerson;
	/**
	 * 手机
	 */
	private String mobile;
	/**
	 * 固话
	 */
	private String phone;
	/**
	 * 地址
	 */
	private String address;
	/**
	 * 地理位置
	 */
	private String coordinate;
	/**
	 * 邮政编码
	 */
	private String zip;
	/**
	 * 经营内容
	 */
	private String operateDetails;
	/**
	 * 照片
	 */
	private String photoUrl;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 工商执照号
	 */
	private String businessLicense;
	/**
	 * 工商执照有效期
	 */
	private Date businessLicenseIndate;
	/**
	 * 生产许可证号
	 */
	private String produceLicense;
	/**
	 * 生产许可证有效期
	 */
	private Date produceLicenseIndate;
	/**
	 * 卫生许可证号
	 */
	private String sanitationLicense;
	/**
	 * 卫生许可证有效期
	 */
	private Date sanitationLicenseIndate;
	/**
	 * 涉及的案件
	 */
	private Set<FsCase> fsCases = new HashSet<FsCase>(0);

	@Id
	@GeneratedValue(generator = "hibseq")
	@GenericGenerator(name = "hibseq", strategy = "hilo")
	@Column(name = "ID", nullable = false, precision = 10, scale = 0)
	public Integer getId() {
		return this.id;
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

	@Column(name = "NAME", length = 255)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "DESCN", length = 4000)
	public String getDescn() {
		return this.descn;
	}

	public void setDescn(String descn) {
		this.descn = descn;
	}

	@Column(name = "CODE", length = 100)
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "ID_NUMBER", length = 100)
	public String getIdNumber() {
		return this.idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	@Column(name = "INTEGRITY_GRADE", length = 100)
	public String getIntegrityGrade() {
		return this.integrityGrade;
	}

	public void setIntegrityGrade(String integrityGrade) {
		this.integrityGrade = integrityGrade;
	}

	@Column(name = "INTEGRITY_RECORD", length = 4000)
	public String getIntegrityRecord() {
		return this.integrityRecord;
	}

	public void setIntegrityRecord(String integrityRecord) {
		this.integrityRecord = integrityRecord;
	}

	@Column(name = "LEGAL_PERSON", length = 100)
	public String getLegalPerson() {
		return this.legalPerson;
	}

	public void setLegalPerson(String legalPerson) {
		this.legalPerson = legalPerson;
	}

	@Column(name = "MOBILE", length = 100)
	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Column(name = "PHONE", length = 100)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "ADDRESS", length = 255)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "COORDINATE", length = 255)
	public String getCoordinate() {
		return this.coordinate;
	}

	public void setCoordinate(String coordinate) {
		this.coordinate = coordinate;
	}

	@Column(name = "ZIP", length = 40)
	public String getZip() {
		return this.zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	@Type(type = "text")
	@Column(name = "OPERATE_DETAILS")
	public String getOperateDetails() {
		return this.operateDetails;
	}

	public void setOperateDetails(String operateDetails) {
		this.operateDetails = operateDetails;
	}

	@Column(name = "PHOTO_URL", length = 255)
	public String getPhotoUrl() {
		return this.photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	@Column(name = "REMARK", length = 255)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "BUSINESS_LICENSE", length = 255)
	public String getBusinessLicense() {
		return this.businessLicense;
	}

	public void setBusinessLicense(String businessLicense) {
		this.businessLicense = businessLicense;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "BUSINESS_LICENSE_INDATE", length = 11)
	public Date getBusinessLicenseIndate() {
		return this.businessLicenseIndate;
	}

	public void setBusinessLicenseIndate(Date businessLicenseIndate) {
		this.businessLicenseIndate = businessLicenseIndate;
	}

	@Column(name = "PRODUCE_LICENSE", length = 255)
	public String getProduceLicense() {
		return this.produceLicense;
	}

	public void setProduceLicense(String produceLicense) {
		this.produceLicense = produceLicense;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "PRODUCE_LICENSE_INDATE", length = 11)
	public Date getProduceLicenseIndate() {
		return this.produceLicenseIndate;
	}

	public void setProduceLicenseIndate(Date produceLicenseIndate) {
		this.produceLicenseIndate = produceLicenseIndate;
	}

	@Column(name = "SANITATION_LICENSE", length = 255)
	public String getSanitationLicense() {
		return this.sanitationLicense;
	}

	public void setSanitationLicense(String sanitationLicense) {
		this.sanitationLicense = sanitationLicense;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "SANITATION_LICENSE_INDATE", length = 11)
	public Date getSanitationLicenseIndate() {
		return this.sanitationLicenseIndate;
	}

	public void setSanitationLicenseIndate(Date sanitationLicenseIndate) {
		this.sanitationLicenseIndate = sanitationLicenseIndate;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "corp")
	public Set<FsCase> getFsCases() {
		return this.fsCases;
	}

	public void setFsCases(Set<FsCase> fsCases) {
		this.fsCases = fsCases;
	}

}
