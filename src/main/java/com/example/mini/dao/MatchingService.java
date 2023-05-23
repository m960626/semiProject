package com.example.mini.dao;

import java.util.HashMap;

public interface MatchingService {	
	
	// 매칭 신청
	void addField(HashMap<String, Object> map);
	
	// 매칭 신청
	void addMatch(HashMap<String, Object> map);
	
	// 매치 조회
	HashMap<String, Object> searchMatchList(HashMap<String, Object> map);
	
	// 매치예약 조회
	HashMap<String, Object> searchScheduleList(HashMap<String, Object> map);
	
	// 매치예약 조회
	HashMap<String, Object> searchEndList(HashMap<String, Object> map);
	
	// 경기 참가인원 조회
	HashMap<String, Object> searchGPlayerList(HashMap<String, Object> map);
	
	// 참여인워 경기기록 입력 
	void insertInfo(HashMap<String, Object> map);
	
	// 선수 기록 업데이트
	void editPlayer(HashMap<String, Object> map);
	
	// 매치 조회 - 메인페이지
	HashMap<String, Object> searchMainMatch(HashMap<String, Object> map);
}
