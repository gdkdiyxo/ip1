package com.ict.trust.vbct.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.ict.trust.vbct.model.DonationBO;

public class CustomJasperReportDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5367718490585462235L;
	
	private String jasperId;
	private String jasperTitle;
	private String date;
	private String ipAddress;
	private String heading;
	private String status;
	private String imagePath;
	private String imagePath2;
	private String backimagePath;
	
	public String getBackimagePath() {
		return backimagePath;
	}
	public void setBackimagePath(String backimagePath) {
		this.backimagePath = backimagePath;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getImagePath2() {
		return imagePath2;
	}
	public void setImagePath2(String imagePath2) {
		this.imagePath2 = imagePath2;
	}
	public List<DonationBO> getLstDonationBO() {
		return lstDonationBO;
	}
	public void setLstDonationBO(List<DonationBO> lstDonationBO) {
		this.lstDonationBO = lstDonationBO;
	}
	List<DonationBO> lstDonationBO = new ArrayList<DonationBO>();
	
	public String getJasperId() {
		return jasperId;
	}
	public void setJasperId(String jasperId) {
		this.jasperId = jasperId;
	}
	public String getJasperTitle() {
		return jasperTitle;
	}
	public void setJasperTitle(String jasperTitle) {
		this.jasperTitle = jasperTitle;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public String getHeading() {
		return heading;
	}
	public void setHeading(String heading) {
		this.heading = heading;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
