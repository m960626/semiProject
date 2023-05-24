package com.example.mini.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.BoardService;
import com.example.mini.model.Board;
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
    public String noticeboard(HttpServletRequest request, Model model) throws Exception{
		request.setAttribute("sessionId", session.getAttribute("sessionId")); 
		request.setAttribute("sessionStatus", session.getAttribute("sessionStatus"));
		
		return "/sub05_01";
    }
	
	/* 공지사항게시판 글 작성 페이지*/
	@RequestMapping("/sub05_01_add") 
    public String writeNotice(HttpServletRequest request, Model model) throws Exception{
		return "/sub05_01_add";
    }
	
	/* 공지사항게시판 글 수정페이지*/
	 @RequestMapping("/sub05_01_modify") // 주소
	    public String Noticemodify(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{ 
		  				// 웹페이지에 정보를 넘겨주기 위한 코드
		  	request.setAttribute("map", map);
		    
	        return "/sub05_01_edit";  // html 파일과 연동하여 호출하기 위한 코드
	    }
	
	
	/* 소통게시판 페이지*/
	@RequestMapping("/sub05_02") 
    public String board(HttpServletRequest request, Model model) throws Exception{
		request.setAttribute("sessionId", session.getAttribute("sessionId")); 
		request.setAttribute("sessionStatus", session.getAttribute("sessionStatus"));
		
		return "/sub05_02";
    }
	
	/* 소통게시판 글 작성 페이지*/
	@RequestMapping("/sub05_02_add") 
    public String writeBoard(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/sub05_02_add";
    }
	
	/* 소통게시판 글 수정페이지*/
	 @RequestMapping("/sub05_02_modify") // 주소
	    public String modify(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{ 
		  				// 웹페이지에 정보를 넘겨주기 위한 코드
		  	request.setAttribute("map", map);
		    
	        return "/sub05_02_edit";  // html 파일과 연동하여 호출하기 위한 코드
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
	
	// 소통게시판 게시글 추가
	 @RequestMapping(value = "/cm/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		
		public String cmAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	    	
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			map.put("userId", session.getAttribute("sessionId"));
			
			boardService.addCm(map); 
			
		    resultMap.put("result", "success"); 
			
			return new Gson().toJson(resultMap); 
		}
	 
	 
	// 소통게시판 게시물 수정 
		 		  
	  @RequestMapping(value = "/cm/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		
		public String cmEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	    	
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			boardService.editCm(map); 
			
		    resultMap.put("result", "success"); 
			
			return new Gson().toJson(resultMap); 
		}
	  
	  // 소통게시판 게시물 삭제
	  @RequestMapping(value = "/cm/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		
		public String cmRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	    	
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			boardService.removeCm(map); 
			
		    resultMap.put("result", "success"); // return 값
			
			return new Gson().toJson(resultMap); 
		}
	  
	  
	// 공지사항 게시글 추가
		 @RequestMapping(value = "/no/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
			@ResponseBody
			
			public String noAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		    	
				HashMap<String, Object> resultMap = new HashMap<String, Object>();
				
				map.put("userId", session.getAttribute("sessionId"));
				
				boardService.addNo(map); 
				
			    resultMap.put("result", "success"); 
				
				return new Gson().toJson(resultMap); 
			}
		 
		 
		// 공지사항 게시물 수정 
			 		  
		  @RequestMapping(value = "/no/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
			@ResponseBody
			
			public String noEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		    	
				HashMap<String, Object> resultMap = new HashMap<String, Object>();
				
				boardService.editNo(map); 
				
			    resultMap.put("result", "success"); 
				
				return new Gson().toJson(resultMap); 
			}
		  
		  // 공지사항 게시물 삭제
		  @RequestMapping(value = "/no/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
			@ResponseBody
			
			public String noRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		    	
				HashMap<String, Object> resultMap = new HashMap<String, Object>();
				
				boardService.removeNo(map); 
				
			    resultMap.put("result", "success"); // return 값
				
				return new Gson().toJson(resultMap); 
			}
		  
		  
		// 문상혁 수정
			@RequestMapping(value = "/mainBoard.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
			@ResponseBody
			public String mainBoard(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
				HashMap<String, Object> resultMap = new HashMap<String, Object>();
				List<Board> notice = boardService.searchMainNotice(map);
				List<Board> Board = boardService.searchMainBoard(map);
				resultMap.put("notice", notice);
				resultMap.put("Board", Board);
				resultMap.put("result", "success");
				return new Gson().toJson(resultMap);
			}
		  
}


