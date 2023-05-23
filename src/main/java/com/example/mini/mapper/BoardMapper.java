package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Board;
import com.example.mini.model.Matching;

@Mapper
public interface BoardMapper {
	
	// 글 리스트
	List<Board> selectBoardList(HashMap<String, Object> map);
	int selectBoardCnt(HashMap<String, Object> map);
	
	// 글 상세보기
	Board getBoard(HashMap<String, Object> map);
	
	// 댓글 리스트
	List<Board> getCommentList(HashMap<String, Object> map);
	int getCommCnt(HashMap<String, Object> map);
	
	// 댓글 추가
	void AddComment(HashMap<String, Object> map);
	
	//댓글 삭제
	void deleteComment(HashMap<String, Object> map);
	
	//댓글 수정
	void updateComment(HashMap<String, Object> map);
	
	// 조회수
	void updateBbsCnt(HashMap<String, Object> map);
}
