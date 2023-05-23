package com.example.mini.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.MatchingService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class MatchingController {
	
	@Autowired
	MatchingService matchingService;
	
	@Autowired
	HttpSession session;
	
	/* 매칭신청 페이지*/
	@RequestMapping("/sub02_02") 
    public String matching(Model model) throws Exception{
		return "/sub02_02";
    }
	
	/* 구장 정보 추가 */
	@RequestMapping(value = "/matching/addField.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addField(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		matchingService.addField(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/* 경기 정보 추가 */
	@RequestMapping(value = "/matching/addMatch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addMatch(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		matchingService.addMatch(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/* 매칭 조회 페이지*/
	@RequestMapping("/sub02_03") 
    public String matchingview(Model model) throws Exception{
		return "/sub02_03";
    }
	
	/* 매칭 조회 페이지*/
	@RequestMapping("/sub02_04") 
    public String fieldview(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/sub02_04";
    }
	
	/* 매칭예약 조회 페이지*/
	@RequestMapping("/Schedule.do") 
    public String matchinSchedule(Model model) throws Exception{
		return "/sub06_05";
    }
	
	/* 매칭 리스트 가져오기*/
	@RequestMapping(value = "/Schedule/List.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ScheduleList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = matchingService.searchScheduleList(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/* 종료된 매치 리스트*/
	@RequestMapping(value = "/EndSchedule/List.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String EneScheduleList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = matchingService.searchEndList(map);
		return new Gson().toJson(resultMap);
	}
	
	/* 참가 선수 리스트 */
	@RequestMapping(value = "/GPlayer/List.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String GamePlayerList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = matchingService.searchGPlayerList(map);
		return new Gson().toJson(resultMap);
	}
	
	
	/* 참가선수 기록 업데이트 */
	@RequestMapping(value = "/GPlayer/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String GamePlayerAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		String json = map.get("list").toString();
		ObjectMapper mapper = new ObjectMapper();
	    List<Map<String, Object>> list = mapper.readValue(json, new TypeReference<ArrayList<Map<String, Object>>>(){});
		map.put("list", list);
		
		matchingService.insertInfo(map);
		resultMap.put("result", "success"); 
		return new Gson().toJson(resultMap);
	}
	
	 
	 
	/* 선수 누적기록 업데이트  */
	@RequestMapping(value = "/GPlayer/Update.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String GPlayerUpdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		matchingService.editPlayer(map);
		resultMap.put("result", "success"); 
		return new Gson().toJson(resultMap);
	}
	
	/* 매칭 리스트 가져오기*/
	@RequestMapping(value = "/matching/getList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = matchingService.searchMatchList(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/*  문상혁 작업 영역  */
	// 구장 예약
	@RequestMapping("/matchingList.do") 
    public String matchingList(Model model) throws Exception{
		return "/sub02_01";
    }
	
	// 매치 조회 - 메인페이지
	@RequestMapping(value = "/matching/mainMatch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String mainMatch(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = matchingService.searchMainMatch(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/* 매칭 정보 가져오기*/
	@RequestMapping(value = "/matching/getInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = matchingService.searchMatchInfo(map);
		return new Gson().toJson(resultMap);
	}
	
	/* 클럽원 리스트*/
	@RequestMapping(value = "/clubPList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String clubPList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = matchingService.searchClubPList(map);
		return new Gson().toJson(resultMap);
	}
	
	/* 매칭 인원 추가*/
	@RequestMapping(value = "/addPList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addPList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		String json = map.get("list").toString();
		ObjectMapper mapper = new ObjectMapper();
	    List<String> list = mapper.readValue(json, new TypeReference<ArrayList<String>>(){});
		map.put("list", list);
		
		matchingService.addPList(map);
		return new Gson().toJson(resultMap);
	}
	
	/* 매치 업데이트 */
	@RequestMapping(value = "/updateMatch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateMatch(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		matchingService.editMatch(map);
		return new Gson().toJson(resultMap);
	}
}


