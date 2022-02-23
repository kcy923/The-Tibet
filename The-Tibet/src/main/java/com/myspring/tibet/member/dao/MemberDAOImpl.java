package com.myspring.tibet.member.dao;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.tibet.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;	
	// ����� �ڵ�
	private static final String NS = "mapper.member";
	private static final String GET_BY_SNS_NAVER = NS + ".getBySnsNaver";
	private static final String GET_BY_SNS_GOOGLE = NS + ".getBySnsGoogle";
	
	@Override
	public MemberVO login(Map loginMap) throws DataAccessException{
		MemberVO member = (MemberVO)sqlSession.selectOne("mapper.member.login", loginMap);
	    return member;
	}
	
	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException{
		sqlSession.insert("mapper.member.insertNewMember", memberVO);
	}

	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.member.selectOverlappedID", id);
		return result;
	}

	@Override
	public MemberVO findID(MemberVO memberVO) throws DataAccessException {
		MemberVO member = sqlSession.selectOne("mapper.member.findID", memberVO);
		return member;
	}

	@Override
	public MemberVO findPW(MemberVO memberVO) throws DataAccessException {
		MemberVO member = sqlSession.selectOne("mapper.member.findPW", memberVO);
		return member;
	}
	
	// 회원탈퇴
	@Override
	public void deleteMember(MemberVO vo) throws Exception {
		sqlSession.delete("mapper.member.deleteMember", vo);
	}
	
	@Override
	public MemberVO modifyMemberForm(String user_id) {
		return sqlSession.selectOne("mapper.member.modifyMemberForm", user_id);
	}
	
	@Override
	public int modifyMember(MemberVO vo) throws Exception {	
		return sqlSession.update("mapper.member.modifyMember", vo);		
	}

	// SNS관련 기능들
//	@Override 
//	public MemberVO getBySns(MemberVO memberVO) throws DataAccessException { 
//		MemberVO member = sqlSession.selectOne("mapper.member.getBySnsNaver", memberVO); 
//		return member; 
//	}
	  
	@Override
	public MemberVO getBySns(MemberVO snsUser) {
		if (StringUtils.isNotEmpty(snsUser.getNaverid())) {
			return sqlSession.selectOne(GET_BY_SNS_NAVER, snsUser.getNaverid());
		} else {
			return sqlSession.selectOne(GET_BY_SNS_GOOGLE, snsUser.getGoogleid());
		}
	}

	@Override
	public int updatePoint(Map<String, Object> map) throws DataAccessException {
		return sqlSession.update("mapper.member.updatePoint", map);
	}
}
