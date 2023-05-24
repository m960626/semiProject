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
                            <a href="/sub01_01">
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
                            <a href="/sub01_01" class="go_btn">자세히 보기<span></span></a>
                        </div>
                        <div>
                            <div class="stit">
                                <span>클럽 조회</span>
                                <p>기록 서비스 기반으로 
                                    클럽을 조회해보세요.
                                </p>
                            </div>
                            <a href="/sub01_02" class="go_btn">자세히 보기<span></span></a>
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
                          <div class="item end" v-for="item2 in list">
                            <a href="javascript:;">
                              <p></p>
                              <span class="subject">
                                <p>{{item2.cNoH}}</p>
                                <p>{{item2.fName}}</p>
                              </span>
                              <span class="date">
                                {{item2.mDate}} {{item2.mTimeS}}
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
                    <div class="clubList">
                        <div class="leftArea">
                            <div class="slider-nav slider">
                                <div class="item" v-for="(left, index1) in clubList">
                                    <a href="javascript:;">
                                        <span class="num"></span>
                                        <span class="name">{{left.cName}}</span>
                                        <span class="score">{{left.total}}경기</span>
                                    </a>
                                </div> 
                            </div>
                        </div>
                        <div class="rightArea">
                            <div class="slider-for slider">
                                <div class="item" v-for="right in rList">
                                    <div class="clubInfo">
                                        <div class="imgBox">
                                            <div class="img">
                                            	<img :src="right.imgData"/>
                                            </div>
                                        </div>
                                        <div class="txtBox">
                                            <p><b>클럽명</b> : {{right.cName}}</p>
                                            <p><b>활동 지역</b> : {{right.locName}}</p>
                                            <p><b>클럽 인원 수</b> : {{right.user}}명</p>
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
                        <a href="/sub05_01">더보기 +</a>
                        <ul class="noticeList">
                            <li v-for="(item, index) in notice">
                                <a href="javascript:;"  @click="noticeView(item)">
                                    <span>[공지사항]</span>
                                    <p class="title">
                                        {{item.cmTitle}}
                                    </p>
                                    <p class="content">
                                        {{item.cmCont}}
                                    </p>
                                    <div class="cntArea">
                                        <span class="view">
                                            {{item.cmCnt}}
                                        </span>
                                        <span class="comm">
                                            0
                                        </span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="reviewArea">
                        <h3>자유게시판</h3>
                        <a href="/sub05_02">더보기 +</a>
                        <ul class="noticeList">
                            <li v-for="(item, index) in board">
                                <a href="javascript:;" @click="boardView(item)">
                                    <span>[자유게시판]</span>
                                    <p class="title">
                                        {{item.cmTitle}}
                                    </p>
                                    <p class="content">
                                        {{item.cmCont}}
                                    </p>
                                    <div class="cntArea">
                                        <span class="view">
                                            {{item.cmCnt}}
                                        </span>
                                        <span class="comm">
                                            0
                                        </span>
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
    	clubList : [],
    	rList : [],
    	notice : [],
    	board : [],
    	selectPage: 1,
    	pageCount: 1,
    	cnt : 0,
		sessionId : "${sessionId}",
		sessionStatus : "${sessionStatus}",
		sessionNickName : "${sessionNickName}",
		sessionCNo : "${sessionCNo}"
    }   
    , methods: {
    	// 매치 리스트 가져오기
    	fnGetList : function(){
    		var self = this;
    		var nparmap ={};
             $.ajax({
                 url:"/matching/mainMatch.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {   
                	 self.list = data.list;
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
		},
		fnClubRank : function() {
			var self = this;
			var nparmap = {};
			$.ajax({
                url:"/Club/ClubRank.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {  
               	 	self.clubList = data.list;
               	 	self.rList = data.rlist;	
                }
            }); 
		},
		fnMainBoard : function() {
			var self = this;
			var nparmap = {};
			$.ajax({
                url:"/mainBoard.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {  
                	self.notice = data.notice;
                	self.board = data.Board;
                	console.log(self.notice);
                	console.log(self.board);
                }
            }); 
		},
		noticeView : function(item) {
			var self = this;
			self.pageChange("./sub05_01_read", {cmNo : item.cmNo});
			
		},
		boardView : function(item) {
			var self = this;
			self.pageChange("./sub05_01_read", {cmNo : item.cmNo});
		},
		pageChange : function(url, param) {
			var target = "_self";
			if(param == undefined){
			//	this.linkCall(url);
				return;
			}
			var form = document.createElement("form"); 
			form.name = "dataform";
			form.action = url;
			form.method = "post";
			form.target = target;
			for(var name in param){
				var item = name;
				var val = "";
				if(param[name] instanceof Object){
					val = JSON.stringify(param[name]);
				} else {
					val = param[name];
				}
				var input = document.createElement("input");
	    		input.type = "hidden";
	    		input.name = item;
	    		input.value = val;
	    		form.insertBefore(input, null);
			}
			document.body.appendChild(form);
			form.submit();
			document.body.removeChild(form);
		}
	},
	created : function() {
		var self = this;
		self.fnGetList();
		self.fnClubRank();
		self.fnMainBoard();
	}
});


</script>

<script type="text/javascript">
$(window).load(function(){ // window.addEventListener('load', (event) => {와 동일합니다.

	  
	  if ($('.clubList').length) {
			var slideFor = $('.slider-for');
			var slideNav = $('.slider-nav');
			slideFor.slick({
				slidesToShow: 1,
				slidesToScroll: 1,
				fade: true,
				asNavFor: '.slider-nav',
				draggable: false,
				arrows:false,
				autoplay: true
			});
			slideNav.slick({
				slidesToShow: 5,
				slidesToScroll: 1,
				asNavFor: '.slider-for',
				focusOnSelect: true,
				draggable: false,
				autoplay: true
			});
		}
  });
</script>

<script type="text/javascript">
$(window).load(function(){ // window.addEventListener('load', (event) => {와 동일합니다.

	  
	  function bnr_stop(bnr, btn) {
			if (btn.text() === '정지') {
			  bnr.slick('slickPause');
			  btn.text('시작');
			  btn.addClass('start');
			  btn.removeClass('stop');
			} else {
			  bnr.slick('slickPlay');
			  btn.text('정지');
			  btn.addClass('stop');
			  btn.removeClass('start');
			};
		  };

		  /*매칭일정 슬라이드*/
		  if ($('.schedule_wrap').length) {
			var schedule_bnr = $(".schedule_list");
			schedule_bnr.slick({
			  infinite: true,
			  accessibility: true,
			  slidesToScroll: 1,
			  slidesToShow: 4,
			  autoplay: true,
			  draggable: false,
			  prevArrow: $('.schedule_control .prev'),
			  nextArrow: $('.schedule_control .next'),
			  responsive: [{
				  settings: {
					infinite: true,
					accessibility: true,
					slidesToScroll: 1,
					slidesToShow: 3,
					autoplay: true,
					draggable: false,
					prevArrow: $('.schedule_control .prev'),
					nextArrow: $('.schedule_control .next'),
				  }
				}
			  ]
			});
			$('.schedule_control .stop, .schedule_control .start').click(function() {
			  bnr_stop(schedule_bnr, $(this));
			});
		  };
		  /*//매칭일정 슬라이드*/
});
</script>

