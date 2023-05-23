package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.Guest;

public interface GuestService {	
	// 용병 매칭 조회
	HashMap<String, Object> searchGuestList(HashMap<String, Object> map);
	
	// 게시글 작성자 팀 경기 리스트
	List<Guest> searchGMatchList(HashMap<String, Object> map);
	
	// 게시글 작성자 정보
	Guest searchGuestInfo(HashMap<String, Object> map);
	
	// 게시글 상세보기
	Guest searchGuestRead(HashMap<String, Object> map);
	
	// 게시글 댓글 작성자 정버 
	Guest searchGuestCommInfo(HashMap<String, Object> map);
	
	// 게시글 댓글 목록
	List<Guest> selectGuestComm(HashMap<String, Object> map);
	
	// 게시글 댓글 개수
	int selectCommCnt (HashMap<String, Object> map);
	
	// 용병 게시글 작성
	void insertGuest(HashMap<String, Object> map);
	
	// 용병 작성 작성
	void insertGuestComm(HashMap<String, Object> map);
	
	// 용병 승인 버튼
	void successGuest(HashMap<String, Object> map);
	
	// 용병 게시글 cnt 증가
	void GuestCntUp(HashMap<String, Object> map);
}
