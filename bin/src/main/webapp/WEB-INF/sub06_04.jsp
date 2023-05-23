<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/header.jsp"></jsp:include>
<title>티키타카 - 마이페이지-팀정보보기(06_04)</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/pearl.css">
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
            <div class="none" v-if="!clubFlg && !joinFlg">
                <h1>아직 소속된 클럽이 없습니다.<br>
                    클럽에 가입하여 보다 활발한 축구활동을 즐겨보세요!</h1>
                    <div class="none_div">
                        <button onclick="" class="btn_form " id="">클럽찾기</button>
                    </div>
            </div>
            <div class="case2_clubWait" v-if="!clubFlg && joinFlg">
                <table class="club_wait">
                    <thead class="club_wait0">
                        <tr class="club_wait1">
                            <th scope="col">클럽 로고</th>
                            <th scope="col">클럽 명</th>
                            <th scope="col">인원 수</th>
                            <th scope="col">클럽 상태</th>
                            <th scope="col">활동 지역</th>
                            <th scope="col">연령대</th>
                            <th scope="col">승률</th>
                            <th scope="col">멤버 성별</th>
                            <th scope="col">클럽 생성일</th>
                            <th scope="col">처리 상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="club_wait2" v-for="item in list" v-if="item.DelYn =='N'">
                            <td>{{item.cIMG}}</td>
                            <td>{{item.cName}}</td>
                            <td>{{item.cnt}}</td>
                            <td>{{item.cStat}}</td>
                            <td>{{item.LOCNAME}}</td>
                            <td>{{item.cAge1}}대 ~ {{item.cAge2}}대</td>
                            <td v-if="item.cWin + item.cLose + item.cDraw != 0">{{Math.round(item.cWin/(item.cWin + item.cLose) * 100) }} %</td>
                            <td v-else>0 %</td>
                            <td>{{item.cGender}}</td>
                            <td>{{item.cDate}}</td>
                            <td class="tdStyle">
                                <div class="inTd" v-if="item.jStat == 1">승인대기</div>
                                <div class="inTd" v-else-if="item.jStat == 2">승인완료</div>
                                <div class="inTd3" v-else>승인거절</div>
                                <button class="club_waitBtn" v-if="item.jStat == 1" @click="fnCancel(item)">신청취소</button>
                            </td>
                            <!-- <td>{{item.cImg}}</td>
                            <td>{{item.cNo}}</td>
                            <td>{{item.cPcnt}}</td>
                            <td>{{item.cStat}}</td>
                            <td>{{item.cLoc}}</td>
                            <td>{{item.cAge1}}</td>
                            <td>{{item.cWin}}</td>
                            <td>{{item.cGender}}</td>
                            <td>{{item.cDate}}</td>
                            <td class="tdStyle">
                                <div class="inTd">승인대기</div>
                                <button class="club_waitBtn">신청취소</button>
                            </td> -->
                        </tr>
                    </tbody>
                </table>      
            </div>
            <div class="case3_clubMem" v-if="clubFlg">
                <div class="cImg_box">클럽 로고</div>
                <div class="clubInfo infobox">
                    <div class="matchInfo_title">{{info.cName}}</div>
                    <ul>
                        <li class="info_li">순위 : <span>{{info.cRank}} 위</span></li>
                        <li class="info_li">진행한 경기 : <span>{{info.cWin + info.cLose + info.cDraw}} 경기</span></li>
                        <li class="info_li">승 : <span>{{info.cWin}}</span></li>
                        <li class="info_li">패 : <span>{{info.cLose}}</span></li>
                        <li class="info_li">무 : <span>{{info.cDraw}}</span></li>
                        <li class="info_li">승률 : 
                        <span v-if="info.cWin + info.cLose + info.cDraw != 0">{{ Math.round(info.cWin/(info.cWin + info.cLose) * 100) }} %</span>
                        <span v-else>0 %</span>
                        </li>
                    </ul>
                </div>
                <div class="clubInfo btnBox">
                    <button onclick="" class="btn_form " id="">클럽 입장하기</button>
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
			sessionId : "${sessionId}",
			sessionNickName : "${sessionNickName}",
			sessionStatus : "${sessionStatus}"
		   ,info : {}
		   ,list : []
		   ,clubFlg : true
		   ,joinFlg : true
		},
		methods : {
			// 클럽 정보 확인
			fnGetClub : function() {
				var self = this;
				var nparmap = {sessionId : self.sessionId};
				$.ajax({
					url : "/getclub.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {	
						if(data.result == "fail"){
							self.clubFlg = false;
						}
						else{
							self.info = data.info
						}
					}
				});
			}
			, // 가입 신청 확인
			fnGetJoin : function() {
				var self = this;
				var nparmap = {sessionId : self.sessionId};
				$.ajax({
					url : "/getjoin.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {	
						if(data.result == "fail"){
							self.joinFlg = false;
						}
						else{
							self.list = data.list
							for(var i=0; i<self.list.length; i++){
								if(self.list[i].cStat == 1){
									self.list[i].cStat = '모집중'
								}
								else if(self.list[i].cStat == 2){
									self.list[i].cStat = '모집마감'
								}
								else {
									self.list[i].cStat = '포화'
								}
								if(self.list[i].cGender == 1){
									self.list[i].cGender = '남자'
								}
								else if(self.list[i].cGender == 2){
									self.list[i].cGender = '여자'
								}
								else {
									self.list[i].cGender = '혼성'
								}
								self.list[i].cDate = self.list[i].cDate.slice(0, 10);
							}
						}
					}
				});
			}
			,fnCancel : function(item) {
				if (!confirm("가입신청을 취소하시겠습니까?")) {			        
			    } 
				else {
					var self = this;
					var nparmap = {jNo : item.jNo};
					$.ajax({
						url : "/cancel.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {	
							alert("취소되었습니다.");
							self.fnGetClub();
							self.fnGetJoin();
							}
					});
			    }
			}
		},
		created : function() {
			var self = this;
			self.fnGetClub();
			self.fnGetJoin();
		}
	});
</script>
