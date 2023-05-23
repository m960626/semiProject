package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.Board;

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
}
