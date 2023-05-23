package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.Join;

public interface JoinService {
	
	//회원가입
	void addUser(HashMap<String, Object> map);
	
	// id체크(회원가입)
	int searchIdChk(HashMap<String, Object> map);
	
	// nick체크(회원가입)
	int searchNickChk(HashMap<String, Object> map);
	
	// email체크(회원가입)
	int searchEmailChk(HashMap<String, Object> map);
	
	//회원정보수정-정보호출
	Join getUserInfoPg(HashMap<String, Object> map);
	
	// nick체크(정보수정)
	int searchNickChk2(HashMap<String, Object> map);
	
	// email체크(정보수정)
	int searchEmailChk2(HashMap<String, Object> map);
	
	//회원정보 업데이트
	void editUserInfo(HashMap<String, Object> map);
	
	// 로그인
	HashMap<String, Object> searchUserInfo(HashMap<String, Object> map);
	
	int searchUserCnt(HashMap<String, Object> map);
		
	// 아이디 찾기 유저정보 가져오기
	HashMap<String, Object> IdUserInfo(HashMap<String, Object> map);
		
	// 비밀번호 찾기 유저정보 가져오기
	HashMap<String, Object> sUserInfo(HashMap<String, Object> map);

	// 비밀번호 변경
	void updatePw(HashMap<String, Object> map);

}
