<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/subHeader.jsp"></jsp:include>
<title>티키타카 - 공지사항(05_01)</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/moon.css">
<link rel="stylesheet" type="text/css" href="css/pearl.css">
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
							<a href="#" class="link"> <img src="images/home-gray.png"
								alt="">
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
							<h2>공지사항</h2>
							<p>티키타카의 공지사항을 확인해주세요.</p>
						</div>
					</div>
					<!-- // 페이지 타이틀 -->

					<!-- 게시판 게시물 갯수 -->
					<div class="tbl-total">
						<span class="post">총 <b>{{cnt}}</b>건의 게시물이 있습니다.
						</span> <span class="page">(<b>1</b>/{{pageCount}} 페이지)
						</span>
						<span v-if="sessionStatus == '2'" @click="fnadd" class="write"><a href="javascript:;" class="write"><b>글쓰기</b></a></span>
					</div>
					<!-- //게시판 게시물 갯수 -->

					<!-- 게시판 게시물 -->
					<div class="tbl tbl-list">
						<table>
							<caption>
								<strong>게시판 목록</strong>
								<p>이 표는 번호, 제목, 작성자, 작성일로 구성되었습니다.</p>
							</caption>
							<colgroup>
								<col style="width: 80px">
								<col style="width: *">
								<col style="width: 124px">
								<col style="width: 110px">
								<col style="width: 110px">
							</colgroup>
							<thead>
								<tr>
									<th class="col-number" scope="col">번호</th>
									<th class="col-title" scope="col">제목</th>									
									<th class="col-writer" scope="col">작성자</th>
									<th class="col-date" scope="col">작성일</th>
									<th class="col-writer" scope="col">조회수</th>
								</tr>
							</thead>
							<tbody>
								<!-- 등록된 게시물이 없을 시 -->
								<tr v-if="list.length == 0 ">
									<td class="col-none" colspan="4">등록된 게시글이 없습니다.</td>
								</tr>
								<!-- //등록된 게시물이 있을 시 -->
								<tr v-else class="new" v-for="(item, index) in list">
									<td class="col-number">{{item.cmNo}}</td>
									<td class="col-title align-l" @click="fnView(item.cmNo)">
									<a href="javascript:;">
									{{item.cmTitle}}
									</a>
									</td>									
									<td class="col-writer">{{item.nick}}</td>
									<td class="col-date">{{item.cmDate}}</td>
									<td class="col-writer">{{item.cmCnt}}</td>
								</tr>
							</tbody>
						</table>
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
				var nparmap = {startNum : startNum, endNum : 10, cmKind : 1};
				$.ajax({
					url : "/getBoardList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.list = data.list;
						self.cnt = data.cnt;
						self.pageCount = Math.ceil(self.cnt / 10);
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
				var nparmap = {startNum : startNum , endNum : 10, cmKind : 1};
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
						self.pageChange("/sub05_01_read", {cmNo : cmNo});
						}
				});
	    	},
	     	// 공지게시판 게시글 작성
	     	fnadd : function(){ 
	     	   location.href = "/sub05_01_add"
	    	}
		},
		created : function() {
			var self = this;
			self.fnGetList();
		}
	});
</script>
