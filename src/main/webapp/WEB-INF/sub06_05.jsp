<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/header.jsp"></jsp:include>
<title>티키타카 - 예약현황(06_05)</title>
<link rel="stylesheet" type="text/css" href="../css/pearl.css">
<link rel="stylesheet" type="text/css" href="../css/sen.css">
<link rel="stylesheet" type="text/css" href="../css/moon.css">
<link rel="stylesheet" type="text/css" href="../css/hong.css">


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

<body>
	<div id="app">
		<div class="container">
			<div class="wrap">
				<div class="matching__body" >
 <!-- ========================================================== 매치 예약 조회 =============================================================== -->
	<div class="matching_title">
						<h2 class="mh2">매칭 내역</h2>
					</div>
							<div class="matching_list" v-for="item in list">
								<div class="matching_inner">
									<div class="dateBox">
										<div class="date">
											{{item.mDate}} <br>{{item.mTimeS}}
										</div>
									</div>
									<div class="titleBox">
										<div class="matchLoc"
											v-bind:class="{'loc_color1' : item.fLoc ==  '서울',
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
										<div v-if="item.mGender == 1" class="matchGender">남자 11 VS
											11</div>
										<div v-else-if="item.mGender == 2" class="matchGender">여자
											11 VS 11</div>
										<div v-else class="matchGender">혼성 11 VS 11</div>
									</div>
									<div class="btnBox">
										<button class="clubBtn" @click="fnAclub()">상대 클럽 보기</button>
										<button class="fieldBtn" @click="fnfield()">구장 정보 보기</button>
										<button class="editBtn" onclick="opendimmed()">참여 인원 수정</button>
									</div>
							</div>
						</div>
					
					
					<!-- 페이징 추가 3 -->
					<template>
						<paginate :page-count="pageCount" :page-range="3"
							:margin-pages="2" :click-handler="fnSearch" :prev-text="'<'"
							:next-text="'>'" :container-class="'pagination'"
							:page-class="'page-item'"> </paginate>
					</template>

	


	<!-- ========================================================== 참여인원 수정 =============================================================== -->

	<!-- ========================================================== 종료된 매치 조회 =============================================================== -->
					<div class="matching_title">
						<h2 class="mh2">종료된 매치</h2>
					</div>
					<!--  -->
					<div class="matching_list" v-for="(item, index) in endlist">
						<div class="matching_inner">
							<div class="dateBox">
								<div class="date">
									{{item.mDate}} <br>{{item.mTimeS}}
								</div>
							</div>
							<div class="titleBox">
								<div class="matchLoc"
									v-bind:class="{'loc_color1' : item.fLoc ==  '서울',
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
								<div v-if="item.mGender == 1" class="matchGender">남자 11 VS
									11</div>
								<div v-else-if="item.mGender == 2" class="matchGender">여자
									11 VS 11</div>
								<div v-else class="matchGender">혼성 11 VS 11</div>
							</div>
							<div class="btnBox">
								<button class="recordBtn" @click="[fnRecord(item), fnGPlayList(item)]">
									경기 기록하기<i class="ico_arrow"></i>
								</button>
							</div>
						</div> 
<!-- ========================================================== 경기 참가선수 기록 =============================================================== -->
						<div class="matching_record" v-if="item.mNo == setNum">
							<table border="1" width="100%" class="record_table">
								<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">선수명</th>
										<th scope="col">득점</th>
										<th scope="col">도움</th>
										<th scope="col">경고</th>
										<th scope="col">퇴장</th>
									</tr>
								</thead>
								<tbody>
									<tr v-for="(item, index) in gplaylist">  
										<td>{{item.name}}</td>
										<td><input type="text" id="goal" name="goal" v-model="item.goal"></td>
										<td><input type="text" id="assi" name="assi" v-model="item.assi"></td>
										<td><input type="text" id="yCard" name="yCard" v-model="item.yCard"></td>
										<td><input type="text" id="rCard" name="rCard" v-model="item.rCard"></td>
									</tr>
								</tbody>
							</table>
							<div class="foot_btn">
								<button class="btn_form" id="btn_sumit" @click="fnAddRecord()">기록하기</button>
							</div>
						</div>

						<div class="none" v-if="mFail">종료된 매칭이 없습니다.</div>
					</div>

				</div>
									
			</div>

				<!-- 페이징 추가 3 -->
					<template>
						<paginate 
							:page-count="pageCount" 
							:page-range="3"
							:margin-pages="2" 
							:click-handler="fnSearch" 
							:prev-text="'<'"
							:next-text="'>'" 
							:container-class="'pagination'"
							:page-class="'page-item'"> 
						</paginate>
					</template>
					
