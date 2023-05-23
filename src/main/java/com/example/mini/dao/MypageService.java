package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.Matching;
import com.example.mini.model.User;

public interface MypageService {	
	
	// 클럽 정보
	HashMap<String, Object> searchMyClub(HashMap<String, Object> map);
	
	// 가입신청 정보
	HashMap<String, Object> searchMyJoin(HashMap<String, Object> map);
	
	// 가입신청 취소
	void cancelJoin(HashMap<String, Object> map);
	
	// 클럽 순위
	HashMap<String, Object> searchClubRank(HashMap<String, Object> map);
	
	// 개인 순위
	HashMap<String, Object> searchSoloRank(HashMap<String, Object> map);
	
	// 최근 기록 정보
	HashMap<String, Object> searchMyInfo(HashMap<String, Object> map);
}
