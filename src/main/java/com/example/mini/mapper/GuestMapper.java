package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Guest;

@Mapper
public interface GuestMapper {
	
	// 용병 게시글 조회
	List<Guest> selectGuestBList(HashMap<String, Object> map);
	int selectGuestBListCnt(HashMap<String, Object> map);
	
	// 게시글 작성자 팀 경기 리스트
	List<Guest> selectGMatchList(HashMap<String, Object> map);
	
	// 게시글 작성자 정보
	Guest selectGuestBInfo(HashMap<String, Object> map);
	
	// 게시글 댓글 작성자 정보
	Guest selectGuestCommInfo(HashMap<String, Object> map);
	
	// 게시글 상세보기
	Guest selectGuestRead(HashMap<String, Object> map);
	
	// 게시글 댓글 목록
	List<Guest> selectGuestComm(HashMap<String, Object> map);
	
	// 게시글 댓글 개수
	int selectCommCnt (HashMap<String, Object> map);
	
	// 용병 게시글 작성
	void insertGuest(HashMap<String, Object> map);
	
	// 용병 댓글 작성
	void insertGuestComm(HashMap<String, Object> map);
	
	// 용병 승인 버튼
	void successGuest(HashMap<String, Object> map);
	
	// 용병 게시글 cnt 증가
	void GuestCntUp(HashMap<String, Object> map);
}
