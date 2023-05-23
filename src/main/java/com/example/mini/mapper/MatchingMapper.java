package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Club;
import com.example.mini.model.Matching;
import com.example.mini.model.User;

@Mapper
public interface MatchingMapper {
	// 구장 정보 추가
	void insertField(HashMap<String, Object> map);
	
	// 경기 정보 추가
	void insertMatch(HashMap<String, Object> map);
	
	// 매치 조회
	List<Matching> selectMatchList(HashMap<String, Object> map);
	int selectMatchCnt(HashMap<String, Object> map);
	int selectEndCnt(HashMap<String, Object> map);
	
	// 매치예약 조회
	List<Matching> selectScheduleList(HashMap<String, Object> map);
	
	// 종료된 매치 조회
	List<Matching> selectEndList(HashMap<String, Object> map);
	
	// 경기 참가인원 조회
	List<Matching> selectGPlayerList(HashMap<String, Object> map);
	
	// 참여인원 경기기록 업데이트
	void insertRecord(HashMap<String, Object> map);
	
	// 선수 누적기록 업데이트
	void updatePlayer(HashMap<String, Object> map);
		
	// 매치 조회 - 메인페이지
	List<Matching> selectMainMatch(HashMap<String, Object> map);
	
	// 매치 정보 조회
	Matching selectMatchInfo(HashMap<String, Object> map);
	
	// 클럽원 리스트
	List<User>selectClubPList(HashMap<String, Object> map);
	
	// 매칭 인원 추가
	void inserPList(HashMap<String, Object> map);
	
	// 매치 업데이트
	void updateMatch(HashMap<String, Object> map);
	
	// 경기참여 선수 선택
	List<User> selectGUserList(HashMap<String, Object> map);
}
