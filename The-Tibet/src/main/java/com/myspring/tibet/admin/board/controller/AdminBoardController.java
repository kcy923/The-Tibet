package com.myspring.tibet.admin.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.board.vo.NoticeVO;
import com.myspring.tibet.utils.SearchCriteria;

public interface AdminBoardController {
	// 공지사항 글쓰기 페이지
	public ResponseEntity insertNoticeWritePage(@ModelAttribute("noticeVO") NoticeVO _noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 공지사항 글쓰기
	ModelAndView noticeWrite(ModelAndView mav) throws Exception;
	// 공지사항 상세
	public ModelAndView adminnoticeDetail(@PathVariable("notice_num") Integer notice_num, ModelAndView mav) throws Exception;
	// 공지사항 목록
	public ModelAndView openNoticeList(SearchCriteria scri, HttpServletRequest request) throws Exception;
	// 공지사항 삭제
	String noticedelete(String notice_num) throws Exception;
	// 공지사항 선택삭제
	String alldelete(HttpServletRequest request) throws Exception;
	// 공지사항 수정
	public ResponseEntity modifynotice(NoticeVO _noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 공지사항 수정 페이지
	public ModelAndView noticeModifyForm(@PathVariable("notice_num") Integer notice_num, ModelAndView mav) throws Exception;
}



