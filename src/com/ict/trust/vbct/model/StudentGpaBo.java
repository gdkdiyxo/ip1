package com.ict.trust.vbct.model;

public class StudentGpaBo {
	private int student_id,year,id;
	private String fname,lname,mname,stu_email,stu_telephone,gender,canada_status;
	private String semester,internship_status,student_status,country;
	private int stu_edu_id;
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	public int getStudent_id() {
		return student_id;
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getStudent_status() {
		return student_status;
	}
	public void setStudent_status(String student_status) {
		this.student_status = student_status;
	}
	public int getStu_edu_id() {
		return stu_edu_id;
	}
	public void setStu_edu_id(int stu_edu_id) {
		this.stu_edu_id = stu_edu_id;
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
	public String getDegree_gpa() {
		return degree_gpa;
	}
	public void setDegree_gpa(String degree_gpa) {
		this.degree_gpa = degree_gpa;
	}
	private String degree_type,major,university,university_location,degree_gpa;
}
