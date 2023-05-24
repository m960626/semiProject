<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/subHeader.jsp"></jsp:include>
<title>티키타카 - 랭킹(04_01)</title>
<link rel="stylesheet" type="text/css" href="../css/pearl.css">

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
</head>
<style>
</style>
<body>
	<div id="app">
		<div class="container">
			<div class="wrap">
				<div class="BtnBox">
					<button id="ClubBtn" class="rankingBtn_click" @click="fnClubList">클럽 랭킹</button>
					<button id="SoloBtn" class="rankingBtn_form" @click="fnSoloList">개인 랭킹</button>
					
				</div>
				<div id="ClubList">
					<div class="titleBox">
						<h2>티키타카 클럽 랭킹 순위</h2>
						<select class="seasonBox" v-model="season" @change="fnClubList">
							<option value="1">2023.01 ~ 2023.03</option>
							<option value="2">2023.04 ~ 2023.06</option>
							<option value="3">2023.07 ~ 2023.09</option>
							<option value="4">2023.10 ~ 2023.12</option>
						</select>
					</div>
					<div v-if="!dataFlg">
						<div class="firstBox">
							<div class="firstImg">
								<img src="images/1st.png">
							</div>
							<div v-for="(item, index) in list">
								<div v-if="0 == index" class="firstDetail">
								구단명 : {{list[0].cName}} <br>활동지역 : {{list[0].LOCNAME}} <br>연령대 : {{list[0].cAge1}}대 ~ {{list[0].cAge2}}대
								<br>전적 : {{list[0].total}}전 {{list[0].sWin}}승 {{list[0].sDraw}}무 {{list[0].sLose}}패 (승률 : {{list[0].rate}}%)
								</div>							
							</div>
							<div>
								<img src="images/clubLogo.png">
							</div>
						</div>
						<table class="rankingList">
							<colgroup>
								<col style="width: 80px">
								<col style="width: 200px">
								<col style="width: 200px">
								<col style="width: 200px">
								<col style="width: 250px">
							</colgroup>
							<tr>
								<td scope="col"></td>
								<td scope="col">구단명</td>
								<td scope="col">활동지역</td>
								<td scope="col">연령대</td>
								<td scope="col">전적</td>
							</tr>
							<tr v-for="(item, index) in list">
								<template v-if="0 &lt; index && index &lt; 6">
									<td class="rankingTd">
										<div class="rankingBox">{{index + 1}}위</div>
									</td>
									<td>{{item.cName}}</td>
									<td>{{item.LOCNAME}}</td>
									<td>{{item.cAge1}}대 ~ {{item.cAge2}}대</td>
									<td>{{item.total}}전 {{item.sWin}}승 {{item.sDraw}}무 {{item.sLose}}패 <br>(승률 : {{item.rate}}%)</td>
								</template>
							</tr>
						</table>
						<!--  
						<div class="myRank">
							<h2>나의 클럽 랭킹</h2>
							<div class="firstBox">			
								<div class="firstImg">
									<img src="images/clubLogo.png">
								</div>
								<div v-for="(item, index) in list">
									<div v-if="0 == index" class="firstDetail">
									구단명 : {{list[0].cName}} <br>활동지역 : {{list[0].LOCNAME}} <br>연령대 : {{list[0].cAge1}}대 ~ {{list[0].cAge2}}대
									<br>전적 : {{list[0].total}}전 {{list[0].sWin}}승 {{list[0].sDraw}}무 {{list[0].sLose}}패 (승률 : {{list[0].rate}}%)
									</div>							
								</div>	
							</div>
						</div>
						-->
					</div>
					<div v-if="dataFlg">
						<div class="noGame">
						기록이 없습니다.
						</div>
					</div>
				</div>
				<div id="SoloList">
					<div class="titleBox">
						<h2>티키타카 개인 랭킹 순위</h2>
						<select class="seasonBox" v-model="season" @change="fnSoloList">
							<option value="1">2023.01 ~ 2023.03</option>
							<option value="2">2023.04 ~ 2023.06</option>
							<option value="3">2023.07 ~ 2023.09</option>
							<option value="4">2023.10 ~ 2023.12</option>
						</select>
					</div>
					<div v-if="!dataFlg">
						<div class="firstBox">
							<div class="firstImg">
								<img src="images/1st.png">
							</div>
							<div v-for="(item, index) in list">
								<div v-if="0 == index" class="firstDetail">
									닉네임 : {{list[0].nick}} <br>활동지역 : {{list[0].addr}} <br>나이 : {{list[0].birth}}
									<br>득점 : {{list[0].sgoal}}점
								</div>
							</div>
						</div>
						<table class="rankingList">
							<colgroup>
								<col style="width: 80px">
								<col style="width: 200px">
								<col style="width: 200px">
								<col style="width: 200px">
								<col style="width: 250px">
							</colgroup>
							<tr>
								<td></td>
								<td>닉네임</td>
								<td>활동지역</td>
								<td>나이</td>
								<td>득점</td>
							</tr>
							<tr v-for="(item, index) in list">
								<template v-if="0 &lt; index && index &lt; 6">
									<td class="rankingTd">
										<div class="rankingBox">{{index + 1}}위</div>
									</td>
									<td>{{item.nick}}</td>
									<td>{{item.addr}}</td>
									<td>{{item.birth}}</td>
									<td>{{item.sgoal}}</td>
								</template>
							</tr>
							<tr>
						</table>
					</div>
					<div v-if="dataFlg">
						<div class="noGame">
						기록이 없습니다.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : []
		   ,listFlg : true
		   ,season : "1"
		   ,time1 : ""
		   ,time2 : ""
		   ,dataFlg : false
		},
		methods : {
			// 클럽 순위 리스트
			 fnClubList : function(){
				$("#ClubBtn").removeClass('rankingBtn_form');
				$("#ClubBtn").addClass('rankingBtn_click');
				$("#SoloBtn").removeClass('rankingBtn_click');
				$("#SoloBtn").addClass('rankingBtn_form');
				$("#ClubList").css('display', 'block');
				$("#SoloList").css('display', 'none');
				var self = this;
				if(self.season == 1){
					self.time1 = "2023-01-01";
					self.time2 = "2023-03-31";
				}
				else if(self.season == 2){
					self.time1 = "2023-04-01";
					self.time2 = "2023-06-30";
				}
				else if(self.season == 3){
					self.time1 = "2023-07-01";
					self.time2 = "2023-09-30";
				}	
				else {
					self.time1 = "2023-10-01";
					self.time2 = "2023-12-31";
				}				
				var nparmap = {time1 : self.time1, time2 : self.time2};
				$.ajax({
					url : "/getClubRank.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {	
						if(data.result == "success"){
							self.list = data.list;
							self.dataFlg = false;
						}
						else {
							self.dataFlg = true;
						}
					}
				});
			}
			// 개인 순위 리스트
			,fnSoloList : function(){
				$("#SoloBtn").removeClass('rankingBtn_form');
				$("#SoloBtn").addClass('rankingBtn_click');
				$("#ClubBtn").removeClass('rankingBtn_click');
				$("#ClubBtn").addClass('rankingBtn_form');
				$("#SoloList").css('display', 'block');
				$("#ClubList").css('display', 'none');
				var self = this;
				if(self.season == 1){
					self.time1 = "2023-01-01";
					self.time2 = "2023-03-31";
				}
				else if(self.season == 2){
					self.time1 = "2023-04-01";
					self.time2 = "2023-06-30";
				}
				else if(self.season == 3){
					self.time1 = "2023-07-01";
					self.time2 = "2023-09-30";
				}	
				else {
					self.time1 = "2023-10-01";
					self.time2 = "2023-12-31";
				}	
				var nparmap = {time1 : self.time1, time2 : self.time2};
				$.ajax({
					url : "/getSoloRank.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if(data.result == "success"){
							self.dataFlg = false;
							self.list = data.list;
							for(var i=0; i<self.list.length; i++){
								self.list[i].addr = self.list[i].addr.slice(0,2);
								var now = new Date();
								var birth = self.list[i].birth;	                		 
		                		var age = new Date(birth);
								age = (now.getFullYear()) - (birth.slice(0,4));
		                		self.list[i].birth = age;
							}
						}
						else {
							self.dataFlg = true;
						}
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.fnClubList();
		}
	});
</script>
