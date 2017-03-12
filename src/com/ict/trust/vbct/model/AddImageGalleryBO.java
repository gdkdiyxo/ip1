package com.ict.trust.vbct.model;

public class AddImageGalleryBO {
	
	private String   gallery_id, album_id, gallery_img, upd_dt, upd_usr, crt_dt, crt_usr, status;

	public String getGallery_id() {
		return gallery_id;
	}

	public void setGallery_id(String gallery_id) {
		this.gallery_id = gallery_id;
	}

	public String getAlbum_id() {
		return album_id;
	}

	public void setAlbum_id(String album_id) {
		this.album_id = album_id;
	}

	public String getGallery_img() {
		return gallery_img;
	}

	public void setGallery_img(String gallery_img) {
		this.gallery_img = gallery_img;
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
	
	private Long count;

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}
	
	
	
}
