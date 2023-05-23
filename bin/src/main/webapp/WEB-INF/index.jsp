<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/header.jsp"></jsp:include>
<title>티키타카 - 메인페이지</title>
<link rel="stylesheet" type="text/css" href="../css/moon.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<link rel="stylesheet" type="text/css" href="../css/slick.css">
<script type="text/javascript" src="../js/slick.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
</head>
<body>
	<div id="container">
        <div class="area-main">
        	<!-- 사이드메뉴 -->
        	<nav id="main-tab">
	            <ul class="main-tab-list" v-if="sessionId != '' && sessionId != null">
	                <li class="tab01 on"><a href="/mypage.do" title="tiki 마이페이지"><span>Tiki 마이페이지</span></a></li>
	                <li class="tab02"><a href="/logout.do" title="tiki 로그아웃"><span>Tiki 로그아웃</span></a></li>
	            </ul>
	            <ul class="main-tab-list" v-else>
	                <li class="tab01 on"><a href="/join.do" title="tiki 회원가입"><span>Tiki 회원가입</span></a></li>
	                <li class="tab02"><a href="/login.do" title="tiki 로그인"><span>Tiki 로그인</span></a></li>
	            </ul>
        	</nav>
        	<!-- 사이드메뉴 끝 -->
        	
            <!-- 메인 슬라이드 -->
            <section id="section01">
                <div class="wrap">
                    <div class="txtBox">
                        <h2 class="title">
                            티키타카 프로젝트 화이팅!
                        </h2>
                        <p class="cont">
                            티키타카와 함께 지역 최고의 축구 클럽을 생성해보세요!!
                        </p>
                        <div class="more">
                            <a href="/club.do">
                                자세히 보러 가기
                            </a>
                        </div>
                    </div>
                </div>
            </section>
            <!-- //메인 슬라이드 -->

            <!-- 세션2 -->
            <section id="section02">
                <div class="wrap">
                    <div class="img_banner">
                        <div>
                            <div class="stit">
                                <span>클럽 생성</span>
                                <p>티키타카를 통해 지역 
                                    최고의 클럽을 생성해보세요.
                                </p>
                            </div>
                            <a href="/club.do" class="go_btn">자세히 보기<span></span></a>
                        </div>
                        <div>
                            <div class="stit">
                                <span>클럽 조회</span>
                                <p>기록 서비스 기반으로 
                                    클럽을 조회해보세요.
                                </p>
                            </div>
                            <a href="/clubSerch.do" class="go_btn">자세히 보기<span></span></a>
                        </div>
                        <div>
                            <div class="stit">
                                <span>용병 매칭</span>
                                <p>같이 할 친구가 없는 
                                    사람은 용병을 구해보셔요..
                                </p>
                            </div>
                            <a href="/sub03_01.do" class="go_btn">자세히 보기<span></span></a>
                        </div>
                    </div>
                </div>
            </section>
            <!-- //세션2 -->

            <!-- 세션3 -->
            <section id="section03">
                <div class="wrap">
                    <div class="schedule_wrap">
                        <div class="schedule_tit">
                          <h3 class="tit">시합 매칭 일정</h3>
                          <div class="schedule_control">
                            <button type="button" class="prev">이전</button>
                            <button type="button" class="stop">정지</button>
                            <button type="button" class="next">다음</button>
                            <a href="/matchingview.do" class="more">더보기</a>
                          </div>
                        </div>
                        <div class="schedule_list">
                          <div class="item end" v-for="item in list">
                            <a href="javascript:;" @click="fnView">
                              <p></p>
                              <span class="subject">
                                <p>{{item.cNoH}}</p>
                                <p>{{item.fName}}</p>
                              </span>
                              <span class="date">
                                {{item.mDate}}
                              </span>
                            </a>
                          </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- //세션3 -->
            
            <!-- 세션 4 -->
            <section id="section04">
                <div class="wrap">
                    <h3>이번 달 클럽 순위</h3>
                    <div class="clubList" v-for="(item, index) in list">
                        <div class="leftArea">
                            <div class="slider-nav slider">
                                <div class="item">
                                    <a href="javascript:;">
                                        <span class="num">{{index + 1}}</span>
                                        <span class="name">{{item.cName}}</span>
                                        <span class="score">40경기</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="rightArea">
                            <div class="slider-for slider">
                                <div class="item">
                                    <div class="clubInfo">
                                        <div class="imgBox">
                                            <div class="img">
                                                {{item.cImg}}
                                            </div>
                                        </div>
                                        <div class="txtBox">
                                            <p><b>클럽명</b> : {{item.cName}}</p>
                                            <p><b>활동 지역</b> : {{item.cLoc}}</p>
                                            <p><b>클럽 인원 수</b> : {{item.cPcnt}}명</p>
                                            <a href="javascript:;">정보 더보기 +</a>
                                        </div>
                                    </div>
                                </div>
                        	</div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- //세션 4 -->

            <!-- 세션 5 -->
            <section id="section05">
                <div class="wrap">
                    <div class="noticeArea">
                        <h3>공지사항</h3>
                        <a href="javascript:;">더보기 +</a>
                        <ul class="noticeList">
                            <li>
                                <a href="javascript:;">
                                    <span>[공지사항]</span>
                                    <p class="title">
                                        공지사항의 제목입니다. 공지사항의 제목입니다. 공지사항의 제목입니다. 공지사항의 제목입니다.
                                    </p>
                                    <p class="content">
                                        공지사항의 내용입니다. 공지사항의 내용입니다. 공지사항의 내용입니다.공지사항의 내용입니다.공지사항의 내용입니다. 내용입니다 내용입니다 내용입니다
                                    </p>
                                    <div class="cntArea">
                                        <span class="view">
                                            999
                                        </span>
                                        <span class="comm">
                                            999
                                        </span>
                                    </div>
                                    <div class="imgBox">

                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <span>[공지사항]</span>
                                    <p class="title">
                                        공지사항의 제목입니다.
                                    </p>
                                    <p class="content">
                                        공지사항의 내용입니다. 공지사항의 내용입니다. 공지사항의 내용입니다.
                                    </p>
                                    <div class="cntArea">
                                        <span class="view">
                                            999
                                        </span>
                                        <span class="comm">
                                            999
                                        </span>
                                    </div>
                                    <div class="imgBox">

                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="reviewArea">
                        <h3>이용후기</h3>
                        <a href="javascript:;">더보기 +</a>
                        <ul class="reviewList">
                            <li>
                                <a href="javascript:;">
                                   <div class="imgBox">
                                        <div class="img"></div>
                                   </div>
                                   <div class="txtBox">
                                    <p class="title">
                                        이용후기의 제목입니다.
                                    </p>
                                    <p class="content">
                                        이용후기의 내용입니다.
                                    </p>
                                   </div> 
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                   <div class="imgBox">
                                        <div class="img"></div>
                                   </div>
                                   <div class="txtBox">
                                    <p class="title">
                                        이용후기의 제목입니다. 이용후기의 제목입니다. 이용후기의 제목입니다.
                                    </p>
                                    <p class="content">
                                        이용후기의 내용입니다. 이용후기의 내용입니다. 이용후기의 내용입니다. 이용후기의 내용입니다. 이용후기의 내용입니다.
                                    </p>
                                   </div> 
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- //세션 5 -->
            

        </div>
    </div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#container',
    data: {
    	list : [],
    	selectPage: 1,
    	pageCount: 1,
    	cnt : 0,
		sessionId : "${sessionId}",
		sessionStatus : "${sessionStatus}",
		sessionNickName : "${sessionNickName}"
    }   
    , methods: {
    	// 매치 리스트 가져오기
    	fnGetList : function(){
    		var self = this;
    		 <!-- 페이징 추가 6-->
 			var startNum = ((self.selectPage-1) * 10);
    		var nparmap ={startNum : startNum};
             $.ajax({
                 url:"/main/getList.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {   
                	 self.list = data.list; 
                	 self.cnt = data.cnt;
	 	             self.pageCount = Math.ceil(self.cnt / 10);
                	 for(var i=0; i<self.list.length; i++){
                		 var loc = self.list[i].fLoc.slice(0, 2);
                		 self.list[i].fLoc = loc;
                		 
                		 var tDate = self.list[i].mDate;	                		 
                		 var lDate = new Date(tDate);
						 tDate = (lDate.getMonth()+1) + "월 " + lDate.getDate() + "일"
                		 self.list[i].mDate = tDate;
                		 
                		 var time = self.list[i].mTimeS.slice(0, 5);
                		 self.list[i].mTimeS = time;
                	 }	
                 }
             }); 
		}
		, fnView : function(){
			var self = this;
    		var nparmap ={}; // startNum : self.startNum
             $.ajax({
                 url:"/main/clubList.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {   
                	 self.list = data.list; 
                	 
                 }
             });
		}
	},
	created : function() {
		var self = this;
		self.fnGetList();
		self.fnClubList();
	}
});
</script>