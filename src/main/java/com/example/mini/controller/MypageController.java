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
import com.google.gson.Gson;

import jakarta.servlet.http.HttpSession;


@Controller
public class MypageController {
	
	@Autowired
	MypageService mypageService;
	
	@Autowired
	HttpSession session;
	
	/* 랭킹 페이지*/
	@RequestMapping("/sub04_01") 
    public String ranking(Model model) throws Exception{
		return "/sub04_01";
    }
	
	/* 마이페이지 페이지*/
	@RequestMapping("/sub06_04") 
    public String matching(Model model) throws Exception{
		return "/sub06_04";
    }
	
	/* 마이페이지 페이지*/
	@RequestMapping("/sub06_07") 
    public String myrecord(Model model) throws Exception{
		return "/sub06_07";
    }
	
	/* 클럽 정보 가져오기*/
	@RequestMapping(value = "/getclub.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getClub(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = mypageService.searchMyClub(map);
		return new Gson().toJson(resultMap);
	}
	
	/* 클럽 정보 가져오기*/
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
	
	/* 최근 기록 가져오기*/
	@RequestMapping(value = "/getinfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = mypageService.searchMyInfo(map);
		return new Gson().toJson(resultMap);
	}
}


