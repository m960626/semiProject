<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/subHeader.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="css/pearl.css">
<link rel="stylesheet" href="css/hong.css">
<title>티키타카 - 클럽 상세 조회</title>

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/clubView.js"></script>
</head>

<body>
	
	<div id="app">
		<!-- container -->
		<div class="container clubView">

			<div class="topView">
				<div class="wrap clubS">
					<!-- 클럽 간략 정보 및 가입신청 버튼 -->
					<form class="titleBg">
						<div style="float: right;">
							<a href="javascript:;" class="btn3" @click="fnClubJoinBtn" v-if="sessionInfo.cNo == 0 || sessionInfo.cNo == null || sessionInfo.cNo == ''">클럽 가입 신청</a>
							<h1>{{userCnt}}/{{info.cMax}}</h1>
						</div>
						<div>
							<img src="/image/teamLogo1.png" class="tlogo">
						</div>
						<h2>{{info.cName}}</h2>
						<div class="cInfo">{{info.match}}경기 {{info.cWin}}승 {{info.cLose}}패 {{info.cDraw}}무 <span v-if="info.wRate > 0">(승률 {{info.wRate}}%)</span></div>
						<div class="cInfo">클럽 장 : {{info.nick}}</div>
						<div class="cInfo">클럽 생성일 : {{info.cDate}}</div>
					</form>
				</div>
			</div>

			<div class="wrap">
				<!-- 클럽 메뉴텝 버튼 -->
				<div class="clubRead">
					<div class="tab_menu">
						<ul class="list">
							<li class="is_on"><a href="#tab1" class="btn4">클럽 정보</a></li>
							<li><a href="#tab2" class="btn4">최근 경기 일정</a></li>
							<li><a href="#tab3" class="btn4">타임 라인</a></li>
							<li><a href="#tab4" class="btn4">가입 신청 내역</a></li>
							<li><a href="#tab5" class="btn4">팀 공지사항</a></li>
						</ul>

						<!-- 클럽 기본정보 및 클럽 선수명단 -->
						<div class="cont_area">
							<div id="tab1" class="cont" style="display: block;">
								<div class="section">
									<span class="subject">클럽·정보</span>
									<h3>클럽 기본 정보</h3>
									<ul class="clubInfoArea">
										<li>클럽 명 : {{info.cName}}</li>
										<li>클럽 전적 : {{info.match}}경기 {{info.cWin}}승 {{info.cLose}}패 {{info.cDraw}}무 <span v-if="info.wRate > 0">(승률 {{info.wRate}}%)</span></li>
										<li>활동 지역 : {{info.locName}}</li>
										<li>연령대 : {{info.cAge1}}대 ~ {{info.cAge2}}대</li>
										<!-- <li>남녀 성비 : 남녀 혼성</li>  -->
										<li>선호 요일 : 
											<span v-if="info.cDay1 != null && info.cDay1 != ''">{{info.cDay1}}</span>
											<span v-if="info.cDay2 != null && info.cDay2 != ''">, {{info.cDay2}}</span>
											<span v-if="info.cDay3 != null && info.cDay3 != ''">, {{info.cDay3}}</span>
										</li>
									</ul>
								</div>
								<div class="section">
									<span class="subject">클럽·명단</span>
									<h3>클럽 선수 명단</h3>
									<table class="wrap tbl">
										<thead>
											<tr>
												<th scope="col">No</th>
												<th scope="col">선수 명</th>
												<th scope="col">포지션</th>
												<th scope="col">나이</th>
												<th scope="col">득점</th>
												<th scope="col">도움</th>
												<th scope="col">활동 경기</th>
												<th scope="col">퇴장</th>
											</tr>
										</thead>
										<tbody class="userOnly" v-if="sessionInfo.cNo == cNo">
											<tr v-for="(item, index) in list" @click="fnUserInfo(item)">
												<td v-if="item.status == '3'">클럽장</td>
												<td v-else-if="item.status == '2'">매니저</td>
												<td v-else>{{index+1}}</td>
												<td>{{item.name}}</td>
												<td>
													<span>{{item.position1}}</span>
													<span v-if="item.position2 != null && item.position2 != ''">, {{item.position2}}</span>
													<span v-if="item.position3 != null && item.position3 != ''">, {{item.position3}}</span>
												</td>
												<td>{{item.userAge}}</td>
												<td>{{item.goal}}</td>
												<td>{{item.assi}}</td>
												<td>0</td>
												<td>{{item.rCard}}</td>
											</tr>
										</tbody>
										<tbody v-else>
											<tr v-for="(item, index) in list">
												<td v-if="item.status == '3'">클럽장</td>
												<td v-else-if="item.status == '2'">매니저</td>
												<td v-else>{{index+1}}</td>
												<td>{{item.name}}</td>
												<td>
													<span>{{item.position1}}</span>
													<span v-if="item.position2 != null && item.position2 != ''">, {{item.position2}}</span>
													<span v-if="item.position3 != null && item.position3 != ''">, {{item.position3}}</span>
												</td>
												<td>{{item.userAge}}</td>
												<td>{{item.goal}}</td>
												<td>{{item.assi}}</td>
												<td>0</td>
												<td>{{item.rCard}}</td>
											</tr>
										</tbody>
									</table>
								</div>
								
								
								
								
								
								
							</div>

							<!-- 최근 경기일정 -->
							<div id="tab2" class="cont">
								<table class="wrap clubInfo2">
									<colgroup>
				                        <col width="120px">
                          				<col width="*">
				                        <col width="150px">
				                    </colgroup>
									<tbody>
										<tr v-if="matchList.length == 0">
											<td class="nonList" colspan="3">최근 경기 기록이 없습니다.</td>
										</tr>
										<tr v-for="(item, index) in matchList">
											<td>
												<div class="date">
													<p>{{item.month}}월 {{item.day}}일</p>
													<p>{{item.time}}</p>
												</div>
											</td>
											<td>
												<div class="titleBox">
													<div class="matchLoc">
														<span>{{item.matchLoc}}</span>
													</div>
													<div class="matchTitle">
														<span v-bind:class="{'home' : item.cNoH == info.cName}">{{item.cNoH}}</span> 
														vs 
														<span v-bind:class="{'home' : item.cNoA == info.cName}">{{item.cNoA}}</span> 
													</div>
													<div class="matchGender">{{item.fName}}</div>
												</div>
											</td>
											<td>
												<div class="score" v-if="item.mStat == '4'" v-bind:class="{'win' : item.mResult == '승', 'draw' : item.mResult == '무', 'lose' : item.mResult == '패'}">
													<span class="scoreNum">{{item.scoreH}}:{{item.scoreA}}</span> 
													<span class="result" v-if="item.mResult == '승'">승</span>
													<span class="result" v-if="item.mResult == '패'">패</span>
													<span class="result" v-if="item.mResult == '무'">무</span>
												</div>
												<div class="score" v-else>
													<span class="scoreNum not">경기 진행 예정</span>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

							<!-- 타임 라인 -->
							<div id="tab3" class="cont">
								<ul class="timeLine">
									<li class="nonList" v-if="timeList.length == 0">작성된 타임라인이 없습니다.</li>
									<li v-for="(item, index) in timeList" v-bind:class="{'join' : item.tKind == '1', 'dele' : item.tKind == '2', 'match' : item.tKind == '3'}">
										<div class="date">
											<p>{{item.month}}월 {{item.day}}일</p>
											<p>{{item.hour}}:{{item.minutes}}</p>
										</div>
										<div class="textArea" v-if="item.tKind == '1'">
											<span>가입</span>
											<p><span class="point">{{item.name}}</span>님이 {{info.cName}}에 가입하셨습니다.</p>
										</div>
										<div class="textArea" v-else-if="item.tKind == '2'">
											<span>탈퇴</span>
											<p><span class="point">{{item.name}}</span>님이 {{info.cName}}를 탈퇴하셨습니다.</p>
										</div>
										<div class="textArea" v-else>
											<span>매칭</span>
											<p>
												{{item.year}}년 {{item.matchM}}월 {{item.matchD}}일 {{item.matchT}}에 
												<span class="point">
												<b v-if="item.cNoA == info.cName">{{item.cNoH}}</b>
												<b v-else>{{item.cNoA}}</b>와 {{item.fName}}</span>에서 시합이 잡혔습니다.
											</p>
										</div>
									</li>
								</ul>
							</div>

							<!-- 가입 신청 내역 -->
							<div id="tab4" class="cont">
								<table class="wrap player">
									<colgroup>
                          				<col width="8%">
				                        <col width="18%">
				                        <col width="18%">
				                        <col width="18%">
				                        <col width="18%">
                          				<col width="*">
				                    </colgroup>
									<thead>
										<tr>
											<th>No.</th>
											<th>선수명</th>
											<th>선호 포지션</th>
											<th>연락처</th>
											<th>나이</th>
											<th>승인 여부</th>
										</tr>
									</thead>
									<tbody v-if="sessionInfo.cNo == cNo && sessionStatus == 3">
										<tr v-if="joinList.length == 0">
											<td colspan="6">클럽 가입자가 없습니다.</td>
										</tr>
										<tr v-for="(item, index) in joinList">
											<td>{{index+1}}</td>
											<td>{{item.name}}</td>
											<td>
												<span>{{item.position1}}</span>
												<span v-if="item.position2 != null && item.position2 != ''">, {{item.position2}}</span>
												<span v-if="item.position3 != null && item.position3 != ''">, {{item.position3}}</span>
											</td>
											<td>{{item.phone}}</td>
											<td>{{item.userAge}}</td>
											<td class="joinBtn">
												<a href="javascript:;" class="true" @click="fnJoinTrue(item)" v-if="item.jStat == '1'">승인</a>
												<a href="javascript:;" class="false" @click="fnJoinFalse(item)" v-if="item.jStat == '1'">거부</a>
												
												<a class="trueEnd" v-if="item.jStat == '2'">승인 완료</a>
												<a class="falseEnd" v-if="item.jStat == '3'">승인 거부</a>
											</td>
										</tr>
									</tbody>
									<tbody v-else>
										<tr>
											<td colspan="6">클럽 관리자만 확인하실 수 있습니다.</td>
										</tr>
									</tbody>
								</table>
							</div>

							<!-- 팀 공지사항 -->
							<div id="tab5" class="cont">
								<table class="wrap notice">
									<colgroup>
				                        <col width="10%">
                          				<col width="*">
				                        <col width="10%">
				                    </colgroup>
									<thead>
										<tr>
											<th>작성일자</th>
											<th>공지사항</th>
											<th>작성자</th>
										</tr>
									</thead>

									<tbody v-if="sessionInfo.cNo == cNo">
										<tr v-if="noticeList.length == 0">
											<td colspan="3">
												작성된 공지사항이 없습니다.
											</td>
										</tr>
										<tr v-for="(item, index) in noticeList">
											<td class="date">
												<p>{{item.date}}</p>
												<p>{{item.time}}</p>
											</td>
											<td class="nCont">{{item.nCont}}</td>
											<td v-if="item.status == '3'">클럽장</td>
											<td v-else-if="item.status == '2'">매니저</td>
										</tr>
									</tbody>
									<tbody v-else>
										<tr>
											<td colspan="3">
												클럽 회원들만 확인 가능합니다.
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
		<!-- //container -->
		
		
	<!-- 회원정보 보기 -->
	
	<div class="user-read">
       <div class="dim-layer">
         <div class="read_dim">
         </div>
       </div>
       <div class="read-inner">
  			<span class="subject">회원정보 조회/수정</span>
  			<ul class="clubInfoArea">
  				<li>선수 명 : {{userInfo.name}}</li> 
  				<li>성별 : 
  					<span v-if="userInfo.gender =='M'">남자</span>
  					<span v-else>여자</span>
  				</li>
  				<li>나이 : {{userInfo.userAge}}</li> 
  				<li>휴대폰 번호 : {{userInfo.phone}}</li> 
  				<li>주소 : {{userInfo.addr}}</li> 
  				<li>클럽 등급 : 
  					<span v-if="userInfo.status == '1'">일반 회원</span>
  					<span v-else-if="userInfo.status == '2'">클럽 매니저</span>
  					<span v-else>클럽장</span>
  				</li>
  				<li>선호 포지션 : 
  					<span>{{userInfo.position1}}</span>
					<span v-if="userInfo.position2 != null && userInfo.position2 != ''">, {{userInfo.position2}}</span>
					<span v-if="userInfo.position3 != null && userInfo.position3 != ''">, {{userInfo.position3}}</span>
  				</li>
  				<li>선수 성적 : 00경기 {{userInfo.goal}}골 {{userInfo.assi}}도움 {{userInfo.yCard}}경고 {{userInfo.rCard}}도움
  				</li>
  			</ul>
  			<div class="btnArea" v-if="sessionStatus == 3">
  				<a href="javascript:;" class="clubUp" @click="fnClubOut(userInfo.id)">클럽 방출</a>
  				<!-- <a href="javascript:;" class="clubUp" @click="fnClubUp(userInfo.id)">매니저 등록</a> -->
  			</div>
  			<a href="javascript:;" class="dimClose">닫아줘~</a>
       </div>
     </div>
	<!-- 회원정보 보기 끝 -->
								
	</div>
	
	<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			sessionId : "${sessionId}",
			sessionNickName : "${sessionNickName}",
			sessionStatus : "${sessionStatus}",
			cNo : "${map.cNo}",
			info : {},
			list : [],
			joinList : [],
			matchList : [],
			timeList : [],
			noticeList : [],
			userCnt : '',
			title : "",
			userInfo : {},
			sessionInfo : {
				cNo : "",
				status : ""
			}
		},
		methods : {
			fnGetClub : function(){
				var self = this;
				var nparmap = {
					cNo : self.cNo
        		};
				$.ajax({
                    url:"/Club/clubView.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                    	self.info = data.info;
                    	self.info.cDate = data.info.cDate.slice(0, 10);
                    	var match = (data.info.cWin)+(data.info.cDraw)+(data.info.cLose);
                    	self.info.match = match;
                    	self.info.wRate =  Math.round(((data.info.cWin)/match)*10000) / 100.0;
            			self.fnClubMatch();
                    }
                }); 
			},
			fnGetUser : function(){
				var self = this;
				var nparmap = {
						cNo : self.cNo
				};
				$.ajax({
                    url:"/Club/clubUser.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {   
                    	self.list = data.list;
                    	self.userCnt = data.cnt;
                    	for(var i=0; i<self.list.length; i++) {
                    		var age = (new Date().getFullYear()) - (new Date(self.list[i].birth).getFullYear());
                    		var tMonth = new Date().getMonth()+1;
                    		var uMonth = new Date(self.list[i].birth).getMonth()+1;
							if(uMonth > tMonth || (uMonth === tMonth && (new Date(self.list[i].birth).getDate()) >= new Date().getDate())) {
								age--;
							}
							self.list[i].userAge = age;
                    	}
                    }
                });
			},
			fnJoinTrue : function(item){
				var self = this;
				var nparmap = {
						cNo : self.cNo,
						id : item.id,
						jNo : item.jNo
				};
				$.ajax({
                    url:"/Club/joinTure.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
                    	alert(item.id+'님의 클럽 신청을 수락하였습니다.');
                    	self.fnClubJoin();
                    	self.fnGetClub();
                    }
                });
				
			},
			// 승인 거절
			fnJoinFalse : function(item){
				var self = this;
				var nparmap = {
						cNo : self.cNo,
						jNo : item.jNo
				};
				$.ajax({
                    url:"/Club/joinFalse.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                    	alert(item.id+'님의 클럽 신청을 거절하였습니다.');
                    	self.fnClubJoin();
                    	
                    }
                });
				
			},
			// 클럽 신청 내역 출력
			fnClubJoin : function(){
				var self = this;
				var nparmap = {
						cNo : self.cNo
				};
				$.ajax({
                    url:"/Club/clubJoin.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                    	self.joinList = data.list;
                    	for(var i=0; i<self.joinList.length; i++) {
                    		var age = (new Date().getFullYear()) - (new Date(self.joinList[i].birth).getFullYear());
                    		var tMonth = new Date().getMonth()+1;
                    		var uMonth = new Date(self.joinList[i].birth).getMonth()+1;
							if(uMonth > tMonth || (uMonth === tMonth && (new Date(self.joinList[i].birth).getDate()) >= new Date().getDate())) {
								age--;
							}
							self.joinList[i].userAge = age;
                    	}
                    }
                });
			},
			// 최근 경기 기록
			fnClubMatch : function(){
				var self = this;
				var nparmap = {
						cName : self.info.cName
				};
				$.ajax({
                    url:"/Club/MatchList.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                    	self.matchList = data.list;
                    	for(var i=0; i<self.matchList.length; i++) {
                    		
                    		//경기 날짜 출력
                    		self.matchList[i].month = (new Date(self.matchList[i].mDate).getMonth())+1;
                    		self.matchList[i].day = new Date(self.matchList[i].mDate).getDate();
                    		self.matchList[i].time = self.matchList[i].mTimeS.slice(0, 5);
                    		
                    		//경기 결과 기록
                    		var scoreH = self.matchList[i].scoreH;
                    		var scoreA = self.matchList[i].scoreA;
                    		if(self.matchList[i].cNoH == self.info.cName){
                    			if(scoreH > scoreA) {
                    				self.matchList[i].mResult = '승';
                    			} 
                    			else if(scoreH == scoreA){
                    				self.matchList[i].mResult = '무';
                    			}
                    			else if(scoreH < scoreA){
                    				self.matchList[i].mResult = '패';
                    			}
                    		} 
                    		else {
                    			if(scoreH > scoreA) {
                    				self.matchList[i].mResult = '패';
                    			} 
                    			else if(scoreH == scoreA){
                    				self.matchList[i].mResult = '무';
                    			}
                    			else if(scoreH < scoreA) {
                    				self.matchList[i].mResult = '승';
                    			}
                    		}
                    		
                    		//경기 지역
                    		self.matchList[i].matchLoc = self.matchList[i].fLoc.slice(0, 2);
                    	}
                    }
                });
			},
			fnGetTimeLine : function(){
				var self = this;
				var nparmap = {
						cNo : self.cNo
				};
				$.ajax({
                    url:"/Club/TimeLine.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                    	self.timeList = data.list;
                    	for(var i=0; i<self.timeList.length; i++) {
                    		self.timeList[i].year = new Date(self.timeList[i].tDate).getFullYear();
                    		self.timeList[i].month = new Date(self.timeList[i].tDate).getMonth()+1;
                    		self.timeList[i].day = new Date(self.timeList[i].tDate).getDate();
                    		var hour = new Date(self.timeList[i].tDate).getHours();
                    		if(hour < 10) {
                    			self.timeList[i].hour = '0'+hour;
                    		} else {
                    			self.timeList[i].hour = hour;
                    		}
                    		var minutes = new Date(self.timeList[i].tDate).getMinutes();
                    		if(minutes < 10) {
                    			self.timeList[i].minutes = '0'+minutes;
                    		} else {
                    			self.timeList[i].minutes = minutes;
                    		}
                    		self.timeList[i].matchM = new Date(self.timeList[i].mDate).getMonth()+1;
                    		self.timeList[i].matchD = new Date(self.timeList[i].mDate).getDate();
                    		if(self.timeList[i].mTimeS != null) {
                    		self.timeList[i].matchT = self.timeList[i].mTimeS.slice(0, 5);
                    		}
                    	}
                    	
                    }
                });
			},
			fnUserInfo : function(item) {
				var self = this;
				var nparmap = {
						uId : item.id
				};
				$.ajax({
                    url:"/Club/getUserInfo.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                    	self.userInfo = data.info;
                    	var age = (new Date().getFullYear()) - (new Date(self.userInfo.birth).getFullYear());
                		var tMonth = new Date().getMonth()+1;
                		var uMonth = new Date(self.userInfo.birth).getMonth()+1;
						if(uMonth > tMonth || (uMonth === tMonth && (new Date(self.userInfo.birth).getDate()) >= new Date().getDate())) {
							age--;
						}
						self.userInfo.userAge = age;
                    }
                });
				
			},
			// 클럽 회원 추방
			fnClubOut : function(item){
				var self = this;
				var nparmap = {
						uId : item
				}
			},
			// 클럽 회원 등급 업
			fnClubUp : function(item){
				var self = this;
				var nparmap = {
						uId : item
				}
			},
			fnGetNotice : function() {
				var self = this;
				var nparmap = {
						cNo : self.cNo
				};
				$.ajax({
                    url:"/Club/getNotice.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
                    	self.noticeList = data.list;
                    	for(var i = 0; i<self.noticeList.length; i++) {
                    		self.noticeList[i].date = self.noticeList[i].nDate.substr(5, 5);
                    		self.noticeList[i].time = self.noticeList[i].nDate.substr(11, 5);
                    	}
                    }
                });
			},
			fnSessionUser : function() {
				var self = this;
				var nparmap = {
						uId : self.sessionId
				};
				$.ajax({
                    url:"/Club/SessionInfo.dox",
                    dataType:"json",
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
                    	self.sessionInfo = data.info;
                    	console.log(self.sessionInfo);
                    }
                });
				
			},
			fnClubJoinBtn : function() {
				var self = this;
				if(self.sessionId == ''){
					alert("로그인하셔용");
				}else {
					var nparmap = {
							uId : self.sessionId,
							cNo : self.cNo
					};
					$.ajax({
	                    url:"/Club/clubJoinUser.dox",
	                    dataType:"json",
	                    type : "POST", 
	                    data : nparmap,
	                    success : function(data) {
	                    	alert("클럽 신청을 완료하였습니다.");
	                    }
	                });
				}
			}
			
		},
		created : function() {
			var self = this;
			self.fnGetClub();
			self.fnGetUser();
			self.fnClubJoin();
			self.fnGetTimeLine();
			self.fnGetNotice();
			self.fnSessionUser();
		}
		
	});	
	</script>

	<script type="text/javascript">
		const tabList = document.querySelectorAll('.tab_menu .list li');
		const contents = document
				.querySelectorAll('.tab_menu .cont_area .cont')
		let activeCont = ''; // 현재 활성화 된 컨텐츠 (기본:#tab1 활성화)

		for (var i = 0; i < tabList.length; i++) {
			tabList[i]
					.querySelector('.btn4')
					.addEventListener(
							'click',
							function(e) {
								e.preventDefault();
								for (var j = 0; j < tabList.length; j++) {
									// 나머지 버튼 클래스 제거
									tabList[j].classList.remove('is_on');

									// 나머지 컨텐츠 display:none 처리
									contents[j].style.display = 'none';
								}

								// 버튼 관련 이벤트
								this.parentNode.classList.add('is_on');

								// 버튼 클릭시 컨텐츠 전환
								activeCont = this.getAttribute('href');
								document.querySelector(activeCont).style.display = 'block';
							});
		};
	</script>



</body>
</html>
