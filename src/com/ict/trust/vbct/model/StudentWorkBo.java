package com.ict.trust.vbct.model;

import java.util.Date;

public class StudentWorkBo {
private int stu_work_id,student_id;
private String start_date,end_date;
private String company,company_location,position;
public int getStu_work_id() {
	return stu_work_id;
}
public void setStu_work_id(int stu_work_id) {
	this.stu_work_id = stu_work_id;
}
public int getStudent_id() {
	return student_id;
}
public void setStudent_id(int student_id) {
	this.student_id = student_id;
}
public String getStart_date() {
	return start_date;
}
public void setStart_date(String start_date) {
	this.start_date = start_date;
}
public String getEnd_date() {
	return end_date;
}
public void setEnd_date(String end_date) {
	this.end_date = end_date;
}
public String getCompany() {
	return company;
}
public void setCompany(String company) {
	this.company = company;
}
public String getCompany_location() {
	return company_location;
}
public void setCompany_location(String company_location) {
	this.company_location = company_location;
}
public String getPosition() {
	return position;
}
public void setPosition(String position) {
	this.position = position;
}
}
