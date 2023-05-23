package com.example.mini.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.MatchingMapper;
import com.example.mini.model.Matching;

@Service
public class MatchingServiceImpl implements MatchingService{

	@Autowired
	MatchingMapper matchingMapper;
	
	// 구장 정보 추가
	@Override
	public void addField(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		matchingMapper.insertField(map);
	}
	
	// 경기 정보 추가
	@Override
	public void addMatch(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		matchingMapper.insertMatch(map);
	}
	
	// 매치 조회
	@Override
	public HashMap<String, Object> searchMatchList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list",  matchingMapper.selectMatchList(map));
		resultMap.put("cnt", matchingMapper.selectMatchCnt(resultMap));
		return resultMap;
	}
	
	// 매치 예약 조회
	@Override
	public HashMap<String, Object> searchScheduleList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list",  matchingMapper.selectScheduleList(map));
		resultMap.put("cnt", matchingMapper.selectMatchCnt(resultMap));
		return resultMap;
	}

	
	// 종료된 매치 조회
	@Override
	public HashMap<String, Object> searchEndList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Matching> matching = matchingMapper.selectEndList(map);
		int cnt = matchingMapper.selectEndCnt(map);
		if(cnt > 0) {
		resultMap.put("endlist",  matchingMapper.selectEndList(map));
		resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}		
		return resultMap;

	}

	
	// 경기 참가인원 조회
	@Override
	public HashMap<String, Object> searchGPlayerList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("gplaylist",  matchingMapper.selectGPlayerList(map));
		resultMap.put("result", "success");
		return resultMap;
	}

	// 참가인원 경기 기록 입력
	@Override
	public void insertInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		ArrayList<HashMap <String, Object>> list = (ArrayList<HashMap<String, Object>>) map.get("list");
		for(int i=0; i< list.size(); i++) {
			HashMap<String, Object> insertMap = list.get(i);
			matchingMapper.insertRecord(insertMap);
		}
		
	}
	
	
	// 경기 참가인원 기록 업데이트
	@Override
	public void editPlayer(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		matchingMapper.updatePlayer(map);
	}
	
	// 매치 조회 - 메인페이지
	public HashMap<String, Object> searchMainMatch(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list",  matchingMapper.selectMainMatch(map));
		return resultMap;
	}
	// 경기 상세 조회
	@Override
	public HashMap<String, Object> searchMatchInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("info",  matchingMapper.selectMatchInfo(map));
		return resultMap;
	}
	
	//클럽원 리스트
	@Override
	public HashMap<String, Object> searchClubPList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", matchingMapper.selectClubPList(map));
		return resultMap;
	}
	
	// 매칭 인원 추가
	@Override
	public void addPList(HashMap<String, Object> map) {
		// TODO Auto-generated method stu
		List<String> list = (List<String>) map.get("list");
		for(int i=0; i<list.size(); i++) {
			map.put("id", list.get(i));
			matchingMapper.inserPList(map);
		}
		
	}
	
	// 매치 업데이트
	@Override
	public void editMatch(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		matchingMapper.updateMatch(map);
	}
	
	// 경기참여 인원 조회 리스트
	@Override
	public HashMap<String, Object> searchUserList(HashMap<String, Object> map) {
	// TODO Auto-generated method stub
	HashMap<String, Object> resultMap = new HashMap<String, Object>();
	resultMap.put("list",  matchingMapper.selectGUserList(map));
	return resultMap;
	}
}
