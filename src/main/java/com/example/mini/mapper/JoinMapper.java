package com.example.mini.mapper;

import java.util.HashMap;
import org.apache.ibatis.annotations.Mapper;
import com.example.mini.model.Join;

@Mapper
public interface JoinMapper {
	//회원가입
	void insertUser(HashMap<String, Object> map);
	
	//id체크(회원가입)
	int selectIdChk(HashMap<String, Object> map);
	
	//nick체크(회원가입)
	int selectNickChk(HashMap<String, Object> map);
	
	//email체크(회원가입)
	int selectEmailChk(HashMap<String, Object> map);
	
	//회원정보수정-페이지에 정보호출
	Join selectUserInfoPg(HashMap<String, Object> map);
	
	//nick체크(정보수정)
	int selectNickChk2(HashMap<String, Object> map);
	
	//email체크(회원가입)
	int selectEmailChk2(HashMap<String, Object> map);
	
	//회원정보 업데이트
	void updateUserInfo(HashMap<String, Object> map);

	// 로그인
	Join selectUserInfo(HashMap<String, Object> map);
	
	int selectUserCnt(HashMap<String, Object> map);

	
	// 아이디 찾기
	int findId(HashMap<String, Object> map);
	
	// 비밀번호 찾기
	int findPassword(HashMap<String, Object> map);
	
	// 회원정보 호출
	Join findUserInfo(HashMap<String, Object> map);
	
	// 비밀번호 변경
	Join updatePassword(HashMap<String, Object> map);
	

	
}


