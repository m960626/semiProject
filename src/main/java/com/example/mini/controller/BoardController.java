package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.BoardService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	HttpSession session;
		
	/* 공지사항 페이지*/
	@RequestMapping("/sub05_01") 
    public String noticeboard(Model model) throws Exception{
		return "/sub05_01";
    }
	
	/* 소통게시판 페이지*/
	@RequestMapping("/sub05_02") 
    public String board(Model model) throws Exception{
		return "/sub05_02";
    }
	
	/* 영상게시판 페이지*/
	@RequestMapping("/sub05_03") 
    public String videoboard(Model model) throws Exception{
		return "/sub05_03";
    }
	
	/* 글 작성 페이지*/
	@RequestMapping("/sub05_04") 
    public String writeBoard(Model model) throws Exception{
		return "/sub05_04";
    }
		
	/* 공지사항 조회 페이지*/
	@RequestMapping("sub05_01_read") 
    public String noticeview(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "sub05_01_read";
    }
	
	/* 공지사항 조회 페이지*/
	@RequestMapping("sub05_02_read") 
    public String comuview(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "sub05_02_read";
    }
	
	/* 갤러리 조회 페이지*/
	@RequestMapping("sub05_03_read") 
    public String galleryView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "sub05_03_read";
    }
	
	/* 글 리스트*/
	@RequestMapping(value = "/getBoardList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getnoticeList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchBoardList(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}

	
	// 글, 댓글 조회
	@RequestMapping(value = "/read.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getnotice(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();		
		resultMap = boardService.searchBoard(map);
		return new Gson().toJson(resultMap);
	}
	
	// 댓글 추가
		@RequestMapping(value = "/addcomment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String addcomment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();		
			boardService.insertComment(map);
			resultMap.put("result", "success");
			return new Gson().toJson(resultMap);
		}
	
	// 댓글 삭제
	@RequestMapping(value = "/removecomment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.removeComment(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 댓글 수정
	@RequestMapping(value = "/editcomment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editcomment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.editComment(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 댓글 수정
	@RequestMapping(value = "/updateCnt.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateCnt(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.editBbsCnt(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
}


