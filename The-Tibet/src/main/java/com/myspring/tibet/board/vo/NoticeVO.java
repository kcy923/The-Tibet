package com.myspring.tibet.board.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("noticeVO")
public class NoticeVO {
	private Integer notice_num;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private String notice_img1;
	private String notice_img2;
	private String notice_img3;
	private String user_id;
	
	public Integer getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(Integer notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_img1() {
		return notice_img1;
	}
	public void setNotice_img1(String notice_img1) {
		this.notice_img1 = notice_img1;
	}
	public String getNotice_img2() {
		return notice_img2;
	}
	public void setNotice_img2(String notice_img2) {
		this.notice_img2 = notice_img2;
	}
	public String getNotice_img3() {
		return notice_img3;
	}
	public void setNotice_img3(String notice_img3) {
		this.notice_img3 = notice_img3;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
