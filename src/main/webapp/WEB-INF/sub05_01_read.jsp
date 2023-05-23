<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/header.jsp"></jsp:include>
<title>티키타카 - 공지사항(05_01)</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<!-- 페이징 추가 1-->
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
</head>
<style>
</style>
<body>
	<div id="app">
		    <div class="subContainer-wrap">
        <div class="box-visual">
            <div class="wrap">
                <div class="box-navigation">
                    <div class="links">
                        <a href="#" class="link">
                            <img src="../resources/images/home-gray.png" alt="">
                        </a>
                        <a href="#" class="link">
                            게시판
                        </a>
                        <a href="#" class="link point">
                            공지사항
                        </a>
                    </div>

                    <div class="bottom">
                        <h3 class="title">공지사항</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="subContainer">
            <div class="wrap">
                <!-- 컨텐츠 영역 -->

                <!-- 페이지 타이틀 -->
                <div class="sub-top-area">
                    <div class="page-title">
                        <h2>
                            공지사항
                        </h2>
                        <p>
                            티키타카의 공지사항을 확인해주세요.
                        </p>
                    </div>
                </div>
                <!-- // 페이지 타이틀 -->


                <div class="bbs-wrap">
                    <div class="result">
                      <div class="read">
                        <article>
                          <div class="upr">
                            <h3><span>{{info.cmTitle}}</span></h3>
                            <div class="info">
                              <span class="writer"><i class="ri-user-line"></i><b class="hid">작성자</b><span>{{info.nick}}</span></span>
                              <span class="date"><i class="ri-time-line"></i><b class="hid">작성일</b><span>{{info.cmDate}}</span></span>
                              <span class="date"><i class="ri-time-line"></i><b class="hid">조회수</b><span>조회수 {{info.cmCnt}}</span></span>
                            </div>
                          </div>
                          <div class="detail">
                            <!-- s : Editor View Area -->
                            <pre>{{info.cmCont}}</pre>
                            <!-- e : Editor View Area -->
                          </div>
                          <!-- answer -->
                          <div class="comment_wrap">
                            <ul class="comment_list">
                            </ul>
                          </div>
                        </article>
                      </div>
                      <!-- btns -->
                      <div class="btns ac clearfix">
                        <div class="float-l">
                          <a href="/sub05_01" class="btn-outline">목록</a>
                        </div>
                      </div>
                    </div>
                  </div>
            </div>
                <!-- 컨텐츠 영역 끝 -->
            </div>
        </div>
    </div>
</body>
</html>
<script type="text/javascript">
Vue.component('paginate', VuejsPaginate)
	var app = new Vue({
		el : '#app',
		data : {
			sessionId : "${sessionId}",
			sessionNickName : "${sessionNickName}",
			sessionStatus : "${sessionStatus}",
			info : []
		   ,cmNo : "${map.cmNo}"
		   ,comment : ""
		   ,commentList : []
		   ,cInfo : {}
		   ,editFlg : false
		   ,cont : ""
		   ,commentNo : ""
		   ,commentInfo : {}
		   
		},
		methods : {
			fnGetBoard : function(){
	            var self = this;
	            var nparmap = {cmNo : self.cmNo};
	            $.ajax({
	                url:"/read.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
	                	self.info = data.info;
	                	self.commentList = data.commentList;
	                	for(var i=0; i<self.commentList.length; i++){
	                		 var cmcoDate = self.commentList[i].cmcoDate.slice(0, 10);
	                		 self.commentList[i].cmcoDate = cmcoDate;
	                	}
						 var date = self.info.cmDate.slice(0, 10);
                		 self.info.cmDate = date;
	                }
	            }); 
	        }	
			, fnAddcomment : function(){
	            var self = this;
	            var nparmap = {cmNo : self.cmNo, comment : self.comment};
	            $.ajax({
	                url:"/addcomment.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {            
	                	self.info = data.info;
	                	self.comment = "";
	                	self.fnGetBoard();        
	                }
	            }); 
	        }
			, fnRemoveComment : function(item){
	    		var self = this;
	            var nparmap = {cmcoNo : item.cmcoNo};
	            $.ajax({
	                url:"/removecomment.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
		                alert("삭제되었습니다.");
		                self.fnGetBoard();
	                }
	            }); 
	    	}	    	
	    	, fnEdit : function(item){
	    		var self = this;
	    		self.commentNo = item.cmNo;
	    		self.commentInfo = item;
	    	}
		},
		created : function() {
			var self = this;
			self.fnGetBoard();
		}
	});
</script>
