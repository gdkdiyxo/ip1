package com.ict.trust.vbct.model;

public class StudentCertificateBo {
private int certificate_id;
private String certificate_title,certificate_body,student_id;
public int getCertificate_id() {
	return certificate_id;
}
public void setCertificate_id(int certificate_id) {
	this.certificate_id = certificate_id;
}
public String getStudent_id() {
	return student_id;
}
public void setStudent_id(String student_id) {
	this.student_id = student_id;
}
public String getCertificate_title() {
	return certificate_title;
}
public void setCertificate_title(String certificate_title) {
	this.certificate_title = certificate_title;
}
public String getCertificate_body() {
	return certificate_body;
}
public void setCertificate_body(String certificate_body) {
	this.certificate_body = certificate_body;
}

}
