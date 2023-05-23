package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.JoinService;
import com.example.mini.model.Join;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class JoinController {
	
	@Autowired
	JoinService joinService;
	
	@Autowired
	HttpSession session;
	
	
			
	// 로그인 페이지
	@RequestMapping("/login.do") 
	public String main(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		String id = (String) session.getAttribute("sessionId");
		String nick = (String) session.getAttribute("sessionNickName");
		String status = (String) session.getAttribute("sessionStatus");
		
		session.removeAttribute(id);
		session.removeAttribute(nick);
		session.removeAttribute(status);
		
		session.invalidate();
		request.setAttribute("map", map); // (로그인페이지의 map, 아이디찾기의 map)
        return "/sub00_01";
    }
	
	// 로그인 기능
	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String get(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = joinService.searchUserInfo(map);
		String result = (String) resultMap.get("result");
		if(result.equals("success")) {
			Join user = (Join) resultMap.get("user");
			session.setAttribute("sessionId", user.getId());
			session.setAttribute("sessionNickName", user.getNick());
			session.setAttribute("sessionStatus", user.getStatus());
		}
		return new Gson().toJson(resultMap);
	}
	
	/* 메인페이지 로그아웃 */
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public String set(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        HttpSession session = request.getSession();
        
        session.invalidate();
        return "/index";
    }
	
	// 회원가입 약관
	@RequestMapping("/preJoin.do") 
    public String preJoin(Model model) throws Exception{
		return "/sub00_02"; //<<-이 JSP파일이 열린다는 뜻~
    }
	// 회원가입 페이지
	@RequestMapping("/join.do") 
    public String join(Model model) throws Exception{
		return "/sub00_03"; 
    }
	//회원가입 기능
	@RequestMapping(value = "/user/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		joinService.addUser(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	//중복체크 기능
	@RequestMapping(value = "/user/check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String sameCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = joinService.searchUserChk(map);
		resultMap.put("cnt", cnt);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
//	// 회원정보수정
//	@RequestMapping("/join.do") 
//    public String uInfo(Model model) throws Exception{
//		return "/sub00_03"; 
//    }
	
	//회원정보수정-정보호출
	@RequestMapping(value = "/user/info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String uInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Join info = joinService.getUserInfoPg(map);
		resultMap.put("info", info);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	//회원정보 업데이트
	@RequestMapping(value = "/user/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editUinfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		joinService.editUserInfo(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}

	// 마이페이지 정보 호출
	@RequestMapping("/mypage.do") 
	public String searchMyPageUser(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
		request.setAttribute("sessionStatus", session.getAttribute("sessionStatus"));
		request.setAttribute("sessionNickName", session.getAttribute("sessionNickName"));
		return "/sub06_01";
    }
		
	// 아이디 찾기 페이지
	@RequestMapping("/findid.do") 
    public String findid(Model model) throws Exception{
        return "/sub08_01";
    }

	// 아이디 찾기 기능
	@RequestMapping(value = "/findid.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findId(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = joinService.IdUserInfo(map);
		String result = (String) resultMap.get("result");
		if(result.equals("success")) {
			Join info = (Join) resultMap.get("info");
			resultMap.put("info", info);
			resultMap.put("result", "success");
		}
		return new Gson().toJson(resultMap);
	}
		
	// 비밀번호 찾기 페이지
	@RequestMapping("/findpw.do") 
    public String findpw(Model model) throws Exception{
        return "/sub08_02";
    }
		
	// 비밀번호 찾기 기능
	@RequestMapping(value = "/findpw.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findPwd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = joinService.sUserInfo(map);
		String result = (String) resultMap.get("result");
		if(result.equals("success")) {
			Join info = (Join) resultMap.get("info");
			resultMap.put("info", info);
			resultMap.put("result", "success");
		}
		return new Gson().toJson(resultMap);
	}
	
	// 새 비밀번호 입력 페이지
	@RequestMapping("/newpw.do") 
    public String newpw(Model model) throws Exception{
        return "/sub08_03";
    }
	
	// 새 비밀번호 입력 기능
	@RequestMapping(value = "/newpw.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editPw(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		joinService.updatePw(map);
		resultMap.put("result", "success"); 
		return new Gson().toJson(resultMap);
	}
	
}

