<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/subHeader.jsp"></jsp:include>
<link rel="stylesheet" href="css/style.css">
<title>티키타카 - 매칭 조회(02_03)</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/pearl.css">

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

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
	            <div class="sub_title">
	                <h2>매칭 조회</h2>
	            </div>
	            <div class="matching__body">
	                <div class="matching_list" v-for="item in list">
	                    <div class="matching_inner">
	                        <div class="dateBox">
	                            <div class="date">
	                                {{item.mDate}}<br>
	                                {{item.mTimeS}}
	                            </div>
	                        </div>
	                        <div class="titleBox">
	                            <div class="matchLoc" v-bind:class="{'loc_color1' : item.fLoc ==  '서울',
                                									 'loc_color2' : item.fLoc ==  '경기',
                                									 'loc_color3' : item.fLoc ==  '인천',
                                									 'loc_color4' : item.fLoc ==  '강원',
                                									 'loc_color5' : item.fLoc ==  '충북',
                                									 'loc_color6' : item.fLoc ==  '경북',
                                									 'loc_color7' : item.fLoc ==  '세종',
                                									 'loc_color8' : item.fLoc ==  '대전',
                                									 'loc_color9' : item.fLoc ==  '대구',
                                									 'loc_color10' : item.fLoc ==  '충남',
                                									 'loc_color11' : item.fLoc ==  '전북',
                                									 'loc_color12' : item.fLoc ==  '경남',
                                									 'loc_color13' : item.fLoc ==  '울산',
                                									 'loc_color14' : item.fLoc ==  '전남',
                                									 'loc_color15' : item.fLoc ==  '광주',
                                									 'loc_color16' : item.fLoc ==  '부산',
                                									 'loc_color17' : item.fLoc ==  '제주'
                              										}">{{item.fLoc}}</div>
	                            <div class="matchTitle">{{item.fName}}</div>
	                            <div v-if="item.mGender == 1"class="matchGender">남성 11 VS 11</div>
	                            <div v-else-if="item.mGender == 2" class="matchGender">여자 11 VS 11</div>
	                       		<div v-else class="matchGender"> 혼성 11 VS 11</div>
	                        </div>
	                        <div class="btnBox">
	                            <button class="clubBtn">상대 클럽 보기</button>
	                            <button class="fieldBtn"  @click="fnView(item.mNo)">구장 정보 보기</button>
	                        </div>
	                    </div><!-- // matching_inner -->
	                </div><!-- // matching_list -->
	            </div><!-- // matching__body -->
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
		   ,selectPage: 1
		   ,pageCount: 1
		   ,cnt : 0
		},
		methods : {
			// 매치 리스트 가져오기
			fnGetList : function(){
	    		var self = this;
	    		 <!-- 페이징 추가 6-->
	 			var startNum = ((self.selectPage-1) * 10);
	    		var nparmap ={startNum : startNum};
	             $.ajax({
	                 url:"/matching/getList.dox",
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
			<!-- 페이징 추가 7-->
			, fnSearch : function(pageNum){
				var self = this;
				self.selectPage = pageNum;
				var startNum = ((pageNum-1) * 10);
				var nparmap = {startNum : startNum};
				$.ajax({
					url : "/matching/getList.dox",
					dataType : "json",
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
	    	, fnView : function(mNo){
	    		var self = this;
				self.pageChange("/sub02_04", {mNo : mNo});					
	    	}
			
		},
		created : function() {
			var self = this;
			self.fnGetList();
		}
		
});	
</script>