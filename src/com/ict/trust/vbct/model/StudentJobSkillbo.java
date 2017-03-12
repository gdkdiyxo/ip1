package com.ict.trust.vbct.model;

public class StudentJobSkillbo {
	private int student_job_id;
	private int job_id;
	private int student_id;
	private int student_skill_id,skill_id;
	private String skill_name;
	public int getStudent_job_id() {
		return student_job_id;
	}
	public void setStudent_job_id(int student_job_id) {
		this.student_job_id = student_job_id;
	}
	public int getJob_id() {
		return job_id;
	}
	public void setJob_id(int job_id) {
		this.job_id = job_id;
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public int getStudent_skill_id() {
		return student_skill_id;
	}
	public void setStudent_skill_id(int student_skill_id) {
		this.student_skill_id = student_skill_id;
	}
	public int getSkill_id() {
		return skill_id;
	}
	public void setSkill_id(int skill_id) {
		this.skill_id = skill_id;
	}
	public String getSkill_name() {
		return skill_name;
	}
	public void setSkill_name(String skill_name) {
		this.skill_name = skill_name;
	}

}
