package com.myspring.tibet.admin.board.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.tibet.board.vo.NoticeVO;
import com.myspring.tibet.utils.SearchCriteria;

public interface AdminBoardDAO {
	// 공지사항 글쓰기
	public void insertNoticeWritePage(NoticeVO noticeVO) throws DataAccessException;
	// 공지사항 상세
	public NoticeVO adminnoticeDetail(Integer notice_num);
	// 공지사항 수정
	public int modifynotice(NoticeVO noticeVO);
	// 공지사항 삭제
    public void noticedelete(String notice_num); 
    // 공지사항 페이징
    public  List<NoticeVO> selectAllNoticesList(SearchCriteria scri) throws Exception;
	// 공지사항 목록
	public int adminopenNoticeList(SearchCriteria scri) throws Exception;
}
