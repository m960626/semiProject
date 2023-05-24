package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.Club;
import com.example.mini.model.Join;
import com.example.mini.model.Matching;
import com.example.mini.model.TimeLine;
import com.example.mini.model.User;

public interface ClubService {	
	
	// 클럽 생성
	void addClub(HashMap<String, Object> map);
	
	// 클럽 여부
	HashMap<String, Object> searchClubYn(HashMap<String, Object> map);
	
	// 클럽 리스트 조회
	HashMap<String, Object> searchClubList(HashMap<String, Object> map) throws Exception;
	
	// 클럽 상세 보기 
	Club searchClubinfo(HashMap<String, Object> map);
		
	// 클럽 선수 리스트
	HashMap<String, Object> searchClubUserList(HashMap<String, Object> map);
	
	// 클럽 신청 내역
	List<Join> searchClubJoin(HashMap<String, Object> map);
	
	// 클럽 신청 내역 거절
	void updateJoinFalse(HashMap<String, Object> map);
	
	// 클럽 신청 수락
	void updateJoinTrue(HashMap<String, Object> map);
	
	// 최근 경기 기록
	List<Matching> searchMatchList(HashMap<String, Object> map);
	
	// 클럽 타임라인
	List<TimeLine> searchTimeLine(HashMap<String, Object> map);
	
	// 회원정보 개별 조회
	Join searchClubUserInfo(HashMap<String, Object> map);
	
	// 클럽 공지사항
	List<Club> searchClubNotice(HashMap<String, Object> map);
	
	// 클럽 이미지 등록
	void insertClubImg(HashMap<String, Object> map);
	
	// 클럽 생성 시 클럽장 임명
	void updateClubMaster(HashMap<String, Object> map);
	
	// 클럽 상세조회 로그인한 유저 정보
	Join selectSessionInfo(HashMap<String, Object> map);
	
	// 클럽 가입 신청
	void insertClubUser(HashMap<String, Object> map);
	
	// 메인화면 클럽 순위
	List<Club> searchMainClub(HashMap<String, Object> map);
	
	// 회원 방출
	void deleteClubUser(HashMap<String, Object> map);
	
	// 회원 탈퇴 시 타임라인
	void deleteClubTL(HashMap<String, Object> map);
	
	// 클럽 공지사항 작성 
	void insertClubNotice(HashMap<String, Object> map);
	
}
