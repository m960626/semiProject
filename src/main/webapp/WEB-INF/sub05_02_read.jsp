<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/subHeader.jsp"></jsp:include>
<title>티키타카 - 자유게시판(05_02)</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/hong.css">
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
                        <h3 class="title">자유게시판</h3>
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
                            자유게시판
                        </h2>
                        <p>
                            소통해요~
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
                              <button class="" v-if="info.id == sessionId || sessionStatus == '2'"  style="float: right;" @click="fnRemove(item)">삭제</button>
                              <button class="" v-if="info.id == sessionId || sessionStatus == '2'" style="float: right;" @click="fnModify(item)">수정</button>    	
                            </div>
                          </div>
                          <div class="detail">
                            <!-- s : Editor View Area -->
                            <pre>{{info.cmCont}}</pre>
                            <!-- e : Editor View Area -->
                          </div>
                          <!-- answer -->
                          <div class="comment_wrap">
                            <h4>
                              <i class="ri-message-2-fill"></i> 댓글달기
                              (<span>{{commCnt}}</span>)
                            </h4>
                            <ul class="comment_list">
                              <li  v-for="(item, index) in commentList" v-if="item.delYn == 'N'">
                                <div class="comment">
                                  <div class="info">
                                    <span class="write">
                                      <i class="ri-user-line"></i>
                                     {{item.nick}}</span>
                                    <span class="date">
                                      <i class="ri-time-line"></i>
                                      {{item.cmcoDate}}</span>
                                  </div>
                                  <div v-if="item.cmcoNo != cmcoNo">
	                                  <p>
	                                   {{item.cmcoCont}}
	                                  </p>                                                     
	                                  <div class="btn">
	                                    <a href="javascript:;" class="replyBtn">
	                                      <i class="ri-message-2-line"></i>
	                                      답글작성
	                                    </a>
	                                    <a href="javascript:;" class="modify" @click="fnEdit(item)" v-if="sessionId == item.id">
	                                      <i class="ri-edit-2-line"></i>
	                                      수정
	                                    </a>
	                                    <a href="javascript:;" class="delete" @click="fnRemoveComment(item)" v-if="sessionId == item.id">
	                                      <i class="ri-close-line"></i>
	                                      삭제
	                                    </a>
                                  	  </div>
                                  </div>
                                  <div v-if="item.cmcoNo == cmcoNo">
                                   <div class="btn">
	                                    <a href="javascript:;" class="modify" @click="fnCancleEdit">
	                                      <i class="ri-close-line"></i>
	                                      수정 취소
	                                    </a>
                                  	  </div>
	                                  <div class="comment_write">
			                              <textarea name="" id="" placeholder="댓글을 입력해주세요." rows="6" cols="50" class="text" v-model="cInfo.cont"></textarea>
			                              <div class="btns ac clearfix">
				                              <div class="float-r" @click="fnCommentEdit">
				                              	<a href="javascript:;" class="btn-fill">수정</a>
				                              </div>
		                              	  </div>
			                          </div> 		                                                                 
                                  </div>	                                                     
                                </div>
                              </li>
                            </ul>
                                                    
                            <div class="comment_write">
                              <textarea name="" id="" placeholder="댓글을 입력해주세요." rows="6" cols="50" class="text" v-model="comment"></textarea>
                              <div class="btns ac clearfix">
                                <div class="float-r" @click="fnAddcomment">
                                  <a href="javascript:;" class="btn-fill">작성</a>
                                </div>
                              </div>
                            </div>     
                        </article>
                      </div>
                      <!-- btns -->
                      <div class="btns ac clearfix">
                        <div class="float-l">
                          <a href="/sub05_03" class="btn-outline">목록</a>
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
			info : {}
		   ,cmNo : "${map.cmNo}"
		   ,comment : ""
		   ,commentList : []
		   ,cmcoNo : ""
		   ,cInfo : {}
		   ,commCnt : 0
		   ,dataFlg : false
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
	                	console.log(self.commentList);
	                	self.commCnt = data.commCnt
                		self.dataFlg = true;
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
	            if(self.sessionId == ""){
	            	alert("회원가입 후 이용해주세요.");
	            }
	            else {
		            if(self.comment == ""){
		            	alert("내용을 입력해주세요.");	         
		            }
		            else{
			            var nparmap = {cmNo : self.cmNo, comment : self.comment, id : self.sessionId};
			            $.ajax({
			                url:"/addcomment.dox",
			                dataType:"json",	
			                type : "POST", 
			                data : nparmap,
			                success : function(data) {  
			                	self.comment = "";
			                	self.fnGetBoard();        
			                }
			            }); 
		            }
	            }
	        }
			, fnRemoveComment : function(item){
				if (!confirm("댓글을 삭제하시겠습니까?")) {
			    } 
				else {
			    // 확인(예) 버튼 클릭 시 이벤트		
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
	    	}	
			, fnEdit : function(item){
	    		var self = this;
	    		self.cmcoNo = item.cmcoNo;
	    		self.cInfo = item;
	    		self.cInfo.cont = item.cmcoCont;
	    		
	    	}
			, fnCancleEdit : function(){
	    		var self = this;
	    		self.cmcoNo = "";
			}
	    	, 
	    	fnCommentEdit: function () {
				var self = this;
				if(self.comment == ""){
	            	alert("내용을 입력해주세요.");	         
	            }
				else {
					var nparmap = self.cInfo;
					$.ajax({
						url: "/editcomment.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function (data) {
							alert("수정되었습니다.");
							self.cmcoNo = "";
							self.cInfo = {};
							self.commentNo = "";
							self.fnGetBoard();
						}
					});    		
		    	}
	    	}, pageChange : function(url, param) { 
	    		var target = "_self";
	    		if(param == undefined){
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
	    	},
	    	// 소통게시판 수정 버튼
	    	fnModify : function(item){ 
	     		 var self = this;
	    		self.pageChange("/sub05_02_modify", {cmNo : self.cmNo});  
	    	},
	    	// 소통게시판 삭제 버튼
	    	fnRemove : function(item){
				if (!confirm("게시글을 삭제하시겠습니까?")) {
			    } 
				else {
		    		var self = this;
		            var nparmap = {cmNo : self.cmNo};
		            $.ajax({
		                url:"/cm/remove.dox",
		                dataType:"json",	
		                type : "POST", 
		                data : nparmap,
		                success : function(data) {
			                alert("삭제되었습니다.");
			                location.href="sub05_02";
		                }
		            }); 
			    }
	    	}
		},
		created : function() {
			var self = this;
			self.fnGetBoard();
		}
	});
</script>
