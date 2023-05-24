<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/subHeader.jsp"></jsp:include>
<title>티키타카 - 최근기록(06_07)</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<link rel="stylesheet" type="text/css" href="../css/hong.css">
<link rel="stylesheet" type="text/css" href="../css/pearl.css">

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
</head>
<style>
</style>
<body>
	<div id="app">
		<div class="container">
	        <!-- wrap -->
	        <div class="wrap recent_record__wrap">
	            <!-- 소속 클럽이 있는 유저일 때 -->
	            <div  id="tab1" class="recent_record__case" v-if="clubFlg && dataFlg">
	                <div class="section">
						<div class="recent_record__head">
							<div class="sub_title left">
								<h2>나의 최근 기록</h2>
							</div>
						</div>
	                    <div class="recent_record__inner">
							<div class="user_img img_area">
								<p v-if="sessionGender = 'F'">
				                	<img src="../images/profile_photo_woman.png" alt="여자 프로필 이미지">
				                </p>
				                <p v-else>
				                	<img src="../images/profile_photo_man.png" alt="남자 프로필 이미지">
				                </p>
							</div>
							<div class="user_profile clubInfoArea">
								<div class="user_profile_list">
									<ul>
										<li>{{info.name}} ({{info.nick}})</li>
										<li class="perInfo_li">포지션 : 
											<span v-if="info.position1 != null">{{info.position1}}</span>
											<span v-if="info.position2 != null">, {{info.position2}}</span>
											<span v-if="info.position3 != null">, {{info.position3}}</span>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="recent_record__inner">
							<div class="cImg_logo img_area" v-if="info.imgdata != null">
								<img :src="info.imgdata" / >
							</div>
							<div class="img_area" v-else>
								<div class="cImg_logo none">클럽 로고가 없습니다.</div>
							</div>
							<div class="user_profile">
								<div class="user_profile_list clubInfoArea">
									<ul>
										<li>클럽 이름 : <span> {{info.cName}}</span></li>
										<li>순위 : <span> {{info.ranking}} 위</span></li>
										<li>진행한 경기 : <span> {{info.cWin + info.cLose + info.cDraw}} 경기</span></li>
										<li>승 : <span> {{info.cWin}}</span></li>
										<li>패 : <span> {{info.cLose}}</span></li>
										<li>무 : <span> {{info.cDraw}}</span></li>
										<li>승률 : <span> {{info.rate}} %</span></li>
									</ul>
								</div>
							</div>
						</div>
	                </div>  
					<div class="section">
						<table class="wrap tbl">
							<thead>
								<tr>
									<th scope="col">참여 경기 수</th>
									<th scope="col">득점</th>
									<th scope="col">어시스트</th>
									<th scope="col">경고</th>
									<th scope="col">퇴장</th>
								</tr>
							</thead>
							<tbody class="userOnly">
								<tr>
									<td>{{info.mCnt}}</td>
									<td>{{info.mgoal}}</td>
									<td>{{info.massi}}</td>
									<td>{{info.myCard}}</td>
									<td>{{info.mrCard}}</td>	                
								</tr>
							</tbody>
						</table>
					</div>     
	            </div><!-- // recent_record__case -->
	            <!-- 용병유저일때(클럽소속없음) -->
	            <div id="tab1" class="recent_record__case" v-if="!clubFlg">
	                <div class="section">
	                    <div class="recent_record__inner">
							<div class="user_img img_area">
								
							</div>
							<div class="user_profile clubInfoArea">
								<div class="user_profile_list">
									<ul>
										<li>{{info.name}}</li>
										<li>({{info.nick}})</li>
										<li class="perInfo_li">포지션 : 
											<span v-if="info.position1 != null">{{info.position1}}</span>
											<span v-if="info.position2 != null">, {{info.position2}}</span>
											<span v-if="info.position3 != null">, {{info.position3}}</span>
										</li>
									</ul>
								</div>
							</div>
						</div>
	                </div>
					<div class="section">
						<table class="wrap tbl">
							<thead>
								<tr>
									<th scope="col">참여 경기 수</th>
									<th scope="col">득점</th>
									<th scope="col">어시스트</th>
									<th scope="col">경고</th>
									<th scope="col">퇴장</th>
								</tr>
							</thead>
							<tbody class="userOnly">
								<tr>
									<td>{{info.mCnt}}</td>
									<td>{{info.mgoal}}</td>
									<td>{{info.massi}}</td>
									<td>{{info.myCard}}</td>
									<td>{{info.mrCard}}</td>
								</tr>
							</tbody>
						</table> 
					</div>
	            </div><!-- // recent_record__case -->
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
			sessionStatus : "${sessionStatus}",
			sessionGender : "${sessionGender}"
			,info : {}
		   	,list : []
		   	,clubFlg : true
		   	,dataFlg : false
		},
		methods : {	
			fnGetInfo : function() {
				var self = this;
				var nparmap = {sessionId : self.sessionId};
				$.ajax({
					url : "/getRecord.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {	
						console.log(data);
						self.info = data.user;
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
