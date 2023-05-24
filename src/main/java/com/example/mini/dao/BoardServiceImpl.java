package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.BoardMapper;
import com.example.mini.model.Board;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper boardMapper;
	
	// 글 리스트
	@Override
	public HashMap<String, Object> searchBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list",  boardMapper.selectBoardList(map));
		resultMap.put("cnt", boardMapper.selectBoardCnt(map));
		return resultMap;
	}
	
	
	// 공지사항 상세보기
	@Override
	public HashMap<String, Object> searchBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Board info = boardMapper.getBoard(map);
		resultMap.put("info", info);
		resultMap.put("commentList", boardMapper.getCommentList(map));
		resultMap.put("commCnt", boardMapper.getCommCnt(map));
		return resultMap;
	}

	// 댓글 추가
	@Override
	public void insertComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		boardMapper.AddComment(map);
	}
	
	// 댓글 삭제
	@Override
	public void removeComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		boardMapper.deleteComment(map);
	}
	
	// 댓글 수정
		@Override
		public void editComment(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			boardMapper.updateComment(map);
	}

	// 조회수
	@Override
	public void editBbsCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		boardMapper.updateBbsCnt(map);
	}

	// 소통게시판 게시글 등록
	@Override
	public void addCm(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		boardMapper.insertCm(map);
	}

	// 소통게시판 게시글 수정
	@Override
	public void editCm(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.updateCm(map);
	}

	// 소통게시판 게시글 삭제
	@Override
	public void removeCm(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		boardMapper.deleteCm(map);
	}

	// 공지 게시판 게시글 등록
	@Override
	public void addNo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		boardMapper.insertNo(map);
	}

	// 공지 게시판 게시글 수정
	@Override
	public void editNo(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.updateNo(map);
	}

	// 공지 게시판 게시글 삭제
	@Override
	public void removeNo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		boardMapper.deleteNo(map);
	}


	//문상혁 수정
	//메인페이지 공지사항, 자유게시판
	@Override
	public List<Board> searchMainNotice(HashMap<String, Object> map) {
		return boardMapper.selectMainNotice(map);
	}
	
	@Override
	public List<Board> searchMainBoard(HashMap<String, Object> map) {
		return boardMapper.selectMainBoard(map);
	}

}
