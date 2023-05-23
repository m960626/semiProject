package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.User;

@Mapper
public interface UserMapper {

	// 마이페이지 정보 호출
	User selectMyPageUser(HashMap<String, Object> map);
	
	// 클럽 정보
	User selectMyClub(HashMap<String, Object> map);
	
	// 클럽 정보에서 클럽 입장하기
	User selectMyClubInfo(HashMap<String, Object> map);
	
	// 가입 신청 정보
	List<User> selectMyJoin(HashMap<String, Object> map);
	
	// 가입 신청 취소
	void updateJoin(HashMap<String, Object> map);
	
	// 클럽 순위 정보
	List<User> selectClubRank(HashMap<String, Object> map);
	
	// 개인 순위 정보
	List<User> selectSoloRank(HashMap<String, Object> map);

	// 예약현황(매칭내역) - 마이페이지
	User selectMyMatchInfo(HashMap<String, Object> map);
	
	// 최근기록 정보
	User selectMyInfo(HashMap<String, Object> map);
}
