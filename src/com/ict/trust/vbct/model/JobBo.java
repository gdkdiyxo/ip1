package com.ict.trust.vbct.model;

public class JobBo {
private int job_id,salary,company_id;
public int getCompany_id() {
	return company_id;
}
public void setCompany_id(int company_id) {
	this.company_id = company_id;
}
public String job_position,description,requirements,responsibilities,job_skill,internship_type;
public String getJob_skill() {
	return job_skill;
}
public void setJob_skill(String job_skill) {
	this.job_skill = job_skill;
}
public String getInternship_type() {
	return internship_type;
}
public void setInternship_type(String internship_type) {
	this.internship_type = internship_type;
}
public int getJob_id() {
	return job_id;
}
public void setJob_id(int job_id) {
	this.job_id = job_id;
}
public String getJob_position() {
	return job_position;
}
public void setJob_position(String job_position) {
	this.job_position = job_position;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getRequirements() {
	return requirements;
}
public void setRequirements(String requirements) {
	this.requirements = requirements;
}
public int getSalary() {
	return salary;
}
public void setSalary(int salary) {
	this.salary = salary;
}
public String getResponsibilities() {
	return responsibilities;
}
public void setResponsibilities(String responsibilities) {
	this.responsibilities = responsibilities;
}
}
