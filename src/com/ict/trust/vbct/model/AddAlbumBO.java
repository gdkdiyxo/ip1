package com.ict.trust.vbct.model;

public class AddAlbumBO {

	private String album_id,album_name,album_title_img,upd_dt,upd_usr,crt_dt,crt_usr;
	private String status="N";
	
	public String getAlbum_id() {
		return album_id;
	}
	public void setAlbum_id(String album_id) {
		this.album_id = album_id;
	}
	public String getAlbum_name() {
		return album_name;
	}
	public void setAlbum_name(String album_name) {
		this.album_name = album_name;
	}
	public String getAlbum_title_img() {
		return album_title_img;
	}
	public void setAlbum_title_img(String album_title_img) {
		this.album_title_img = album_title_img;
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
	
	Long count;

	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	
	
}
