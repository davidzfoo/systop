package com.systop.fsmis.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.hibernate.annotations.GenericGenerator;

import com.systop.core.model.BaseModel;

/**
 * 联合任务附件表
 */
@Entity
@Table(name = "JOINT_TASK_ATTACHS", schema = "FSMIS")
@SuppressWarnings("serial")
public class JointTaskAttach extends BaseModel {

	/**
	 * 主键
	 */
	private Integer id;

	/**
	 * 所属联合任务
	 */
	private JointTask jointTask;

	/**
	 * 标题
	 */
	private String title;

	/**
	 * 路径
	 */
	private String path;

	/**
	 * 备注
	 */
	private String remark;

	/**
	 * 缺省构造方法
	 */
	public JointTaskAttach() {
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "JOINT_TASK")
	public JointTask getJointTask() {
		return this.jointTask;
	}

	public void setJointTask(JointTask jointTask) {
		this.jointTask = jointTask;
	}

	@Column(name = "TITLE", length = 255)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "PATH", length = 255)
	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Column(name = "REMARK", length = 255)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	/**
	 * @see Object#equals(Object)
	 */
	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof JointTaskAttach)) {
			return false;
		}
		JointTaskAttach jointTaskAttach = (JointTaskAttach) other;
		return new EqualsBuilder()
				.append(this.getId(), jointTaskAttach.getId()).isEquals();
	}

	/**
	 * @see Object#hashCode()
	 */
	public int hashCode() {
		return new HashCodeBuilder().append(getId()).toHashCode();
	}

	/**
	 * @see Object#toString()
	 */
	public String toString() {
		return new ToStringBuilder(this).append("id", getId()).toString();
	}
}
