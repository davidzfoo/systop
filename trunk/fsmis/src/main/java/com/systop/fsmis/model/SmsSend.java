package com.systop.fsmis.model;

// Generated 2009-12-16 9:15:02 by Hibernate Tools 3.2.4.GA

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * SmsSend generated by hbm2java
 */
@Entity
@Table(name = "SMS_SEND")
public class SmsSend implements java.io.Serializable {

	private String id;
	private GenericCase genericCase;
	private String mobileNum;
	private Date createTime;
	private Date sendTime;
	private String content;
	private String isNew;
	private String isReceive;
	private String name;
	private String remark;
	private Long masid;

	public SmsSend() {
	}

	public SmsSend(String id) {
		this.id = id;
	}

	public SmsSend(String id, GenericCase genericCase, String mobileNum,
			Date createTime, Date sendTime, String content, String isNew,
			String isReceive, String name, String remark, Long masid) {
		this.id = id;
		this.genericCase = genericCase;
		this.mobileNum = mobileNum;
		this.createTime = createTime;
		this.sendTime = sendTime;
		this.content = content;
		this.isNew = isNew;
		this.isReceive = isReceive;
		this.name = name;
		this.remark = remark;
		this.masid = masid;
	}

	@Id
	@Column(name = "ID", unique = true, nullable = false, length = 36)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "GENERIC_CASE")
	public GenericCase getGenericCase() {
		return this.genericCase;
	}

	public void setGenericCase(GenericCase genericCase) {
		this.genericCase = genericCase;
	}

	@Column(name = "MOBILE_NUM", length = 40)
	public String getMobileNum() {
		return this.mobileNum;
	}

	public void setMobileNum(String mobileNum) {
		this.mobileNum = mobileNum;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_TIME", length = 11)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "SEND_TIME", length = 11)
	public Date getSendTime() {
		return this.sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	@Column(name = "CONTENT", length = 1000)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "IS_NEW", length = 2)
	public String getIsNew() {
		return this.isNew;
	}

	public void setIsNew(String isNew) {
		this.isNew = isNew;
	}

	@Column(name = "IS_RECEIVE", length = 2)
	public String getIsReceive() {
		return this.isReceive;
	}

	public void setIsReceive(String isReceive) {
		this.isReceive = isReceive;
	}

	@Column(name = "NAME", length = 40)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "REMARK", length = 200)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "MASID", precision = 10, scale = 0)
	public Long getMasid() {
		return this.masid;
	}

	public void setMasid(Long masid) {
		this.masid = masid;
	}

}
