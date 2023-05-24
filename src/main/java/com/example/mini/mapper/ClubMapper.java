package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Club;
import com.example.mini.model.Join;
import com.example.mini.model.Matching;
import com.example.mini.model.TimeLine;
import com.example.mini.model.User;

@Mapper
public interface ClubMapper {
	// 클럽 생성
	void insertClub(HashMap<String, Object> map);
	
	// 클럽 여부
	User selectClubYn(HashMap<String, Object> map);
	
	// 클럽 리스트 조회
	List<Club> selectClubList(HashMap<String, Object> map);
	int selectClubCnt(HashMap<String, Object> map);
	
	// 클럽 상세 보기 
	Club selectClubinfo(HashMap<String, Object> map);
	
	// 클럽 선수 리스트
	List<Join> selectClubUserList(HashMap<String, Object> map);
	int selectClubUserCnt(HashMap<String, Object> map);
	
	// 클럽 신청 내역
	List<Join> selectClubJoin(HashMap<String, Object> map);
	
	// 클럽 신청 내역 거절
	void updateJoinFalse(HashMap<String, Object> map);
	
	// 클럽 신청 수락 시 타임라인 추가
	void insertClubTL(HashMap<String, Object> map);
	
	// 클럽 신청 수락 시 클럽 멤버 추가
	void insertJoinTrue(HashMap<String, Object> map);
	
	// 클럽 신청 수락 시 
	void updateJoinTrue(HashMap<String, Object> map);
	
	// 최근 경기 기록
	List<Matching> selectMatchList(HashMap<String, Object> map);
	
	// 클럽 타임라인
	List<TimeLine> selectTimeLine(HashMap<String, Object> map);
	
	// 회원정보 개별 조회
	Join selectClubUserInfo(HashMap<String, Object> map);
	
	// 클럽 공지사항
	List<Club> selectClubNotice(HashMap<String, Object> map);
	
	// 클럽 이미지 등록
	void insertClubImg(HashMap<String, Object> map);
	
	// 클럽 생성 시 클럽장 임명
	void updateClubMaster(HashMap<String, Object> map);
	
	// 클럽 상세조회 로그인한 유저 정보
	Join searchSessionInfo(HashMap<String, Object> map);
	
	// 클럽 가입 신청
	void insertClubUser(HashMap<String, Object> map);
	
	// 메인 화면 클럽 순위 
	List<Club> selectMainClub(HashMap<String, Object> map);
	
	// 회원 방출
	void deleteClubUser(HashMap<String, Object> map);
	
	// 회원 탈퇴 시 타임라인
	void deleteClubTL(HashMap<String, Object> map);
	
	// 클럽 공지사항 작성 
	void insertClubNotice(HashMap<String, Object> map);
}
