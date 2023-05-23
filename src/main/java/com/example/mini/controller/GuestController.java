package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.GuestService;
import com.example.mini.model.Guest;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class GuestController {
	
	@Autowired
	GuestService guestservice;
	
	@Autowired
	HttpSession session;
	
	/* 용병 모집 페이지*/
	@RequestMapping("/sub03_01.do") 
    public String GuestWrite(Model model) throws Exception{
		return "/sub03_01";
    }
	
	/* 용병 모집 페이지*/
	@RequestMapping("/sub03_02.do") 
    public String GuestList(Model model) throws Exception{
		return "/sub03_02";
    }
	
	/* 용병 모집 read 페이지*/
	@RequestMapping("/sub03_03.do") 
	public String GuestRead(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/sub03_03";
    }
	
	
	
	
	/* 용병 모집 리스트 가져오기*/
	@RequestMapping(value = "/Guest/getList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getGuestList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = guestservice.searchGuestList(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/* 용병 모집 유저 정보 가져오기*/
	@RequestMapping(value = "/Guest/BoardInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getGuestInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("info", guestservice.searchGuestInfo(map));
		resultMap.put("list", guestservice.searchGMatchList(map));
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/* 용병 모집 유저 정보 가져오기*/
	@RequestMapping(value = "/Guest/CommInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getGuestCommInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("info", guestservice.searchGuestCommInfo(map));
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/* 용병 모집 상세보기*/
	@RequestMapping(value = "/Guest/read.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String get(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Guest info = guestservice.searchGuestRead(map);
		resultMap.put("info", info);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/* 용병 모집 댓글 개수*/
	@RequestMapping(value = "/Guest/commCnt.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String commCnt(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = guestservice.selectCommCnt(map);
		resultMap.put("cnt", cnt);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/* 댓글 리스트 가져오기*/
	@RequestMapping(value = "/Guest/getComm.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getGuestComm(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", guestservice.selectGuestComm(map));
		return new Gson().toJson(resultMap);
	}
	
	/* 용병 모집 게시글 작성 */
	@RequestMapping(value = "/Guest/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		guestservice.insertGuest(map);
		return new Gson().toJson(resultMap);
	}
	
	/* 용병 모집 게시글 작성 */
	@RequestMapping(value = "/Guest/commAdd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String commAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		guestservice.insertGuestComm(map);
		return new Gson().toJson(resultMap);
	}
	
	/* 용병 모집 게시글 작성 */
	@RequestMapping(value = "/Guest/successGuest.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String success(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		guestservice.successGuest(map);
		return new Gson().toJson(resultMap);
	}
	
	/* 용병 게시글 cnt 증가 */
	@RequestMapping(value = "/Guest/GuestCntUp.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String CntUp(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		guestservice.GuestCntUp(map);
		return new Gson().toJson(resultMap);
	}
	
	
	
}


