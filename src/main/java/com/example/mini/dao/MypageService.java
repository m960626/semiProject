package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.User;

public interface MypageService {	
	
	// 마이페이지 정보 호출
	User searchMyPageUser(HashMap<String, Object> map);
	
	// 클럽 정보
	HashMap<String, Object> searchMyClub(HashMap<String, Object> map);
	
	// 클럽 정보에서 클럽 입장하기
	HashMap<String, Object> searchMyClubInfo(HashMap<String, Object> map);

	// 가입신청 정보
	HashMap<String, Object> searchMyJoin(HashMap<String, Object> map);
	
	// 가입신청 취소
	void cancelJoin(HashMap<String, Object> map);
	
	// 클럽 순위
	HashMap<String, Object> searchClubRank(HashMap<String, Object> map);
	
	// 개인 순위
	HashMap<String, Object> searchSoloRank(HashMap<String, Object> map);
	
	// 예약현황(매칭내역) - 마이페이지
	HashMap<String, Object> searchMyMatchInfo(HashMap<String, Object> map);
	
	// 최근 기록 정보
	HashMap<String, Object> searchMyInfo(HashMap<String, Object> map);
}
