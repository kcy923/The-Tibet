package com.myspring.tibet.admin.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.tibet.board.vo.NoticeVO;
import com.myspring.tibet.utils.SearchCriteria;

@Repository("adminBoardDAO")
public class AdminBoardDAOImpl  implements AdminBoardDAO {
	@Inject
    private SqlSession sqlSession;
	
	// 공지사항 글쓰기
	@Override
	public void insertNoticeWritePage(NoticeVO noticeVO) throws DataAccessException{
		sqlSession.insert("mapper.admin.board.insertNoticeWritePage", noticeVO);
	}
	
	// 공지사항 상세
	@Override
	public NoticeVO adminnoticeDetail(Integer notice_num) {
		return sqlSession.selectOne("mapper.admin.board.adminnoticeDetail",notice_num);
	}
	
	// 공지사항 수정
	@Override
	public int modifynotice(NoticeVO noticeVO) {
		return sqlSession.update("mapper.admin.board.modifynotice", noticeVO);
	} 
		
	// 공지사항 선택삭제
	@Override
	public void noticedelete(String notice_num) {
		sqlSession.delete("mapper.admin.board.noticedelete", notice_num);
	}
	
	// 공지사항 페이징
	@Override
	public List<NoticeVO> selectAllNoticesList(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("mapper.admin.board.selectAllNoticesList", scri);
	}
		
	// 공지사항 목록
	@Override
	public int adminopenNoticeList(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("mapper.admin.board.adminopenNoticeList");
	}
}
