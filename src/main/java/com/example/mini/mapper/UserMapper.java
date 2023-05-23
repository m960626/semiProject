package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.User;

@Mapper
public interface UserMapper {
	// 클럽 정보
	User selectMyClub(HashMap<String, Object> map);
	
	// 가입 신청 정보
	List<User> selectMyJoin(HashMap<String, Object> map);
	
	// 가입 신청 취소
	void updateJoin(HashMap<String, Object> map);
	
	// 클럽 순위 정보
	List<User> selectClubRank(HashMap<String, Object> map);
	
	// 개인 순위 정보
	List<User> selectSoloRank(HashMap<String, Object> map);
	
	// 최근기록 정보
	User selectMyInfo(HashMap<String, Object> map);
}
