package com.systop.fsmis.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.systop.common.modules.security.user.model.User;

@Entity
@Table(name = "MESSAGES", schema="FSMIS")
public class Message implements java.io.Serializable {

	private Integer id;
	private User usersByReceiver;
	private User usersBySender;
	private String content;
	private Date createTime;
	private Date receiveTime;
	private Character isNew;

	public Message() {
	}

	@Id
	@GeneratedValue(generator = "hibseq")
	@GenericGenerator(name = "hibseq", strategy = "hilo")
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "RECEIVER")
	public User getUsersByReceiver() {
		return this.usersByReceiver;
	}

	public void setUsersByReceiver(User usersByReceiver) {
		this.usersByReceiver = usersByReceiver;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SENDER")
	public User getUsersBySender() {
		return this.usersBySender;
	}

	public void setUsersBySender(User usersBySender) {
		this.usersBySender = usersBySender;
	}

	@Column(name = "CONTENT", length = 500)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
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
	@Column(name = "RECEIVE_TIME", length = 11)
	public Date getReceiveTime() {
		return this.receiveTime;
	}

	public void setReceiveTime(Date receiveTime) {
		this.receiveTime = receiveTime;
	}

	@Column(name = "IS_NEW", length = 1)
	public Character getIsNew() {
		return this.isNew;
	}

	public void setIsNew(Character isNew) {
		this.isNew = isNew;
	}

}
