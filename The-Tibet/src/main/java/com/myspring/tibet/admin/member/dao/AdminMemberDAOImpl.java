package com.myspring.tibet.admin.member.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myspring.tibet.board.dao.BoardDAOImpl;
import com.myspring.tibet.utils.Criteria;

@Repository("adminMemberDAO")
public class AdminMemberDAOImpl implements AdminMemberDAO {
	@Inject
	private SqlSession sqlSession;
	protected Log log = LogFactory.getLog(BoardDAOImpl.class);

	protected void printQueryId(String queryId) {
		if (log.isDebugEnabled()) {
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}
	
	@SuppressWarnings("rawtypes")
    public List selectList(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.selectList(queryId,params);
    }
	
	// 회원 목록
	public int countMemberList() {
		return (Integer) sqlSession.selectOne("mapper.admin.member.countMemberList");
	}
	
	// 회원 강제탈퇴
	public void memberDelete(String user_id) {
		sqlSession.delete("mapper.admin.member.memberDelete", user_id);
	}
	
	// 회원관리 페이징
	@SuppressWarnings("unchecked") 
	@Override
	public List<Map<String, Object>> selectAllmemberList(Criteria cri) {
		return (List<Map<String,Object>>)selectList("mapper.admin.member.selectAllmemberList", cri);
	}
}