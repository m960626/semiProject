package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.UserMapper;
import com.example.mini.model.User;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	UserMapper userMapper;

	// 마이페이지 정보 호출
	@Override
	public User searchMyPageUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectMyPageUser(map);
	}
	
	// 클럽 정보
	@Override
	public HashMap<String, Object> searchMyClub(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user = userMapper.selectMyClub(map);
		if(user != null) {
			resultMap.put("user", userMapper.selectMyClub(map));
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	// 클럽 정보에서 클럽 입장하기
	@Override
	public HashMap<String, Object> searchMyClubInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();		
		User user = userMapper.selectMyClubInfo(map);
		if(user != null) {
			resultMap.put("info", userMapper.selectMyClubInfo(map));
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	
	// 가입신청 정보
	@Override
	public HashMap<String, Object> searchMyJoin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<User> user = userMapper.selectMyJoin(map);
		if(user.size() != 0) {
			resultMap.put("list", userMapper.selectMyJoin(map));
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	// 가입신청 취소
	@Override
	public void cancelJoin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		userMapper.updateJoin(map);
	}

	// 클럽 순위
	@Override
	public HashMap<String, Object> searchClubRank(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<User> ClubRank = userMapper.selectClubRank(map);
		if(ClubRank.size() != 0) {
			resultMap.put("list", ClubRank);
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	// 개인 순위
	@Override
	public HashMap<String, Object> searchSoloRank(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<User> SoloRank = userMapper.selectSoloRank(map);
		if(SoloRank.size() != 0) {
			resultMap.put("list", SoloRank);
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	// 예약현황(매칭내역) - 마이페이지
	@Override
	public HashMap<String, Object> searchMyMatchInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user = userMapper.selectMyClub(map);
		if(user != null) {
			resultMap.put("info", userMapper.selectMyClub(map));
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
		
	// 최근 기록 정보
	@Override
	public HashMap<String, Object> searchMyInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();		
		User user = userMapper.selectMyInfo(map);
		if(user != null) {
			resultMap.put("user", user);
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}	
}
