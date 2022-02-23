package com.myspring.tibet.board.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("qnacommentVO")
public class QnaCommentVO {
	private int qna_comment_num;
	private String qna_comment_content;
	private Date qna_comment_date;
	private Integer qna_num;
	private String user_id;
	
	public int getQna_comment_num() {
		return qna_comment_num;
	}
	public void setQna_comment_num(int qna_comment_num) {
		this.qna_comment_num = qna_comment_num;
	}
	public String getQna_comment_content() {
		return qna_comment_content;
	}
	public void setQna_comment_content(String qna_comment_content) {
		this.qna_comment_content = qna_comment_content;
	}
	public Date getQna_comment_date() {
		return qna_comment_date;
	}
	public void setQna_comment_date(Date qna_comment_date) {
		this.qna_comment_date = qna_comment_date;
	}
	public Integer getQna_num() {
		return qna_num;
	}
	public void setQna_num(Integer qna_num) {
		this.qna_num = qna_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
