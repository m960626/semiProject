package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.ClubMapper;
import com.example.mini.model.Club;
import com.example.mini.model.Join;
import com.example.mini.model.Matching;
import com.example.mini.model.TimeLine;
import com.example.mini.model.User;

@Service
public class ClubServiceImpl implements ClubService{
	
	@Autowired
	ClubMapper clubMapper;
	
	// 클럽 생성
	@Override
	public void addClub(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		clubMapper.insertClub(map);
	}
	
	// 클럽 여부
	@Override
	public HashMap<String, Object> searchClubYn(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User info = clubMapper.selectClubYn(map);
		if(info.getcNo() != 0) {
			resultMap.put("info", info);
			resultMap.put("result", "success");	
		}
		else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	@Override
	public HashMap<String, Object> searchClubList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Club> list = clubMapper.selectClubList(map);
		if(list.size() != 0) {
			resultMap.put("list", clubMapper.selectClubList(map));
			resultMap.put("cnt", clubMapper.selectClubCnt(map));
			resultMap.put("result", "success");	
		}
		else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	// 클럽 상세 보기 
	@Override
	public Club searchClubinfo(HashMap<String, Object> map) {
		return clubMapper.selectClubinfo(map);
	}
	
	// 클럽 선수 리스트
	@Override
	public HashMap<String, Object> searchClubUserList(HashMap<String, Object> map){
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", clubMapper.selectClubUserList(map));
		resultMap.put("cnt", clubMapper.selectClubUserCnt(map));
		return resultMap;
	}
	
	// 클럽 신청 내역
	@Override
	public List<Join> searchClubJoin(HashMap<String, Object> map) {
		return clubMapper.selectClubJoin(map);
	}
	
	// 클럽 신청 거절
	@Override
	public void updateJoinFalse(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		clubMapper.updateJoinFalse(map);
	}
	
	// 클럽 신청 수락
	@Override
	public void updateJoinTrue(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		clubMapper.updateJoinTrue(map);
		clubMapper.insertClubTL(map);
		clubMapper.insertJoinTrue(map);
	}
	
	// 최근 경기 기록
	@Override
	public List<Matching> searchMatchList(HashMap<String, Object> map) {
		return clubMapper.selectMatchList(map);
	}
	
	// 클럽 타임 라인
	@Override
	public List<TimeLine> searchTimeLine(HashMap<String, Object> map) {
		return clubMapper.selectTimeLine(map);
	}
	
	// 회원정보 개별 조회
	@Override
	public Join searchClubUserInfo(HashMap<String, Object> map) {
		return clubMapper.selectClubUserInfo(map);
	}
	
	// 클럽 공지사항
	@Override
	public List<Club> searchClubNotice(HashMap<String, Object> map) {
		return clubMapper.selectClubNotice(map);
	}
	
	// 클럽 이미지 등록
	@Override
	public void insertClubImg(HashMap<String, Object> map) {
		clubMapper.insertClubImg(map);
	}
	
	// 클럽 생성 시 클럽장 임명
	@Override
	public void updateClubMaster(HashMap<String, Object> map) {
		clubMapper.updateClubMaster(map);
	}
	
	// 클럽 상세조회 로그인한 유저 정보
	@Override
	public Join selectSessionInfo(HashMap<String, Object> map) {
		return clubMapper.searchSessionInfo(map);
	}
	
	// 클럽 가입 신청
	@Override
	public void insertClubUser(HashMap<String, Object> map) {
		clubMapper.insertClubUser(map);
	}
	
	// 클럽 가입 신청
	@Override
	public List<Club> searchMainClub(HashMap<String, Object> map) {
		return clubMapper.selectMainClub(map);
	}
		
		
}
