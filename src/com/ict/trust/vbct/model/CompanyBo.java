package com.ict.trust.vbct.model;

public class CompanyBo {
	private int company_id;
	private String company_name,address,city,postal_code,country,contact_pearson_fname,contact_person_lname;
	private String contact_pearson_position,telephone,email,company_website,notes;
	public int getCompany_id() {
		return company_id;
	}
	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPostal_code() {
		return postal_code;
	}
	public void setPostal_code(String postal_code) {
		this.postal_code = postal_code;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getContact_pearson_fname() {
		return contact_pearson_fname;
	}
	public void setContact_pearson_fname(String contact_pearson_fname) {
		this.contact_pearson_fname = contact_pearson_fname;
	}
	public String getContact_person_lname() {
		return contact_person_lname;
	}
	public void setContact_person_lname(String contact_person_lname) {
		this.contact_person_lname = contact_person_lname;
	}
	public String getContact_pearson_position() {
		return contact_pearson_position;
	}
	public void setContact_pearson_position(String contact_pearson_position) {
		this.contact_pearson_position = contact_pearson_position;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCompany_website() {
		return company_website;
	}
	public void setCompany_website(String company_website) {
		this.company_website = company_website;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
}
