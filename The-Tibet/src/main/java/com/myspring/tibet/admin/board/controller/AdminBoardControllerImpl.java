package com.myspring.tibet.admin.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.admin.board.service.AdminBoardSerivce;
import com.myspring.tibet.board.vo.NoticeVO;
import com.myspring.tibet.board.vo.QnaVO;
import com.myspring.tibet.utils.PageMaker;
import com.myspring.tibet.utils.SearchCriteria;

@Controller("adminBoardController")
public class AdminBoardControllerImpl implements AdminBoardController {
	@Autowired
	private AdminBoardSerivce adminBoardSerivce;
	@Autowired
	private NoticeVO noticeVO;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminBoardController.class);
	
	// 공지사항 페이징+검색 목록
	@Override
	@RequestMapping(value = "/admin-notice.do", method = RequestMethod.GET)
	public ModelAndView openNoticeList(SearchCriteria scri, HttpServletRequest request) throws Exception {
		logger.info("admin-notice.do");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminBoardSerivce.adminopenNoticeList(scri));
		List<NoticeVO> list = adminBoardSerivce.selectAllNoticesList(scri);
		mav.addObject("list", list);
		mav.addObject("pageMaker", pageMaker);
		return mav;
	}

	// 공지사항 삭제
	@Override
	@RequestMapping(value = "/noticedelete", method = RequestMethod.GET)
	public String noticedelete(String notice_num) throws Exception {
		adminBoardSerivce.noticedelete(notice_num);
		return "redirect:/admin-notice.do"; 
	}
	 
	// 공지사항 선택삭제
  	@Override
	@RequestMapping(value = "/noticedelete")
	public String alldelete(HttpServletRequest request) throws Exception {
  		String[] ajaxMsg = request.getParameterValues("valueArr");
  		int size = ajaxMsg.length;
  		for(int i=0; i < size; i++) {
  			System.out.println("valueArr:"+ajaxMsg[i]);
  			adminBoardSerivce.noticedelete(ajaxMsg[i]);
  		}
		return "redirect:/admin-notice.do";
	}
	
	// 공지사항 글쓰기
	@Override
	@RequestMapping(value = "/admin-noticeWrt.do", method = RequestMethod.POST)
	public ResponseEntity insertNoticeWritePage(@ModelAttribute("noticeVO") NoticeVO _noticeVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			adminBoardSerivce.insertNoticeWritePage(_noticeVO);
			message = "<script>";
			message += " alert('글 작성이 완료되었습니다. 원래 페이지로 돌아갑니다.');";
			message += " location.href='" + request.getContextPath() + "/admin-notice.do';";
			message += " </script>";

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/noticeWrite.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	// 공지사항 수정
	@Override
	@RequestMapping(value = "/noticeModify.do", method = RequestMethod.POST)
	public ResponseEntity modifynotice(NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		System.out.println("컨트롤러 : " + noticeVO.getNotice_content());
		System.out.println("컨트롤러 : " + noticeVO.getNotice_num());
		System.out.println("컨트롤러 : " + noticeVO.getNotice_title());
		try {
			adminBoardSerivce.modifynotice(noticeVO);
			message = "<script>";
			message += " alert('글 수정이 완료되었습니다. 원래 페이지로 돌아갑니다.');";
			message += " location.href='" + request.getContextPath() + "/admin-notice.do';";
			message += " </script>";

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/admin-noticeModify.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}	 

	// 공지사항 수정 페이지
	@Override
	@RequestMapping(value = "/noticeModifyForm{notice_num}.do", method = RequestMethod.GET)
	public ModelAndView noticeModifyForm(@PathVariable("notice_num") Integer notice_num, ModelAndView mav) throws Exception {
		mav.setViewName("/noticeModifyForm");
		mav.addObject("notice", adminBoardSerivce.adminnoticeDetail(notice_num));
		return mav;
	}

	// 공지사항 글쓰기 페이지
	@Override
	@RequestMapping(value = "/noticeWrite.do", method = RequestMethod.GET)
	public ModelAndView noticeWrite(ModelAndView mav) throws Exception {
		mav.setViewName("/admin-noticeWrite");
		return mav;
	}
	// 공지사항 상세 페이지
	@Override
	@RequestMapping(value = "/admin-noticeDetail{notice_num}.do", method = RequestMethod.GET)
	public ModelAndView adminnoticeDetail(@PathVariable("notice_num") Integer notice_num, ModelAndView mav)
			throws Exception {
		mav.setViewName("/admin-noticeDetail");
		mav.addObject("notice", adminBoardSerivce.adminnoticeDetail(notice_num));
		return mav;
	}
}