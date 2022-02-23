package com.myspring.tibet.admin.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.member.vo.MemberVO;

public interface AdminMemberController {
	public ModelAndView memberModifyForm(@PathVariable("user_id") String user_id, ModelAndView mav,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity memberModify(MemberVO _memberVO, HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception;
}
