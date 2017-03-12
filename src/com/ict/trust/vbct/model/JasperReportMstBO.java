package com.ict.trust.vbct.model;

import java.io.Serializable;

public class JasperReportMstBO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8927655067828368236L;
	private String jasper_rep_id;
	private String rep_title;
	private String jasper_id;
	private String jasper_decs;
	private String rep_name;
	private String jasper_heading;
	private String status;
	private String upd_dt;
	private String upd_usr;
	private String crt_dt;
	private String crt_usr;
	private byte[] jasper_data;
	
	
	public byte[] getJasper_data() {
		return jasper_data;
	}
	public void setJasper_data(byte[] jasper_data) {
		this.jasper_data = jasper_data;
	}
	public String getJasper_rep_id() {
		return jasper_rep_id;
	}
	public void setJasper_rep_id(String jasper_rep_id) {
		this.jasper_rep_id = jasper_rep_id;
	}
	public String getRep_title() {
		return rep_title;
	}
	public void setRep_title(String rep_title) {
		this.rep_title = rep_title;
	}
	public String getJasper_id() {
		return jasper_id;
	}
	
	public void setJasper_id(String jasper_id) {
		this.jasper_id = jasper_id;
	}
	public String getJasper_decs() {
		return jasper_decs;
	}
	public void setJasper_decs(String jasper_decs) {
		this.jasper_decs = jasper_decs;
	}
	public String getRep_name() {
		return rep_name;
	}
	public void setRep_name(String rep_name) {
		this.rep_name = rep_name;
	}
	public String getJasper_heading() {
		return jasper_heading;
	}
	public void setJasper_heading(String jasper_heading) {
		this.jasper_heading = jasper_heading;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	
}
