package com.ict.trust.vbct.model;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class BalanceSheetBO {
	private String sheet_id,sheet_title,sheet_year,upd_dt,upd_usr,crt_dt,crt_usr;
	private String status = "N";
	private CommonsMultipartFile file;
	private byte[] sheet_data;
	
	
	public byte[] getSheet_data() {
		return sheet_data;
	}
	public void setSheet_data(byte[] sheet_data) {
		this.sheet_data = sheet_data;
	}
	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
	public String getSheet_id() {
		return sheet_id;
	}
	public void setSheet_id(String sheet_id) {
		this.sheet_id = sheet_id;
	}
	public String getSheet_title() {
		return sheet_title;
	}
	public void setSheet_title(String sheet_title) {
		this.sheet_title = sheet_title;
	}
	public String getSheet_year() {
		return sheet_year;
	}
	public void setSheet_year(String sheet_year) {
		this.sheet_year = sheet_year;
	}
	public String getUpd_dt() {
		return upd_dt;
	}
	public void setUpd_dt(String upd_dt) {
		this.upd_dt = upd_dt;
	}
	public String getUpd_usr() {
		return upd_usr;
	}
	public void setUpd_usr(String upd_usr) {
		this.upd_usr = upd_usr;
	}
	public String getCrt_dt() {
		return crt_dt;
	}
	public void setCrt_dt(String crt_dt) {
		this.crt_dt = crt_dt;
	}
	public String getCrt_usr() {
		return crt_usr;
	}
	public void setCrt_usr(String crt_usr) {
		this.crt_usr = crt_usr;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
