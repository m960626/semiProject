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

	@Override
	public HashMap<String, Object> searchMyClub(HashMap<String, Object> map) {
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

	@Override
	public void cancelJoin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		userMapper.updateJoin(map);
	}

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

	@Override
	public HashMap<String, Object> searchMyInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User info = userMapper.selectMyInfo(map);
		resultMap.put("info", info);
		return resultMap;
	}	
}
