package com.example.mini.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.JoinMapper;
import com.example.mini.model.Join;

@Service
public class JoinServiceImpl implements JoinService {
	
	@Autowired
	JoinMapper joinMapper;
	
	// 로그인
	@Override
	public HashMap<String, Object> searchUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = joinMapper.selectUserCnt(map);
		if(cnt > 0){
			Join user = joinMapper.selectUserInfo(map);
			if(user != null) {
				resultMap.put("user", user);
				resultMap.put("result", "success");
				resultMap.put("message", "로그인 성공");
			} else {
				resultMap.put("result", "fail");
				resultMap.put("message", "패스워드를 다시 확인해주세요.");
			}
		} else {
			resultMap.put("result", "fail");
			resultMap.put("message", "아이디가 존재하지 않습니다.");
		}
		return resultMap;
	}
		
	@Override
	public int searchUserCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return joinMapper.selectUserCnt(map);
	}
	
	// 회원가입
	@Override
	public void addUser(HashMap<String, Object> map) {
		joinMapper.insertUser(map);
	}
	
	//회원가입,회원정보수정-중복체크(아이디, 닉네임, 이메일)
	@Override
	public int searchUserChk(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return joinMapper.selectUserChk(map);
	}
	
	//회원정보 업데이트
	@Override
	public void editUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		joinMapper.updateUserInfo(map);
	}

	// 마이페이지 정보 호출
	@Override
	public Join searchMyPageUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return joinMapper.selectMyPageUser(map);
	}
	
	// 아이디 찾기
	@Override
	public HashMap<String, Object> IdUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = joinMapper.findId(map);
		if(cnt > 0){
			Join info = joinMapper.findUserInfo(map);
			resultMap.put("info", info);
			resultMap.put("result", "success");
			resultMap.put("message", "계정 있음");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

		
	// 비밀번호 찾기
	@Override
	public HashMap<String, Object> sUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = joinMapper.findPassword(map);
		if(cnt > 0){
			Join info = joinMapper.findUserInfo(map);
			resultMap.put("info", info);
			resultMap.put("result", "success");
			resultMap.put("message", "계정 있음");	
		} else {
			resultMap.put("result", "fail");
			resultMap.put("message", "입력한 정보가 모두 틀렸습니다.");
		}
		return resultMap;
	}

	// 새 비밀번호 입력
	@Override
	public void updatePw(HashMap<String, Object> map) {
		joinMapper.updatePassword(map);
	}

	@Override
	public Join getUserInfoPg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return joinMapper.selectUserInfoPg(map);
	}

	


	



}
