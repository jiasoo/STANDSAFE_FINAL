package com.ict.admin.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {

	private String NOTICE_NUM, NOTICE_SUBJECT, NOTICE_TYPE, NOTICE_WRITER, NOTICE_CONTENT, NOTICE_HIT,
					NOTICE_DATE, NOTICE_UPDATE, NOTICE_ST, NOTICE_FILE, ADMIN_NUM, allcount, delcount, regcount;
	
	public String getAllcount() {
		return allcount;
	}

	public void setAllcount(String allcount) {
		this.allcount = allcount;
	}

	public String getDelcount() {
		return delcount;
	}

	public void setDelcount(String delcount) {
		this.delcount = delcount;
	}

	public String getRegcount() {
		return regcount;
	}

	public void setRegcount(String regcount) {
		this.regcount = regcount;
	}

	private MultipartFile file;

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getNOTICE_NUM() {
		return NOTICE_NUM;
	}

	public void setNOTICE_NUM(String nOTICE_NUM) {
		NOTICE_NUM = nOTICE_NUM;
	}

	public String getNOTICE_SUBJECT() {
		return NOTICE_SUBJECT;
	}

	public void setNOTICE_SUBJECT(String nOTICE_SUBJECT) {
		NOTICE_SUBJECT = nOTICE_SUBJECT;
	}

	public String getNOTICE_TYPE() {
		return NOTICE_TYPE;
	}

	public void setNOTICE_TYPE(String nOTICE_TYPE) {
		NOTICE_TYPE = nOTICE_TYPE;
	}

	public String getNOTICE_WRITER() {
		return NOTICE_WRITER;
	}

	public void setNOTICE_WRITER(String nOTICE_WRITER) {
		NOTICE_WRITER = nOTICE_WRITER;
	}

	public String getNOTICE_CONTENT() {
		return NOTICE_CONTENT;
	}

	public void setNOTICE_CONTENT(String nOTICE_CONTENT) {
		NOTICE_CONTENT = nOTICE_CONTENT;
	}

	public String getNOTICE_HIT() {
		return NOTICE_HIT;
	}

	public void setNOTICE_HIT(String nOTICE_HIT) {
		NOTICE_HIT = nOTICE_HIT;
	}

	public String getNOTICE_DATE() {
		return NOTICE_DATE;
	}

	public void setNOTICE_DATE(String nOTICE_DATE) {
		NOTICE_DATE = nOTICE_DATE;
	}

	public String getNOTICE_UPDATE() {
		return NOTICE_UPDATE;
	}

	public void setNOTICE_UPDATE(String nOTICE_UPDATE) {
		NOTICE_UPDATE = nOTICE_UPDATE;
	}

	public String getNOTICE_ST() {
		return NOTICE_ST;
	}

	public void setNOTICE_ST(String nOTICE_ST) {
		NOTICE_ST = nOTICE_ST;
	}

	public String getNOTICE_FILE() {
		return NOTICE_FILE;
	}

	public void setNOTICE_FILE(String nOTICE_FILE) {
		NOTICE_FILE = nOTICE_FILE;
	}

	public String getADMIN_NUM() {
		return ADMIN_NUM;
	}

	public void setADMIN_NUM(String aDMIN_NUM) {
		ADMIN_NUM = aDMIN_NUM;
	}


		
}