<!-- ========================================================== 참여인원 수정 =============================================================== -->					
			 <div id="myModal" class="editDimmed">
				    <div class="editDimmed-content">
				        <h1>참여인원 수정</h1>
				        <h2>클럽원</h2>
			        <table>
				        <thead>
			                <tr>
			                    <th>선택</th>
			                    <th>No.</th>
			                    <th>이름</th>
			                    <th>포지션</th>
			                    <th>득점수</th>
			                    <th>활동 경기수</th>
			                </tr>
			            </thead>
				        <tbody>
				        <tr v-for="item in guserlist">
				            <td><input type="checkbox"></td>
				            <td></td>
				            <td></td>
				            <td>ST/CF</td>
				            <td>20</td>
				            <td>10</td>
				        </tr>				
				    </tbody>
				</table>
				<h2>용병</h2>
				<table>
				    <thead>
				        <tr>
				            <th>선택</th>
				            <th>No.</th>
				            <th>이름</th>
				            <th>포지션</th>
				            <th>득점수</th>
				            <th>활동 경기수</th>
				        </tr>
				    </thead>
				    <tbody>
				        <tr>
				            <td><input type="checkbox"></td>
				            <td></td>
				            <td>김용병</td>
				            <td>CF/LW</td>
				            <td>10</td>
				            <td>5</td>
				        </tr>	    
				    </tbody>
				</table>
				        <button class="btn">저장</button>
				        <button onclick="closedimmed()">취소</button>
				    </div>
				  </div>
			
	
			</div>
 
		</div>

	<script type="text/javascript">
	/*
	$(document).on("click", ".recordBtn", function() {
          $('.matching_record').slideToggle(200);
    });
	*/
    </script>

</body>


