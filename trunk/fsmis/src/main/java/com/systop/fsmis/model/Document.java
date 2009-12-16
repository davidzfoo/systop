package com.systop.fsmis.model;

// Generated 2009-12-16 9:15:02 by Hibernate Tools 3.2.4.GA

import java.sql.Clob;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Document generated by hbm2java
 */
@Entity
@Table(name = "DOCUMENT")
public class Document implements java.io.Serializable {

	private long id;
	private DocumentType documentType;
	private String title;
	private String author;
	private Clob content;
	private String descn;

	public Document() {
	}

	public Document(long id) {
		this.id = id;
	}

	public Document(long id, DocumentType documentType, String title,
			String author, Clob content, String descn) {
		this.id = id;
		this.documentType = documentType;
		this.title = title;
		this.author = author;
		this.content = content;
		this.descn = descn;
	}

	@Id
	@Column(name = "ID", unique = true, nullable = false, precision = 10, scale = 0)
	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "DOCUMENT_TYPE")
	public DocumentType getDocumentType() {
		return this.documentType;
	}

	public void setDocumentType(DocumentType documentType) {
		this.documentType = documentType;
	}

	@Column(name = "TITLE", length = 510)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "AUTHOR", length = 200)
	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Column(name = "CONTENT")
	public Clob getContent() {
		return this.content;
	}

	public void setContent(Clob content) {
		this.content = content;
	}

	@Column(name = "DESCN", length = 510)
	public String getDescn() {
		return this.descn;
	}

	public void setDescn(String descn) {
		this.descn = descn;
	}

}
