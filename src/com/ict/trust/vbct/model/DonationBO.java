package com.ict.trust.vbct.model;

public class DonationBO {
	
	private String donor_id, donor_name, donation_purpose, donation_amount, country, mobile_number, email,upd_dt ,
	upd_usr ,
	crt_dt ,
	crt_usr,status;
	private String receipt_no,receipt_dt,pay_mode,std_code,remarks,address;
	
	

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getReceipt_no() {
		return receipt_no;
	}

	public void setReceipt_no(String receipt_no) {
		this.receipt_no = receipt_no;
	}

	public String getReceipt_dt() {
		return receipt_dt;
	}

	public void setReceipt_dt(String receipt_dt) {
		this.receipt_dt = receipt_dt;
	}

	public String getPay_mode() {
		return pay_mode;
	}

	public void setPay_mode(String pay_mode) {
		this.pay_mode = pay_mode;
	}

	public String getStd_code() {
		return std_code;
	}

	public void setStd_code(String std_code) {
		this.std_code = std_code;
	}

	public String getDonor_id() {
		return donor_id;
	}

	public void setDonor_id(String donor_id) {
		this.donor_id = donor_id;
	}

	public String getDonor_name() {
		return donor_name;
	}

	public void setDonor_name(String donor_name) {
		this.donor_name = donor_name;
	}

	public String getDonation_purpose() {
		return donation_purpose;
	}

	public void setDonation_purpose(String donation_purpose) {
		this.donation_purpose = donation_purpose;
	}

	public String getDonation_amount() {
		return donation_amount;
	}

	public void setDonation_amount(String donation_amount) {
		this.donation_amount = donation_amount;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getMobile_number() {
		return mobile_number;
	}

	public void setMobile_number(String mobile_number) {
		this.mobile_number = mobile_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUpd_dt() {
		return upd_dt;
	}

	public void setUpd_dt(String upd_dt) {
		this.upd_dt = upd_dt;
	}

	public String getUpd_usr() {
		return upd_usr;
	}

	public void setUpd_usr(String upd_usr) {
		this.upd_usr = upd_usr;
	}

	public String getCrt_dt() {
		return crt_dt;
	}

	public void setCrt_dt(String crt_dt) {
		this.crt_dt = crt_dt;
	}

	public String getCrt_usr() {
		return crt_usr;
	}

	public void setCrt_usr(String crt_usr) {
		this.crt_usr = crt_usr;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	

}
