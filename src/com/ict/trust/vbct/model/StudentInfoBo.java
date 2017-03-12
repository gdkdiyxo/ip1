
package com.ict.trust.vbct.model;

public class StudentInfoBo {
private int student_id,year,id;
private String fname,lname,mname,stu_email,stu_telephone,gender,canada_status;
private String semester,internship_status,student_status="Available",country;
public String getCountry() {
	return country;
}
public void setCountry(String country) {
	this.country = country;
}
public String getStudent_status() {
	return student_status;
}
public void setStudent_status(String student_status) {
	this.student_status = student_status;
}
public int getStudent_id() {
	return student_id;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public void setStudent_id(int student_id) {
	this.student_id = student_id;
}
public int getYear() {
	return year;
}
public void setYear(int year) {
	this.year = year;
}
public String getFname() {
	return fname;
}
public void setFname(String fname) {
	this.fname = fname;
}
public String getLname() {
	return lname;
}
public void setLname(String lname) {
	this.lname = lname;
}
public String getMname() {
	return mname;
}
public void setMname(String mname) {
	this.mname = mname;
}
public String getStu_email() {
	return stu_email;
}
public void setStu_email(String stu_email) {
	this.stu_email = stu_email;
}
public String getStu_telephone() {
	return stu_telephone;
}
public void setStu_telephone(String stu_telephone) {
	this.stu_telephone = stu_telephone;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getCanada_status() {
	return canada_status;
}
public void setCanada_status(String canada_status) {
	this.canada_status = canada_status;
}
public String getSemester() {
	return semester;
}
public void setSemester(String semester) {
	this.semester = semester;
}
public String getInternship_status() {
	return internship_status;
}
public void setInternship_status(String internship_status) {
	this.internship_status = internship_status;
}



}
