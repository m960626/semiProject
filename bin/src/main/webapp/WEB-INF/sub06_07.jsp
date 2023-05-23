<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/header.jsp"></jsp:include>
<title>티키타카 - 최근기록(06_07)</title>
<link rel="stylesheet" type="text/css" href="css/pearl.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/sen.css">

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
</head>
<style>
</style>
<body>
	<div id="app">
		<div class="container">
	        <!-- wrap -->
	        <div class="wrap">
	            <!-- 소속 클럽이 있는 유저일 때 -->
	            <div class="case1_clubUser" v-if="clubFlg && dataFlg">
	                <div class="boxes">
	                    <div class="userImg"><img src="../resources/images/profile.PNG"></div>
	                    <div class="userImg profile">
	                        <span class="imgTitle">{{info.name}}</span>
	                        <span class="imgTitle">({{info.nick}})</span>
	                        <ul class="imgList">
	                            <li><span> </span></li>
	                            <li class="perInfo_li">
	                            포지션 : <span v-if="info.position1 != null">{{info.position1}}</span>
	                            		<span v-if="info.position2 != null">, {{info.position2}}</span>
	                            		<span v-if="info.position3 != null">, {{info.position3}}</span>
	                            </li>
	                        </ul>
	                    </div>
	                    <div class="userImg clubLogo">대충클럽로고</div>
	                    <div class="userImg">
	                        <div class="imgTitle">{{info.cName}}<small> 소속</small></div>
	                        <ul class="perInfo_ul">
	                            <li class="perInfo_li club">순위 : <span> {{info.ranking}} 위</span></li>
	                            <li class="perInfo_li club">진행한 경기 : <span> {{info.cWin + info.cLose + info.cDraw}} 경기</span></li>
	                            <li class="perInfo_li club">승 : <span> {{info.cWin}}</span></li>
	                            <li class="perInfo_li club">패 : <span> {{info.cLose}}</span></li>
	                            <li class="perInfo_li club">무 : <span> {{info.cDraw}}</span></li>
	                            <li class="perInfo_li club">승률 : <span> {{info.rate}} %</span></li>
	                        </ul>
	                    </div>
	                </div>    
	                <table class="club_perInfo">
	                    <thead class="club_wait0">
	                        <tr class="club_wait1">
	                            <th scope="col">참여 경기 수</th>
	                            <th scope="col">득점</th>
	                            <th scope="col">어시스트</th>
	                            <th scope="col">경고</th>
	                            <th scope="col">퇴장</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr class="club_wait2">
	                         	<td>{{info.mCnt}}</td>
	                            <td>{{info.mgoal}}</td>
	                            <td>{{info.massi}}</td>
	                            <td>{{info.myCard}}</td>
	                            <td>{{info.mrCard}}</td>	                
	                        </tr>
	                    </tbody>
	                </table>      
	            </div>
	            <!-- 용병유저일때(클럽소속없음) -->
	            <div class="case2_guestUser" v-if="!clubFlg">
	                <div class="boxes">
	                    <div class="userImg"><img src="../resources/images/profile.PNG"></div>
	                    <div class="userImg profile">
	                        <span class="imgTitle">{{info.name}}</span>
	                        <span class="imgTitle">({{info.nick}})</span>
	                        <ul class="imgList">
	                            <li><span> </span></li>
	                            <li class="perInfo_li">포지션 : 
	                            		<span v-if="info.position1 != null">{{info.position1}}</span>
	                            		<span v-if="info.position2 != null">, {{info.position2}}</span>
	                            		<span v-if="info.position3 != null">, {{info.position3}}</span>
	                        </ul>
	                    </div>
	                </div>
	                <table class="club_perInfo">
	                    <thead class="club_wait0">
	                        <tr class="club_wait1">
	                            <th scope="col">참여 경기 수</th>
	                            <th scope="col">득점</th>
	                            <th scope="col">어시스트</th>
	                            <th scope="col">경고</th>
	                            <th scope="col">퇴장</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr class="club_wait2">
            	                <td>{{info.mCnt}}</td>
	                            <td>{{info.mgoal}}</td>
	                            <td>{{info.massi}}</td>
	                            <td>{{info.myCard}}</td>
	                            <td>{{info.mrCard}}</td>

	                        </tr>
	                    </tbody>
	                </table>          
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
			sessionId : "${sessionId}",
			sessionNickName : "${sessionNickName}",
			sessionStatus : "${sessionStatus}"
		   ,info : {}
		   ,clubFlg : true
		   ,dataFlg : false
		},
		methods : {	
			fnGetInfo : function() {
				var self = this;
				var nparmap = {sessionId : self.sessionId};
				$.ajax({
					url : "/getinfo.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {	
						self.info = data.info;
						console.log(data.info);
						if(self.info != undefined){
							self.dataFlg = true;
							if(self.info.cName != "" && self.info.cName != null){
								self.clubFlg = true;
							}
							else {
								self.clubFlg = false;
							}
						}
						else {
							self.dataFlg = false;
						}
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.fnGetInfo();
		}
	});
</script>
