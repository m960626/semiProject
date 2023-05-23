package com.example.mini.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.mini.dao.ClubService;
import com.example.mini.model.Club;
import com.example.mini.model.Join;
import com.example.mini.model.Matching;
import com.example.mini.model.TimeLine;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ClubController {

	@Autowired
	ClubService clubService;
	
	@Autowired
	HttpSession session;
	
	/* 클럽 생성 페이지*/
	@RequestMapping("/sub01_01")
    public String club(HttpServletRequest request, Model model) throws Exception{
		return "/sub01_01";
    }
	
	/* 클럽 조회 페이지*/
	@RequestMapping("/sub01_02") 
    public String clubSerch(Model model) throws Exception{
		return "/sub01_02";
    }
	
	/* 클럽 상세조회 페이지*/
	@RequestMapping("/clubView.do")
    public String clubView(HttpServletRequest request, HttpServletResponse response, Model model,
		@RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/sub01_03";
    }
	
	/* 클럽 생성 */
	@RequestMapping(value = "/addClub.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addField(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		clubService.addClub(map);
		resultMap.put("cNo", map.get("cNo"));
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/* 클럽 여부 확인 */
	@RequestMapping(value = "/checkClub.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String checkClub(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = clubService.searchClubYn(map);
		return new Gson().toJson(resultMap);
	}
	
	/* 클럽 조회 리스트 */
	@RequestMapping(value = "/getList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = clubService.searchClubList(map);
		return new Gson().toJson(resultMap);
	}
	/*클럽 조회*/
	@RequestMapping(value = "/Club/clubView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getGuestInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("info", clubService.searchClubinfo(map));
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/* 클럽 인원 조회 */
	@RequestMapping(value = "/Club/clubUser.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
    public String get(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
       HashMap<String, Object> resultMap = new HashMap<String, Object>();
       resultMap = clubService.searchClubUserList(map);
       return new Gson().toJson(resultMap);
    }
	
	/* 클럽 신청 리스트 */
	@RequestMapping(value = "/Club/clubJoin.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String clubJoin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Join> list = clubService.searchClubJoin(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/* 클럽 신청 거절 */
	@RequestMapping(value = "/Club/joinFalse.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String clubJoinFalse(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		clubService.updateJoinFalse(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/* 클럽 신청 수락 */
	@RequestMapping(value = "/Club/joinTure.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String clubJoinTrue(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		clubService.updateJoinTrue(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	/* 최근 경기 기록 */
	@RequestMapping(value = "/Club/MatchList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String clubMatchList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Matching> list = clubService.searchMatchList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/* 클럽 타임 라인 */
	@RequestMapping(value = "/Club/TimeLine.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String clubTimeLine(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<TimeLine> list = clubService.searchTimeLine(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/* 회원정보 개별 조회 */
	@RequestMapping(value = "/Club/getUserInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String clubgetUserInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Join info = clubService.searchClubUserInfo(map);
		resultMap.put("info", info);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/* 클럽 공지사항 */
	@RequestMapping(value = "/Club/getNotice.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String clubgetNotice(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Club> list = clubService.searchClubNotice(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	// 파일 업로드 
	@RequestMapping("/fileUpload.dox")
    public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("cNo") int cNo, HttpServletRequest request,HttpServletResponse response, Model model)
    {
        String url = null;
        String path="c:\\img";
        try {
 
            //String uploadpath = request.getServletContext().getRealPath(path);
        	String uploadpath = path;
            String originFilename = multi.getOriginalFilename();
            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
            long size = multi.getSize();
            String saveFileName = genSaveFileName(extName);
            
            System.out.println("uploadpath : " + uploadpath);
            System.out.println("originFilename : " + originFilename);
            System.out.println("extensionName : " + extName);
            System.out.println("size : " + size);
            System.out.println("saveFileName : " + saveFileName);
            String path2 = System.getProperty("user.dir");
            System.out.println("Working Directory = " + path2 + "\\src\\main\\webapp\\images\\clubImg");
            String setPath = "images\\clubImg\\" + saveFileName;
            System.out.println(setPath);
            if(!multi.isEmpty())
            {
                File file = new File(path2 + "\\src\\main\\webapp\\images\\clubImg", saveFileName);
                multi.transferTo(file);
                
                
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("img", "\\images\\clubImg\\" + saveFileName);
                map.put("cNo", cNo);
                
                // insert 쿼리 실행
                // insertBoardImg(map); 
                clubService.insertClubImg(map);
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "filelist";
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        return "redirect:main.do";
    }
    
    // 현재 시간을 기준으로 파일 이름 생성
    private String genSaveFileName(String extName) {
        String fileName = "";
        
        Calendar calendar = Calendar.getInstance();
        fileName += calendar.get(Calendar.YEAR);
        fileName += calendar.get(Calendar.MONTH);
        fileName += calendar.get(Calendar.DATE);
        fileName += calendar.get(Calendar.HOUR);
        fileName += calendar.get(Calendar.MINUTE);
        fileName += calendar.get(Calendar.SECOND);
        fileName += calendar.get(Calendar.MILLISECOND);
        fileName += extName;
        
        return fileName;
    }
    
    
    /* 클럽 신청 거절 */
	@RequestMapping(value = "/Club/setClubMaster.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String setClubMaster(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		clubService.updateClubMaster(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	/* 클럽 상세조회 로그인한 유저 정보 */
	@RequestMapping(value = "/Club/SessionInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String SessionInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Join info = clubService.selectSessionInfo(map);
		resultMap.put("info", info);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/* 클럽 가입 신청 */
	@RequestMapping(value = "/Club/clubJoinUser.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String clubJoinUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		clubService.insertClubUser(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	/* 최근 경기 기록 */
	@RequestMapping(value = "/Club/ClubRank.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ClubRank(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Club> list = clubService.searchMainClub(map);
		List<Club> rlist = clubService.searchMainClub(map);
		resultMap.put("list", list);
		resultMap.put("rlist", rlist);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
    
    
    
	
	
	
}
