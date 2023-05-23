package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.Join;

public interface JoinService {
	
	//회원가입
	void addUser(HashMap<String, Object> map);
	
	// 중복체크
	int searchUserChk(HashMap<String, Object> map);
	
	//회원정보수정-정보호출
	Join getUserInfoPg(HashMap<String, Object> map);
	
	//회원정보 업데이트
	void editUserInfo(HashMap<String, Object> map);
	
	// 로그인
	HashMap<String, Object> searchUserInfo(HashMap<String, Object> map);
	
	int searchUserCnt(HashMap<String, Object> map);
	
	// 마이페이지 정보 호출
	Join searchMyPageUser(HashMap<String, Object> map);
		
	// 아이디 찾기 유저정보 가져오기
	HashMap<String, Object> IdUserInfo(HashMap<String, Object> map);
		
	// 비밀번호 찾기 유저정보 가져오기
	HashMap<String, Object> sUserInfo(HashMap<String, Object> map);

	// 비밀번호 변경
	void updatePw(HashMap<String, Object> map);

}
