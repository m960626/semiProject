package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.MypageService;
import com.example.mini.model.User;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class MypageController {
	
	@Autowired
	MypageService mypageService;
	
	@Autowired
	HttpSession session;
	
	// 마이페이지 정보 호출
	@RequestMapping("/mypage.do") 
	public String searchMyPageUser(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
		request.setAttribute("sessionStatus", session.getAttribute("sessionStatus"));
		request.setAttribute("sessionNickName", session.getAttribute("sessionNickName"));
		request.setAttribute("sessionGender", session.getAttribute("sessionGender"));
		return "/sub06_01";
    }
	
	/* 랭킹 페이지*/
	@RequestMapping("/sub04_01") 
    public String ranking(Model model) throws Exception{
		return "/sub04_01";
    }
	
	/* 클럽 정보 - 마이페이지*/
	@RequestMapping("/sub06_04.do") 
	public String read(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
		request.setAttribute("sessionStatus", session.getAttribute("sessionStatus"));
		return "/sub06_04";
    }
	
	/* 클럽 정보 가져오기 */
	@RequestMapping(value = "/getclub.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getclub(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = mypageService.searchMyClub(map);
		String result = (String) resultMap.get("result");
		if(result.equals("success")) {
			User user = (User) resultMap.get("user");
			resultMap.put("user", user);
			resultMap.put("result", result);
		} else {
			resultMap.put("result", result);
		}
		return new Gson().toJson(resultMap);
	}
	
	/* 클럽 입장하기 - 마이페이지*/
	@RequestMapping("/sub01_03.do") 
	public String clubInfo(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
		request.setAttribute("sessionStatus", session.getAttribute("sessionStatus"));
		return "/sub01_03";
    }
	
	/* 클럽 정보에서 클럽 입장하기 */
	@RequestMapping(value = "/getclubInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getclubInfo(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = mypageService.searchMyClubInfo(map);
		String result = (String) resultMap.get("result");
		if(result.equals("success")) {
			User user = (User) resultMap.get("user");
			resultMap.put("user", user);
			resultMap.put("result", result);
		} else {
			resultMap.put("result", result);
		}
		return new Gson().toJson(resultMap);
	}
	
	/* 가입신청 정보 가져오기 */
	@RequestMapping(value = "/getjoin.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getJoin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = mypageService.searchMyJoin(map);
		return new Gson().toJson(resultMap);
	}
	
	/* 가입신청 취소*/
	@RequestMapping(value = "/cancel.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cancel(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		mypageService.cancelJoin(map);
		return new Gson().toJson(resultMap);
	}
	
	/* 클럽 순위 가져오기*/
	@RequestMapping(value = "/getClubRank.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getClubRank(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = mypageService.searchClubRank(map);
		return new Gson().toJson(resultMap);
	}
	
	/* 개인 순위 가져오기*/
	@RequestMapping(value = "/getSoloRank.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getSoloRank(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = mypageService.searchSoloRank(map);
		return new Gson().toJson(resultMap);
	}
	
	/* 예약현황(매칭내역) - 마이페이지 */
	@RequestMapping("/sub06_05.do") 
	public String matchInfo(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
		return "/sub06_05";
    }
	
	/* 최근기록 페이지*/		
	@RequestMapping("/sub06_07.do") 
	public String myrecord(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
		request.setAttribute("sessionStatus", session.getAttribute("sessionStatus"));
		request.setAttribute("sessionGender", session.getAttribute("sessionGender"));
		return "/sub06_07";
    }
	
	/* 최근 기록 가져오기*/
	@RequestMapping(value = "/getRecord.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getRecord(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = mypageService.searchMyInfo(map);
		String result = (String) resultMap.get("result");
		if(result.equals("success")) {
			User user = (User) resultMap.get("user");
			resultMap.put("user", user);
			resultMap.put("result", result);
		} else {
			resultMap.put("result", result);
		}
		return new Gson().toJson(resultMap);
	}
}


