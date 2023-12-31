package com.ict.admin.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class ReportVO {
	
	private String REPORT_NUM, REPORT_SUBJECT, REPORT_WRITER, REPORT_CONTENT, REPORT_FILE,
	REPORT_TYPE, REPORT_DATE, REPORT_ST,PROD_NUM, CLIENT_NUM, ADMIN_NUM,REPORT_GROUPS, REPORT_LEV,REPORT_STEP;
	
	public String getREPORT_STEP() {
		return REPORT_STEP;
	}

	public void setREPORT_STEP(String rEPORT_STEP) {
		REPORT_STEP = rEPORT_STEP;
	}

	public String getREPORT_GROUPS() {
		return REPORT_GROUPS;
	}

	public void setREPORT_GROUPS(String rEPORT_GROUPS) {
		REPORT_GROUPS = rEPORT_GROUPS;
	}

	public String getREPORT_LEV() {
		return REPORT_LEV;
	}

	public void setREPORT_LEV(String rEPORT_LEV) {
		REPORT_LEV = rEPORT_LEV;
	}

	public String getADMIN_NUM() {
		return ADMIN_NUM;
	}

	public void setADMIN_NUM(String aDMIN_NUM) {
		ADMIN_NUM = aDMIN_NUM;
	}

	private String REPORT_NICK;
	
	private MultipartFile file;

	public String getREPORT_NUM() {
		return REPORT_NUM;
	}

	public void setREPORT_NUM(String rEPORT_NUM) {
		REPORT_NUM = rEPORT_NUM;
	}

	public String getREPORT_SUBJECT() {
		return REPORT_SUBJECT;
	}

	public void setREPORT_SUBJECT(String rEPORT_SUBJECT) {
		REPORT_SUBJECT = rEPORT_SUBJECT;
	}

	public String getREPORT_WRITER() {
		return REPORT_WRITER;
	}

	public void setREPORT_WRITER(String rEPORT_WRITER) {
		REPORT_WRITER = rEPORT_WRITER;
	}

	public String getREPORT_CONTENT() {
		return REPORT_CONTENT;
	}

	public void setREPORT_CONTENT(String rEPORT_CONTENT) {
		REPORT_CONTENT = rEPORT_CONTENT;
	}

	public String getREPORT_FILE() {
		return REPORT_FILE;
	}

	public void setREPORT_FILE(String rEPORT_FILE) {
		REPORT_FILE = rEPORT_FILE;
	}

	public String getREPORT_TYPE() {
		return REPORT_TYPE;
	}

	public void setREPORT_TYPE(String rEPORT_TYPE) {
		REPORT_TYPE = rEPORT_TYPE;
	}

	public String getREPORT_DATE() {
		return REPORT_DATE;
	}

	public void setREPORT_DATE(String rEPORT_DATE) {
		REPORT_DATE = rEPORT_DATE;
	}

	public String getREPORT_ST() {
		return REPORT_ST;
	}

	public void setREPORT_ST(String rEPORT_ST) {
		REPORT_ST = rEPORT_ST;
	}

	public String getPROD_NUM() {
		return PROD_NUM;
	}

	public void setPROD_NUM(String pROD_NUM) {
		PROD_NUM = pROD_NUM;
	}

	public String getCLIENT_NUM() {
		return CLIENT_NUM;
	}

	public void setCLIENT_NUM(String cLIENT_NUM) {
		CLIENT_NUM = cLIENT_NUM;
	}

	public String getREPORT_NICK() {
		return REPORT_NICK;
	}

	public void setREPORT_NICK(String rEPORT_NICK) {
		REPORT_NICK = rEPORT_NICK;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

}
