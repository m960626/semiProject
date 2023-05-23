<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/header.jsp"></jsp:include>
<title>티키타카 - 용병 모집(03_02)</title>
<link rel="stylesheet" type="text/css" href="../css/pearl.css">

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
		<div class="container">
			<div class="wrap">
				<div class="support__haed">
					<div class="sub_title">
						<h2>용병모집</h2>
						<a href="javascript:;" class="write"><i class="ico_pencil"></i>글쓰기</a>
					</div>
					<div class="head_select">
						<select name="" id="">
							<option value="">전체</option>
							<option value="">1</option>
							<option value="">2</option>
						</select> <select name="" id="">
							<option value="">전체</option>
							<option value="">1</option>
							<option value="">2</option>
						</select>
					</div>
				</div>
				<div class="support__body">
					<div class="support_list">
						<div class="support_inner" v-for="(item, index) in list">
							<a href="javascript:;" @click="fnView(item.gNo)"
								v-if="item.gPCnt > item.getCnt">
								<div class="details_head">
									<span class="post_type type_1">{{item.loc}}</span> <span
										class="post_type type_2">{{item.gAge}}</span> <span
										class="post_type type_3" v-if="item.gp1 != null">공격수</span> <span
										class="post_type type_3" v-if="item.gp2 != null">미드필더</span> <span
										class="post_type type_3" v-if="item.gp3 != null">수비수</span> <span
										class="post_type type_3" v-if="item.gp4 != null">골키퍼</span>
								</div>
								<div class="details_title">{{item.gTitle}}</div>
								<div class="details_text">
									<p>{{item.gInfo}}</p>
								</div>
								<div class="details_foot">
									<div class="nickName">작성자 : {{item.id}}</div>
									<div class="time"
										v-if="item.time1 == 0 && item.time2 == 0 && item.time3 == 0 ">방금전</div>
									<div class="time"
										v-else-if="item.time1 > 0 && item.time2 == 0 && item.time3 == 0 ">{{item.time1}}분전</div>
									<div class="time"
										v-else-if="item.time1 == 0 && item.time2 > 0 && item.time3 == 0 ">{{item.time2}}시간전</div>
									<div class="time"
										v-else-if="item.time1 == 0 && item.time2 == 0 && item.time3 > 0 ">{{item.time3}}개월전</div>
								</div>
							</a> <a href="javascript:;" @click="fnView(item.gNo)" v-else>
								<div class="details_head">
									<span class="post_type type_4">모집 마감</span>
								</div>
								<div class="details_title">{{item.gTitle}}</div>
								<div class="details_text">
									<p>{{item.gInfo}}</p>
								</div>
								<div class="details_foot">
									<div class="nickName">작성자 : {{item.id}}</div>
									<div class="time"
										v-if="item.time1 == 0 && item.time2 == 0 && item.time3 == 0 ">방금전</div>
									<div class="time"
										v-else-if="item.time1 > 0 && item.time2 == 0 && item.time3 == 0 ">{{item.time1}}분전</div>
									<div class="time"
										v-else-if="item.time1 == 0 && item.time2 > 0 && item.time3 == 0 ">{{item.time2}}시간전</div>
									<div class="time"
										v-else-if="item.time1 == 0 && item.time2 == 0 && item.time3 > 0 ">{{item.time3}}개월전</div>
								</div>
							</a>
						</div>
					</div>
					<!-- //support_list -->

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
					
					<!-- //page_navi -->
				</div>
				<!-- // support__body -->
			</div>
			<!-- // wrap -->
		</div>
		<!-- // container -->
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
	   		,selectPage: 1
	   		,pageCount: 1
	   		,pageCnt : 0
		},
		methods : {
			// 리스트 불러오기
			fnGetList : function(){
                var self = this;
                var startNum = ((self.selectPage-1) * 6);
	    		var nparmap ={startNum : startNum};
                $.ajax({
                    url:"/Guest/getList.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {    
                    	console.log(data);
                    	self.list = data.list;
                    	self.pageCnt = data.pageCnt;
                    	self.pageCount = Math.ceil(self.pageCnt / 6);
    	                for(var i=0; i<self.list.length; i++) {
    	                	/* 경기장 위치 확인 */
    	                	var loc = self.list[i].fLoc.substr(0, 2);
    	                	self.list[i].loc = loc;
    	                	
    	                	/* 작성 시간 확인 */
    	                	var timeValue = new Date(self.list[i].gDate);
    	                	var today = new Date();
    	                	
    	                	var betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);


    	                    var betweenTimeDay = Math.floor(betweenTime / 60 / 24);
    	                    if (betweenTimeDay < 365) {
    	                		self.list[i].time1 = 0;
    	                		self.list[i].time2 = 0;
    	                    	self.list[i].time3 = betweenTimeDay;
    	                    }

    	                	var betweenTimeHour = Math.floor(betweenTime / 60);
    	                    if (betweenTimeHour < 24) {
    	                		self.list[i].time1 = 0;
    	                    	self.list[i].time2 = betweenTimeHour;
    	                    }
    	                    
    	                	if (betweenTime < 1) {
    	                		self.list[i].time1 = 0;
    	                	}
    	                	else if (betweenTime < 60) {
    	                		self.list[i].time1 = betweenTime;
    	                    }
    	                    /*
    	                    else {
    	                    	${Math.floor(betweenTimeDay / 365)}년전`;
    	                    }
    	                    */
    	                	
        	                /* 선호 포지션 확인 */
    	                	var arr = [];
    	                	arr[0] = self.list[i].gPosi1;
    	                	arr[1] = self.list[i].gPosi2;
    	                	arr[2] = self.list[i].gPosi3;
    	                	for(var j=0; j<3; j++) {
    	                		/* 공격수 */
    	                		if(arr[j] == 'ST' || arr[j] == 'CF' || arr[j] == 'LW' || arr[j] == 'RW') {
        	                		self.list[i].gp1 = '1';
        	                	}	
        	                	/* 미드필더 */
        	                	else if (arr[j] == 'CM' || arr[j] == 'CAM' || arr[j] == 'CD' || arr[j] == 'LM' || arr[j] == 'RM') {     
        	                		self.list[i].gp2 = '1';
        	                	}
        	                	/* 수비수 */
        	                	else if (arr[j] == 'CB' || arr[j] == 'LB' || arr[j] == 'RB') {
        	                		self.list[i].gp3 = '1';
        	                	}
        	                	else if(arr[j] == 'GK'){
        	                		self.list[i].gp4 = '1';
        	                	}
    	                	}
    	                }
    	                console.log(self.list)
                    }
                }); 
            }
		<!-- 페이징 추가 7-->
		, fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 6);
			var nparmap = {startNum : startNum};
			$.ajax({
				url : "/Guest/getList.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
					self.pageCnt = data.pageCnt;
					self.pageCount = Math.ceil(self.pageCnt / 6);
					for(var i=0; i<self.list.length; i++) {
	                	/* 경기장 위치 확인 */
	                	var loc = self.list[i].fLoc.substr(0, 2);
	                	self.list[i].loc = loc;
	                	
	                	/* 작성 시간 확인 */
	                	var timeValue = new Date(self.list[i].gDate);
	                	var today = new Date();
	                	
	                	var betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);


	                    var betweenTimeDay = Math.floor(betweenTime / 60 / 24);
	                    if (betweenTimeDay < 365) {
	                		self.list[i].time1 = 0;
	                		self.list[i].time2 = 0;
	                    	self.list[i].time3 = betweenTimeDay;
	                    }

	                	var betweenTimeHour = Math.floor(betweenTime / 60);
	                    if (betweenTimeHour < 24) {
	                		self.list[i].time1 = 0;
	                    	self.list[i].time2 = betweenTimeHour;
	                    }
	                    
	                	if (betweenTime < 1) {
	                		self.list[i].time1 = 0;
	                	}
	                	else if (betweenTime < 60) {
	                		self.list[i].time1 = betweenTime;
	                    }
	                    /*
	                    else {
	                    	${Math.floor(betweenTimeDay / 365)}년전`;
	                    }
	                    */
	                	
    	                /* 선호 포지션 확인 */
	                	var arr = [];
	                	arr[0] = self.list[i].gPosi1;
	                	arr[1] = self.list[i].gPosi2;
	                	arr[2] = self.list[i].gPosi3;
	                	for(var j=0; j<3; j++) {
	                		/* 공격수 */
	                		if(arr[j] == 'ST' || arr[j] == 'CF' || arr[j] == 'LW' || arr[j] == 'RW') {
    	                		self.list[i].gp1 = '1';
    	                	}	
    	                	/* 미드필더 */
    	                	else if (arr[j] == 'CM' || arr[j] == 'CAM' || arr[j] == 'CD' || arr[j] == 'LM' || arr[j] == 'RM') {     
    	                		self.list[i].gp2 = '1';
    	                	}
    	                	/* 수비수 */
    	                	else if (arr[j] == 'CB' || arr[j] == 'LB' || arr[j] == 'RB') {
    	                		self.list[i].gp3 = '1';
    	                	}
    	                	else if(arr[j] == 'GK'){
    	                		self.list[i].gp4 = '1';
    	                	}
	                	}
	                }
				}
			});
		},pageChange : function(url, param) {
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
            , fnView : function(gNo){
        		var self = this;
        		self.pageChange("./sub03_03.do", {gNo : gNo});
        	}
		},
		created : function() {
        	var self = this;
        	self.fnGetList();
		}
		
});	
</script>