</html>
<script type="text/javascript">
Vue.component('paginate', VuejsPaginate)
var app = new Vue({
	el : '#app',
	data : {
		list : []
	   , endlist : []
	   , gplaylist : []
	   , guserlist : []
	   , selectPage: 1
	   , pageCount: 1
	   , cnt : 0
	   , mStat : ""
	   , mFail : true
	   , info : {
		   goal : []
		   , assi : []
		   , yCard : []
		   , rCard : []
	   },
	   setNum: ''
	   , closeSize : 0

	},
    mounted() {
	      // 페이지 로드 시 input 필드 비활성화
	      this.disableInputFields();
	    },
	methods : {
	// ======================================== 매치 리스트 가져오기 ========================================
		fnGetList : function(){
    		var self = this;
    		 <!-- 페이징 추가 6-->
 			var startNum = ((self.selectPage-1) * 10);
    		var nparmap ={startNum : startNum};
             $.ajax({
                 url:"/Schedule/List.dox",
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
		},
		// ======================================== 참가인원 수정 버튼 ========================================
			
			
			
			
			
			
			
	   // ======================================== 종료된 매치 조회 ========================================
		fnEndList : function(){
    		var self = this;
    		 <!-- 페이징 추가 6-->
 			var startNum = ((self.selectPage-1) * 10);
    		var nparmap ={startNum : startNum};
             $.ajax({
                 url:"/EndSchedule/List.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {
                	 if(data.result == "success"){
                		 self.mFail = false
	                	 self.endlist = data.endlist; 
	                	 self.cnt = data.cnt;
	                	 /* for(var i=0; i<self.cnt; i++){
	                		self.info.goal[i] = 0;
	                		self.info.assi[i] = 0;
	                		self.info.yCard[i] = 0;
	                		self.info.rCard[i] = 0;
	                	 } */
	                	 
	                	 console.log(self.endlist);
		 	             self.pageCount = Math.ceil(self.cnt / 10);
		 	          
	                	 for(var i=0; i<self.endlist.length; i++){
	                		 var loc = self.endlist[i].fLoc.slice(0, 2);
	                		 self.endlist[i].fLoc = loc;	
	                		 
	                		 var tDate = self.endlist[i].mDate;	                		 
	                		 var lDate = new Date(tDate);
							 tDate = (lDate.getMonth()+1) + "월 " + lDate.getDate() + "일"
	                		 self.endlist[i].mDate = tDate;
	                		 
	                		 var time = self.endlist[i].mTimeS.slice(0, 5);
	                		 self.endlist[i].mTimeS = time;
                	
                	 	}
                	 }
                 }
             }); 
		},
		// ======================================== 경기 참가 선수 조회 ========================================
		fnGPlayList : function(item) {
			   var self = this;
			   var nparmap = {};
			   if(item != undefined){
				   nparmap = {mNo : item.mNo};  
			   }
	            $.ajax({
	                url:"/GPlayer/List.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {  
	                	self.gplaylist = data.gplaylist;
	                }
	            }); 
		},
        // ======================================== 다른 매치 기록 초기화 ========================================
        fnRecord : function(item) {
        	var self = this;
			console.log(self.gplaylist.length);
        	for(var i=0; i<self.gplaylist.length; i++){
        		self.info.goal[i] = "";
        		self.info.assi[i] = "";
        		self.info.yCard[i] = "";
        		self.info.rCard[i] = "";
        		
        	}
        	self.setNum = item.mNo;
        
        	
        },
        // ======================================== 참가선수 기록 업데이트 ========================================
        fnAddRecord : function(){ 
            var self = this;
            var nparmap = {list : JSON.stringify(self.gplaylist)};
            console.log(self.gplaylist);

            // Disable input fields
            var inputFields = document.querySelectorAll('input[type="text"]');
            inputFields.forEach(function(field) {
              field.disabled = true;
            });

            $.ajax({
              url:"/GPlayer/edit.dox", 
              dataType:"json",	
              type : "POST", 
              data : nparmap,
              success : function(data) {  
                alert("기록이 저장되었습니다.");
              }
            });  
          }, 
		// ======================================== 선수 누적기록 업데이트 ========================================
		/* fnEditPlayer : function(){ 
            var self = this;
             var nparmap = {
            		       goal : self.info.goal 
            			   , assi : self.info.assi
            			   , yCard : self.info.yCard
            			   , rCard : self.info.rCard}; 
          
             $.ajax({
                url:"/GPlayer/Update.dox", 
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	console.log(data);
                	alert("기록이 저장되었습니다.");

                }
            }); 
             
            
        } ,  */
         	// ======================================== 페이지 체인지 ========================================
        	pageChange : function(url, param) {
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
	     	// 상대클럽 페이지 이동
	     	fnAclub : function(cNo){  
	    		var self = this;
	    		self.pageChange("./.do", {cNo});  
	    	},
	     	// 구장정보 페이지 이동
	     	fnfield : function(fNo){
	    		var self = this;
	    		self.pageChange("./.do", {fNo});  
	    	},
	    	// ======================================== 경기 참가인원 선택리스트 ========================================
			fnGUserList : function() {
				   var self = this;
				   var nparmap = {};
				   if(item != undefined){
					   nparmap = {};  
				   }
		            $.ajax({
		                url:"/GUser/List.dox",
		                dataType:"json",	
		                type : "POST", 
		                data : nparmap,
		                success : function(data) {  
		                	self.guserlist = data.guserlist;
		                    console.log(self.guserlist)
		                }
		            }); 
			}
  	
			
	},
	created : function() {
		var self = this;
		self.fnGetList();
		self.fnEndList();
		self.fnGPlayList();
		
	}
	
});	

	//dimmed 창 열기
	function opendimmed() {
	  var modal = document.getElementById("myModal");
	  modal.style.display = "block";
	}
	
	// dimmed 창 닫기
	function closedimmed() {
	  var modal = document.getElementById("myModal");
	  modal.style.display = "none";
	}
	
	// 선택인원 제한
	$(document).ready(function () {
        $("input[type='checkbox']").on("click", function(){
            let count = $("input:checked[type='checkbox']").length;

            if(count > 11){
                $(this).prop("checked", false);
                alert("11명까지만 선택할 수 있습니다.")
            }
        }) 
    });

</script>
