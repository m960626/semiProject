package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.MatchingService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class MainController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	MatchingService matchingService;

	@RequestMapping("/main.do") 
    public String main(HttpServletRequest request, Model model) throws Exception{
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
		request.setAttribute("sessionStatus", session.getAttribute("sessionStatus"));
		request.setAttribute("sessionNickName", session.getAttribute("sessionName"));
		request.setAttribute("sessionCNo", session.getAttribute("sessionCNo"));
		return "/index";
    }
	
	/* 매칭 리스트 가져오기  - 메인페이지 */
	@RequestMapping(value = "/main/getList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = matchingService.searchMainMatch(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
}


