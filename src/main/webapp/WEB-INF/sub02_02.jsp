<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/header.jsp"></jsp:include>
<link rel="stylesheet" href="css/style.css">
<title>티키타카 - 매칭 신청(02_02)</title>
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

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	document.cookie = "safeCookie1=foo; SameSite=Lax";
	document.cookie = "safeCookie2=foo";
	document.cookie = "crossCookie=bar; SameSite=None; Secure";
</script>
</head>
<style>
</style>
<body>
	<div id="app">
		<div class="container">
			<div class="wrap">
				<div class="sub_title">
					<h2>매칭 신청</h2>
				</div>
				<form action="">
					<div class="form_row form_flex">
						<div class="form_inner">
							<label for="club_name" class="lbl">클럽명</label> <input type="text"
								id="club_name" class="int" v-model="idInfo.cName" disabled="disabled">
						</div>
						<div class="form_inner">
							<label for="date" class="lbl">시합 날짜</label> <input type="date"
								id="date" class="int" placeholder="날짜를 선택해주세요" v-model="info.matchDate">
						</div>
					</div>
					<!-- // form_row -->
					<div class="form_row form_flex">
						<div class="form_inner">
							<label for="avg_age" class="lbl">평균 연령</label> 
							<input type="text" id="avg_age" class="int" v-model="info.avgAge" 
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						</div>
						<div class="form_inner">
							<label for="time" class="lbl">시합 시간</label> 
							 <input type="time" name="" id="" class="selectBox" v-model="info.matchTime1">
							 <span class="between">~</span> 
							 <input type="time" name="" id="" class="selectBox" v-model="info.matchTime2">
						</div>
					</div>
					<!-- // form_row -->
					<div class="form_row form_flex">
						<div class="form_inner">
							<label for="uni_color" class="lbl">유니폼 색상</label> <input
								type="text" id="uni_color" class="int" v-model="info.color">
						</div>
						<div class="form_inner">
							<label for="mem_gender" class="lbl">멤버 혼성</label> <select name=""
								id="" class="selectBox" v-model="info.gender">
								<option value="">전체</option>
								<option value="1">남자</option>
								<option value="2">여자</option>
								<option value="3">혼성</option>
							</select>
						</div>
					</div>
					<!-- // form_row -->
					<div class="form_row form_flex">
						<div class="form_inner">
							<label for="cost" class="lbl">대여 비용</label> 
							<input type="text"id="cost" class="int" v-model="info.fee"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						</div>
						<div class="form_inner">
							<label for="grade" class="lbl">상대팀 실력</label> <select name="" id=""
								class="selectBox" v-model="info.grade">
								<option value="">전체</option>
								<option value="1">하</option>
								<option value="2">중</option>
								<option value="3">상</option>
								<option value="4">최상</option>
							</select>
						</div>
					</div>
					<!-- // form_row -->

					<div class="form_mid_head">
						<h4>구장 정보</h4>
					</div>
					<!-- // form_mid_head -->
					<div class="form_row">
						<label for="ground" class="lbl">경기장</label>
						<input type="text" id="ground" class="int" placeholder="직접 입력" v-model="info.groundName" required>
					</div>
					<div class="form_row">
						<label for="ground" class="lbl">경기장 위치</label> <input type="text"
							id="groundLocation" class="int" v-model="info.groundLoc">
						<button type="button" class="btn_form" id="addressSearch"
							@click="findAddr">위치 찾기</button>
					</div>
					<div class="form_row form_flex">
						<div class="form_inner">
							<label for="parking" class="lbl">주차장</label> <select name=""
								id="" class="selectBox" v-model="info.parking">
								<option value="">전체</option>
								<option value="1">무료 주차</option>
								<option value="2">유료 주차</option>
								<option value="3">없음</option>
							</select>
						</div>
						<div class="form_inner">
							<label for="toliet" class="lbl">공 대여</label> <select name=""
								id="" class="selectBox" v-model="info.ball">
								<option value="">전체</option>
								<option value="Y">대여 가능</option>
								<option value="N">대여 불가능</option>
							</select>
						</div>
					</div>
					<!-- // form_row -->
					<div class="form_row form_flex">
						<div class="form_inner">
							<label for="smoking" class="lbl">흡연장</label> <select name=""
								id="" class="selectBox" v-model="info.smoking">
								<option value="">전체</option>
								<option value="Y">있음</option>
								<option value="N">없음</option>
							</select>
						</div>
						<div class="form_inner">
							<label for="smoking" class="lbl">조끼 대여</label> <select name=""
								id="" class="selectBox" v-model="info.vest">
								<option value="">전체</option>
								<option value="Y">대여 가능</option>
								<option value="N">대여 불가능</option>
							</select>
						</div>
					</div>

					<div class="form_row form_flex">
						<div class="form_inner">
							<label for="smoking" class="lbl">샤워장</label> <select name=""
								id="" class="selectBox" v-model="info.shower">
								<option value="">전체</option>
								<option value="Y">있음</option>
								<option value="N">없음</option>
							</select>
						</div>
						<div class="form_inner">
							<label for="smoking" class="lbl">매점</label> <select name="" id=""
								class="selectBox" v-model="info.market">
								<option value="">전체</option>
								<option value="Y">있음</option>
								<option value="N">없음</option>
							</select>
						</div>
					</div>
					<!-- // form_row -->
					<div class="form_row textarea">
						<label for="smoking" class="lbl">추가사항</label>
						<textarea name="" id="" v-model="info.intro" maxlength="200"></textarea>
					</div>
				</form>
				<!-- // form -->
				<div class="foot_btn">
					<button class="btn_form" @click="fnApply">매치 신청하기</button>
				</div>
				<!-- // foot_btn -->
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
			sessionStatus : "${sessionStatus}",
			info : {
				clubName : ""
			   ,matchDate : ""
			   ,avgAge : ""
			   ,matchTime1 : ""
			   ,matchTime2 : ""
			   ,color : ""
			   ,gender : ""
			   ,fee : ""
			   ,grade : ""
			   ,groundName : ""
			   ,groundLoc :  ""
			   ,parking : ""
			   ,ball : ""
			   ,smoking : ""
			   ,shower : ""
			   ,market : ""
			   ,vest : ""
			   ,intro : ""
			}
			, idInfo : {}
		},
		methods : {
			// 클럽 여부 확인
			fnCheck : function() {
				var self = this;
				if(self.sessionId == ""){
					alert("회원가입 후 이용해주세요.");
					location.href="/main.do";
				}
				else {
					var nparmap = {id : self.sessionId};			
			        $.ajax({
			            url:"/checkClub.dox",
			            dataType:"json",	
			            type : "POST", 
			            data : nparmap,
			            success : function(data) { 
			            	if(data.info.cNo != "") {
			        			self.idInfo = data.info;
			            	}
			            	else {
			            		alert("클럽 가입 후 이용해주세요.");
								location.href="/main.do";
			            	}
			            }
			        }); 
				}
			}
			// 구장 정보
			, fnAddField : function(){
	    		var self = this;
	    		var nparmap = self.info;
	             $.ajax({
	                 url:"/matching/addField.dox",
	                 dataType:"json",	
	                 type : "POST", 
	                 data : nparmap,
	                 success : function(data) { 
	                 }
	             }); 
			}
			// 경기 정보
			,fnAddMatch : function(){
	    		var self = this;
	    		var nparmap = self.info;
	             $.ajax({
	                 url:"/matching/addMatch.dox",
	                 dataType:"json",	
	                 type : "POST", 
	                 data : nparmap,
	                 success : function(data) { 
	                 }
	             }); 
			}
			, findAddr : function(){
			   var self = this;
		       new daum.Postcode({
		           oncomplete: function(data) {
		               // 사용자 주소를 받아올 변수를 정의한다.
		               var addr = '';
		               
		               //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우(R)
		                   addr = data.roadAddress;
		               } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                   addr = data.jibunAddress;
		               }               
		               // 부모창의 주소칸에 받아온 주소를 넣는다.
		               self.info.groundLoc = addr ;
		           }
		        }).open();
		   }
			// 구장 & 경기 정보 추가
		   , fnApply : function(){
	    		var self = this;
	    		console.log(self.info);
	    		if(self.info.clubName == ''){
	    			alert("클럽명을 입력해주세요.");
	    		} 
	    		else if(self.info.matchDate == '' ){
	    			alert("시합 날짜를 입력해주세요.");
	    		}
	    		else if(self.info.avgAge == ''){
	    			alert("평균 연령을 입력해주세요.");
	    		}
	    		else if(self.info.matchTime1 == ''){
	    			alert("시합 시작시간을 입력해주세요.");
	    		}
	    		else if(self.info.matchTime2 == ''){
	    			alert("시합 종료시간을 입력해주세요");
	    		}
	    		else if(self.info.color == ''){
	    			alert("유니폼 색상을 입력해주세요.");
	    		}
	    		else if(self.info.gender == ''){
	    			alert("멤버 혼성을 선택해주세요.");
	    		} 
	    		else if(self.info.fee == ''){
	    			alert("대여 비용을 입력해주세요.");
	    		} 
	    		else if(self.info.grade == ''){
	    			alert("실력을 선택해주세요.");
	    		} 
	    		else if(self.info.groundName == ''){
	    			alert("경기장 이름을 입력해주세요.");
	    		}
	    		else if(self.info.groundLoc == ''){
	    			alert("경기장 위치를 입력해주세요.");
	    		} 
	    		else if(self.info.parking == ''){
	    			alert("주차장 여부를 선택해주세요.");
	    		} 
	    		else if(self.info.ball == ''){
	    			alert("공 대여 여부를 선택해주세요.");
	    		}
	    		else if(self.info.smoking == ''){
	    			alert("흡연장 여부를 선택해주세요.");
	    		}
	    		else if(self.info.shower == ''){
	    			alert("샤워장 여부를 선택해주세요.");
	    		}
	    		else if(self.info.market == ''){
	    			alert("매점 여부를 선택해주세요.");
	    		} 
	    		else if(self.info.vest == ''){
	    			alert("조끼 대여 여부를 선택해주세요.");
	    		}			
	    		else if(self.info.intro == ''){
	    			alert("팀 소개를 작성해주세요.");
	    		}
	    		else {
					self.fnAddField();
					self.fnAddMatch();
					alert("매칭 신청되었습니다.");
					location.href="/sub02_03";
	    		}
			}
		},
		created : function() {
			var self = this;
			self.fnCheck();			
		}
		
});	
</script>