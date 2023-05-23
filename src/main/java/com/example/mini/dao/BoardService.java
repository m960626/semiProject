package com.example.mini.dao;

import java.util.HashMap;

public interface BoardService {	
	
	// 글 리스트
	HashMap<String, Object> searchBoardList(HashMap<String, Object> map);
	
	// 공지사항 상세보기
	HashMap<String, Object> searchBoard(HashMap<String, Object> map);

	// 댓글 추가
	void insertComment(HashMap<String, Object> map);
	
	// 댓글 삭제
	void removeComment(HashMap<String, Object> map);
	
	//댓글 수정 
	void editComment(HashMap<String, Object> map);
	
	// 조회수 
	void editBbsCnt(HashMap<String, Object> map);

	// 게시글 등록
	void addCm(HashMap<String, Object> map);
	
	// 게시글 수정
	void editCm(HashMap<String, Object> map) throws Exception;
	
	// 게시글 삭제
	void removeCm(HashMap<String, Object> map);
	
	// 공지 게시판 게시글 등록
	void addNo(HashMap<String, Object> map);
	
	// 공지 게시판 수정
	void editNo(HashMap<String, Object> map) throws Exception;
	
	// 공지 게시판 삭제
	void removeNo(HashMap<String, Object> map);
	

}
