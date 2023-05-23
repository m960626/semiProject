<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/header.jsp"></jsp:include>
<title>티키타카 - 갤러리(05_03)</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/pearl.css">
<link rel="stylesheet" type="text/css" href="css/moon.css">
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
							<a href="#" class="link"> <img
								src="images/home-gray.png" alt="">
							</a> <a href="#" class="link"> 게시판 </a> <a href="#"
								class="link point"> 공지사항 </a>
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
							<h2>갤러리</h2>
							<p>티키타카의 갤러리를 확인해주세요.</p>
						</div>
					</div>
					<!-- // 페이지 타이틀 -->

					<!-- 게시판 게시물 갯수 -->
					<div class="tbl-total">
						<span class="post">총 <b>{{cnt}}</b>건의 게시물이 있습니다.
						</span> <span class="page">(<b>1</b>/{{pageCount}} 페이지)
						</span>
						<span class="bbsWrite"><a href="javascript:;">글쓰기</a></span>
					</div>

					<!-- 게시판 게시물 -->
					<div class="photo-wrap">
						<ul class="photoList clearfix">
							<li class="empty-image" v-for="(item, index) in list"><a href="javascript:;" @click="fnView(item.cmNo)">
									<div class="infoTop">
										<span class="thumb"> <img
											src="images/gallery_basic.png" alt="">
										</span>
									</div>
									<div class="infoBottom">
										<!-- s : 20210611수정 : 자료번호 추가 -->
										<div class="clearfix">								
											<span class="date float-r"> <i class="ri-time-line"></i>
												{{item.cmDate}} 조회수 {{item.cmCnt}}											
											</span> <span class="view float-r"> <i class="ri-eye-line"></i>
												{{item.nick}}
											</span>											
										</div>
										<!-- s : 20210611수정 : 자료번호 추가 -->
										<p>
											<span class="multi-clamp-txt">{{item.cmTitle}} <small>[{{item.commCnt}}]</small> </span>
										</p>
									</div>
							</a></li>
						</ul>
					</div>
					<!-- //게시판 게시물 -->

					<!-- 페이징 추가 3-->
					<template>
						<paginate 
							:page-count="pageCount" 
							:page-range="3"
							:margin-pages="2" 
							:click-handler="fnSearch" 
							:prev-text="'<'"
							:next-text="'>'" 
							:container-class="'page_navi'"
							:page-class="'page_number'"> 
						</paginate>
					</template>			
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
			list : []
		   ,cnt : 0
		   ,selectPage: 1
		   ,pageCount: 1
		},
		methods : {
			// 글 리스트 가져오기
			fnGetList : function() {
				var self = this;
				var startNum = ((self.selectPage-1) * 10);
				var nparmap = {startNum : startNum, endNum : 12, cmKind : 3};
				$.ajax({
					url : "/getBoardList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.list = data.list;
						self.cnt = data.cnt;
						if(self.cnt >= 10){
							self.pageCount = Math.ceil(self.cnt / 12);
						}
						for(var i=0; i<self.list.length; i++){
							 var date = self.list[i].cmDate.slice(0, 10);
	                		 self.list[i].cmDate = date;
						}		
					}
				});
			}
			<!-- 페이징 추가 7-->
			, fnSearch : function(pageNum){
				var self = this;
				self.selectPage = pageNum;
				var startNum = ((pageNum-1) * 10);
				var nparmap = {startNum : startNum, endNum : 12, cmKind : 3};
				$.ajax({
					url : "/getBoardList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						self.cnt = data.cnt;
						for(var i=0; i<self.list.length; i++){
							 var date = self.list[i].cmDate.slice(0, 10);
	                		 self.list[i].cmDate = date;
						}
					}
				});
			}
			, pageChange : function(url, param) {
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
			, fnView : function(cmNo){
				var self = this;
				var nparmap = {cmNo : cmNo};
				$.ajax({
					url : "/updateCnt.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.pageChange("/sub05_03_read", {cmNo : cmNo});
						}
				});
	    	}
		},
		created : function() {
			var self = this;
			self.fnGetList();
		}
	});
</script>
