package com.myspring.tibet.admin.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.myspring.tibet.utils.Criteria;

@Service("adminMemberService")
public interface AdminMemberService {
	// 회원 상세
	
	// 회원관리 페이징
	public List<Map<String, Object>> selectAllmemberList(Criteria cri);
	// 회원 목록
	public int countMemberList();
	// 회원 강제탈퇴
	public void memberDelete(String user_id);
}
