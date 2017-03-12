package com.ict.trust.vbct.model;

public class CommonDTO {

	private StudentCertificateBo certi = new StudentCertificateBo();
	private StudentEducationBo edu = new StudentEducationBo();
	private StudentInfoBo info = new StudentInfoBo();
	private StudentWorkBo work = new StudentWorkBo();
	public StudentCertificateBo getCerti() {
		return certi;
	}
	public void setCerti(StudentCertificateBo certi) {
		this.certi = certi;
	}
	public StudentEducationBo getEdu() {
		return edu;
	}
	public void setEdu(StudentEducationBo edu) {
		this.edu = edu;
	}
	public StudentInfoBo getInfo() {
		return info;
	}
	public void setInfo(StudentInfoBo info) {
		this.info = info;
	}
	public StudentWorkBo getWork() {
		return work;
	}
	public void setWork(StudentWorkBo work) {
		this.work = work;
	}
	
	
	
}
