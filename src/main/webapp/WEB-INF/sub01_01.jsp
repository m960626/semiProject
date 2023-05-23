<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/subHeader.jsp"></jsp:include>
<title>티키타카 - 클럽생성(01_01)</title>
<link rel="stylesheet" type="text/css" href="../css/pearl.css">
<link rel="stylesheet" type="text/css" href="../css/sen.css">
<link rel="stylesheet" type="text/css" href="../css/moon.css">

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>
	<div id="app">
		<div class="container">
			<div class="wrap">
				<div class="sub_title">
					<h2>클럽생성</h2>
				</div>
				<form action="">
					<div class="form_row form_flex">
						<div class="form_inner filebox bs3-primary">
							<label for="clubLogo" class="lbl">클럽 로고</label> 
							<!-- <input class="upload-name int" value="파일선택" disabled="disabled">
              				<label for="file1" class="addBtn">업로드</label> 
              				<input type="file" id="file1" class="upload-hidden">  -->
              				<input type="file" id="file1" name="file1" multiple>
            			</div>
						<div class="form_inner">
							<label for="clubName" class="lbl">클럽명</label> <input type="text"
								id="clubName" class="int" v-model="info.cName" multiple>
						</div>
					</div>
					<div class="form_row form_flex">
						<div class="form_inner">
							<label for="ground" class="lbl">활동지역</label> <select name=""
								id="ground" class="selectBox" v-model="info.cLoc">
								<option value="">전체</option>
								<option value="1">서울</option>
								<option value="2">인천</option>
								<option value="3">강원</option>
								<option value="4">경북</option>
								<option value="5">충북</option>
								<option value="6">세종</option>
								<option value="7">대전</option>
								<option value="8">대구</option>
								<option value="9">전북</option>
								<option value="10">경남</option>
								<option value="11">충남</option>
								<option value="12">전남</option>
								<option value="13">광주</option>
								<option value="14">부산</option>
								<option value="15">제주</option>
							</select>
						</div>
						<div class="form_inner">
							<label for="age" class="lbl">연령대</label> <select name="" id="age"
								class="selectBox" v-model="info.age1">
								<option value="">전체</option>
								<option value="10">10대</option>
								<option value="20">20대</option>
								<option value="30">30대</option>
								<option value="40">40대</option>
								<option value="50">50대</option>
								<option value="60">60대</option>
							</select> <span class="between">~</span> <select name="" id="age"
								class="selectBox" v-model="info.age2">
								<option value="">전체</option>
								<option value="10">10대</option>
								<option value="20">20대</option>
								<option value="30">30대</option>
								<option value="40">40대</option>
								<option value="50">50대</option>
								<option value="60">60대</option>
							</select>
						</div>
					</div>
					<div class="form_row form_flex">
						<div class="form_inner">
							<label for="clubIng" class="lbl">클럽 상태</label> <select name=""
								id="clubIng" class="selectBox" v-model="info.cStatus">
								<option value="1">모집중</option>
							</select>
						</div>
						<div class="form_inner">
							<label for="clubCnt" class="lbl">최대 인원수</label> <input
								type="text" id="clubCnt" class="int" v-model="info.cMax"
								maxlength="3"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						</div>
					</div>
					<div class="form_row form_flex">
						<div class="form_inner">
							<label for="grade" class="lbl">실력</label> <select name=""
								id="grade" class="selectBox" v-model="info.cGrade">
								<option value="">전체</option>
								<option value="1">하</option>
								<option value="2">중</option>
								<option value="3">상</option>
								<option value="4">최상</option>
							</select>
						</div>
						<div class="form_inner">
							<label for="gender" class="lbl">멤버 성별</label> <select name=""
								id="gender" class="selectBox" v-model="info.cGender">
								<option value="">전체</option>
								<option value="1">남자</option>
								<option value="2">여자</option>
								<option value="3">혼성</option>
							</select>
						</div>
					</div>
					<div class="form_row col_7">
						<label for="day" class="lbl">선호 요일</label>
						<div class="details_check">
							<input type="checkbox" id="day_1" v-model="cDay" value="월"><label
								for="day_1"><span></span>월요일</label>
						</div>
						<div class="details_check">
							<input type="checkbox" id="day_2" v-model="cDay" value="화"><label
								for="day_2"><span></span>화요일</label>
						</div>
						<div class="details_check">
							<input type="checkbox" id="day_3" v-model="cDay" value="수"><label
								for="day_3"><span></span>수요일</label>
						</div>
						<div class="details_check">
							<input type="checkbox" id="day_4" v-model="cDay" value="목"><label
								for="day_4"><span></span>목요일</label>
						</div>
						<div class="details_check">
							<input type="checkbox" id="day_5" v-model="cDay" value="금"><label
								for="day_5"><span></span>금요일</label>
						</div>
						<div class="details_check">
							<input type="checkbox" id="day_6" v-model="cDay" value="토"><label
								for="day_6"><span></span>토요일</label>
						</div>
						<div class="details_check">
							<input type="checkbox" id="day_7" v-model="cDay" value="일"><label
								for="day_7"><span></span>일요일</label>
						</div>
					</div>
					<div class="form_row textarea">
						<label for="clubTxt" class="lbl">클럽 소개말</label>
						<textarea name="" id="clubTxt" maxlength="200"
							placeholder="200자 이내 작성" v-model="info.cont"></textarea>
					</div>
				</form>
				<div class="foot_btn">
					<button class="btn_form" id="btn_sumit" @click="fnAdd">클럽
						생성하기</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	//체크박스 개수
		$(document).ready(function() {
			$("input[type='checkbox']").on("click", function() {
				let count = $("input:checked[type='checkbox']").length;
	
				if (count > 3) {
					$(this).prop("checked", false);
					alert("3개까지만 선택할 수 있습니다.")
				}
			})
		});
	</script>
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
				cid : "${sessionId}",
				file : "",
				cName : "",
				cLoc : "",
				age1 : "",
				age2 : "",
				cStatus : "1",
				cMax : "",
				cGrade : "",
				cGender : "",
				cont : "",
				day1 : "",
				day2 : "",
				day3 : ""
			},
			cDay : [],
			cNo : ""
		},
		methods : {
			// 클럽 여부 확인
			fnCheck : function() {
				var self = this;
				if(self.sessionId == ""){
					alert("로그인 후 이용할 수 있습니다.");
					location.href="/login.do";
				}
				else {
					var nparmap = {id : self.sessionId};			
			        $.ajax({
			            url:"/checkClub.dox",
			            dataType:"json",	
			            type : "POST", 
			            data : nparmap,
			            success : function(data) { 
			          		if(data.result == "success"){
			          			alert("이미 가입된 클럽이 있습니다.");		
			          			location.href="/main.do";
			          		}
			            }
			        }); 
				}
			}
			// 클럽 생성
			, fnAdd : function() {
				var self = this;
				self.info.day1 = self.cDay[0];
				self.info.day2 = self.cDay[1];
				self.info.day3 = self.cDay[2];
				var nparmap = self.info;
				if (self.info.cName === "") {
					alert("클럽명을 입력해주세요.");
					return;
				}
				if (self.info.cLoc === "") {
					alert("활동지역을 선택해주세요.");
					return;
				}
				if (self.info.age1 === "") {
					alert("연령대를 선택해주세요.");
					return;
				}
				if (self.info.age2 === "") {
					alert("연령대를 선택해주세요.");
					return;
				}
				if (self.info.cMax === "") {
					alert("최대 인원수를 입력해주세요.");
					return;
				}
				if (self.info.cGrade === "") {
					alert("실력을 선택해주세요.");
					return;
				}
				if (self.info.cGender === "") {
					alert("멤버 성별을 선택해주세요.");
					return;
				}
				if (self.cDay.length == 0) {
					alert("선호 요일을 선택해주세요.");
					return;
				}
				if (self.info.cont === "") {
					alert("클럽 소개말을 입력해주세요.");
					return;
				}			
	             $.ajax({
	                 url:"/addClub.dox",
	                 dataType:"json",	
	                 type : "POST", 
	                 data : nparmap,
	                 success : function(data) { 
	                	var form = new FormData();
	                	console.log($("#file1")[0].files[0]);
	                	self.cNo = data.cNo;
	                	console.log("s나는"+self.cNo);
	 	       	        form.append("file1",  $("#file1")[0].files[0] );
	 	       	     	form.append("cNo",  data.cNo); // pk
	 	           		self.upload(form); 
	               		alert("클럽이 생성되었습니다.");
	               		self.fnsetMaster();
	                 }
	             }); 
			},
			// 파일 업로드
			upload : function(form) {
				var self = this;
		         $.ajax({
		             url : "/fileUpload.dox"
		           , type : "POST"
		           , processData : false
		           , contentType : false
		           , data : form
		           , success:function(response) { 
		        	   
		           }
		       });
			},
			fnsetMaster : function() {
				var self = this;
				var nparmap = {
						cNo : self.cNo,
						cid : self.sessionId
				}
				console.log(nparmap);
				$.ajax({
		            url:"/Club/setClubMaster.dox",
		            dataType:"json",	
		            type : "POST", 
		            data : nparmap,
		            success : function(data) { 
		            }
		        }); 
			}
		},
		created : function() {
			var self = this;
		}
	});
</script>

<script>
/* $(document).ready(function(){
	  var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            var filename = $(this)[0].files[0].name;
	        } else {
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        }

	        $(this).siblings('.upload-name').val(filename);
	    });
	});  */
</script>