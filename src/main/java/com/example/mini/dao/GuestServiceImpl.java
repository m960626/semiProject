package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.GuestMapper;
import com.example.mini.model.Guest;

@Service
public class GuestServiceImpl implements GuestService{

	@Autowired
	GuestMapper guestmapper;
	
	// 용병 매칭 조회
	@Override
	public HashMap<String, Object> searchGuestList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", guestmapper.selectGuestBList(map));
		resultMap.put("pageCnt", guestmapper.selectGuestBListCnt(resultMap));
		return resultMap;
	}
		
	// 게시글 작성자 팀 경기 리스트
	@Override
	public List<Guest> searchGMatchList(HashMap<String, Object> map) {
		return guestmapper.selectGMatchList(map);
	}
		
	// 게시글 작성자 정보
	@Override
	public Guest searchGuestInfo(HashMap<String, Object> map) {
		return guestmapper.selectGuestBInfo(map);
	}
	
	// 게시글 내용
	@Override
	public Guest searchGuestRead(HashMap<String, Object> map) {
		return guestmapper.selectGuestRead(map);
	}
	
	// 게시글 댓글 작성자 정보
	@Override
	public Guest searchGuestCommInfo(HashMap<String, Object> map) {
		return guestmapper.selectGuestCommInfo(map);
	}
	
	//게시글 댓글 목록
	@Override
	public List<Guest> selectGuestComm(HashMap<String, Object> map) {
		return guestmapper.selectGuestComm(map);
	}
	
	//게시글 댓글 개수
	@Override
	public int selectCommCnt(HashMap<String, Object> map) {
		return guestmapper.selectCommCnt(map);
	}
	
	//용병 게시글 작성
	@Override
	public void insertGuest(HashMap<String, Object> map) {
		guestmapper.insertGuest(map);
	}
	
	//용병 댓글 작성
	@Override
	public void insertGuestComm(HashMap<String, Object> map) {
		guestmapper.insertGuestComm(map);
	}
	
	//용병 승인 버튼
	@Override
	public void successGuest(HashMap<String, Object> map) {
		guestmapper.successGuest(map);
	}
	
	// 용병 게시글 cnt 증가
	@Override
	public void GuestCntUp(HashMap<String, Object> map) {
		guestmapper.GuestCntUp(map);
	}
	
}
