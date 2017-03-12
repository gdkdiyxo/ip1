package com.ict.trust.vbct.model;

public class StudentEducationBo {
private int stu_edu_id,student_id;
private String degree_type,major,university,university_location,degree_gpa;
public int getStu_edu_id() {
	return stu_edu_id;
}
public void setStu_edu_id(int stu_edu_id) {
	this.stu_edu_id = stu_edu_id;
}
public int getStudent_id() {
	return student_id;
}
public void setStudent_id(int student_id) {
	this.student_id = student_id;
}
public String getDegree_type() {
	return degree_type;
}
public void setDegree_type(String degree_type) {
	this.degree_type = degree_type;
}
public String getMajor() {
	return major;
}
public void setMajor(String major) {
	this.major = major;
}
public String getDegree_gpa() {
	return degree_gpa;
}
public void setDegree_gpa(String gpa1) {
	this.degree_gpa = gpa1;
}
public String getUniversity() {
	return university;
}
public void setUniversity(String university) {
	this.university = university;
}
public String getUniversity_location() {
	return university_location;
}
public void setUniversity_location(String university_location) {
	this.university_location = university_location;
}
}
