<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/subHeader.jsp"></jsp:include>
<link rel="stylesheet" href="css/style.css">
<title>티키타카 - 용병 모집 작성(03_01)</title>
<link rel="stylesheet" href="css/pearl.css">
<link rel="stylesheet" href="css/moon.css">

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>

</head>
<style>
</style>
<body>
	<div id="app">
		<div class="container">
			<div class="wrap">

				<div class="sub_title">
					<h2>용병 모집</h2>
				</div>
				<form action="">
					<div class="form_row form_flex">
						<div class="form_inner">
							<label for="writer" class="lbl">작성자</label> <input type="text"
								id="writer" class="int" v-model="sessionId" disabled="disabled">
						</div>
						<div class="form_inner">
							<label for="club" class="lbl">클럽명</label> <input type="text"
								id="club" class="int" v-model="info.cName">
						</div>
					</div>
					<!-- // form_row -->


					<div class="form_row textarea">
						<label for="title" class="lbl">게시글 제목</label> <input type="text"
							id="title" class="int" v-model="title">
					</div>

					<div class="form_row form_flex">
						<div class="form_inner">
							<label for="match" class="lbl">시합 정보</label> <select name=""
								id="match" class="selectBox" v-model="matchNum">
								<option value="">== 시합정보 ==</option>
								<option :value="item.mNo" v-for="(item, index) in list">{{item.Month}}월
									{{item.Day}}일 {{item.cNoA}} 경기</option>
							</select>
						</div>
						<div class="form_inner">
							<label for="pNum" class="lbl">필요 인원</label> <select name=""
								onchange="changFn()" id="pNums" class="selectBox" v-model="gNum">
								<option value="">== 필요인원==</option>
								<option value="1">1명</option>
								<option value="2">2명</option>
								<option value="3">3명</option>
							</select>
						</div>
					</div>
					<!-- // form_row -->
					<div class="form_row form_flex">
						<div class="form_inner">
							<label for="age" class="lbl solo">희망 연령대</label> <select name=""
								id="age" class="selectBox" v-model="age">
								<option value="">== 희망 연령 ==</option>
								<option value="10대">10대</option>
								<option value="20대">20대</option>
								<option value="30대">30대</option>
								<option value="40대">40대</option>
								<option value="50대">50대</option>
							</select>
						</div>
					</div>
					<!-- // form_row -->
					<!-- 필수 포지션 선택 -->
					<div class="form_row textarea">
						<label for="info" class="lbl">상세 내용</label>
						<textarea name="" id="info" v-model="cont"></textarea>
					</div>
					<div>
						<div class="form_row form_flex posi">
							<label for="setPosi" class="lbl"> 필수 포지션 <span>(최대
									3명)</span>
						</div>
					</div>
					<div class="posiChk">
						<div class="form_row col_7 posiF">
							<label for="" class="lbl">공격수</label>
							<div class="details_check">
								<input type="checkbox" onclick="chk(this)" name="posi"
									id="posiF1" value="ST"><label for="posiF1"><span></span>ST</label>
							</div>
							<div class="details_check">
								<input type="checkbox" onclick="chk(this)" name="posi"
									id="posiF2" value="CF"><label for="posiF2"><span></span>CF</label>
							</div>
							<div class="details_check">
								<input type="checkbox" onclick="chk(this)" name="posi"
									id="posiF3" value="LW"><label for="posiF3"><span></span>LW</label>
							</div>
							<div class="details_check">
								<input type="checkbox" onclick="chk(this)" name="posi"
									id="posiF4" value="RW"><label for="posiF4"><span></span>RW</label>
							</div>
						</div>
						<div class="form_row col_7 posiM">
							<label for="" class="lbl">미드필더</label>
							<div class="details_check">
								<input type="checkbox" onclick="chk(this)" name="posi"
									id="posiM1" value="CM"><label for="posiM1"><span></span>CM</label>
							</div>
							<div class="details_check">
								<input type="checkbox" onclick="chk(this)" name="posi"
									id="posiM2" value="CAM"><label for="posiM2"><span></span>CAM</label>
							</div>
							<div class="details_check">
								<input type="checkbox" onclick="chk(this)" name="posi"
									id="posiM3" value="CDM"><label for="posiM3"><span></span>CDM</label>
							</div>
							<div class="details_check">
								<input type="checkbox" onclick="chk(this)" name="posi"
									id="posiM4" value="LM"><label for="posiM4"><span></span>LM</label>
							</div>
							<div class="details_check">
								<input type="checkbox" onclick="chk(this)" name="posi"
									id="posiM5" value="RM"><label for="posiM5"><span></span>RM</label>
							</div>
						</div>
						<div class="form_row col_7 posiD">
							<label for="" class="lbl">수비수</label>
							<div class="details_check">
								<input type="checkbox" onclick="chk(this)" name="posi"
									id="posiD1" value="CB"><label for="posiD1"><span></span>CB</label>
							</div>
							<div class="details_check">
								<input type="checkbox" onclick="chk(this)" name="posi"
									id="posiD2" value="LB"><label for="posiD2"><span></span>LB</label>
							</div>
							<div class="details_check">
								<input type="checkbox" onclick="chk(this)" name="posi"
									id="posiD3" value="RB"><label for="posiD3"><span></span>RB</label>
							</div>
						</div>
						<div class="form_row col_7 posiG">
							<label for="" class="lbl">골키퍼</label>
							<div class="details_check">
								<input type="checkbox" onclick="chk(this)" name="posi"
									id="posiG1" value="GK"><label for="posiG1"><span></span>GK</label>
							</div>
						</div>
					</div>
					<!-- //필수 포지션 -->
				</form>
				</form>
				<!-- // form -->
				<!-- // form -->
				<div class="foot_btn">
					<button class="btn_form" @click="fnPutInfo">용병 모집하기</button>
				</div>
				<!-- // foot_btn -->

			</div>
			<!-- // wrap -->
		</div>
		<!-- // container -->
	</div>
</body>
</html>


<script type="text/javascript">
	// 인원별 포지션 체크
	var value;
        var chkNum = 0;
        function changFn() {
            var pNums = document.getElementById('pNums');
            value = (pNums.options[pNums.selectedIndex].value);
            if (chkNum > value){
                alert("필수 포지션을 다시 선택해주세요.");
                $(":checkbox").prop("checked",false);
                chkNum = 0;
            }
        }
        function chk(item) {
            if(value == null || value == '') {
                alert("필수 인원을 체크해주세요.");
                $(":checkbox").prop("checked",false);
                chkNum = 0;
            }
            else {
                if(item.checked) {
                    chkNum += 1;
                }
                else {
                    chkNum -= 1;
                }
                if (chkNum > value){
                    alert(value+"개까지만 선택 가능합니다.");
                    item.checked = false;
                    chkNum -= 1;
                }
            }
        }
        // 포지션 체크 끝
        </script>

<script type="text/javascript">     
	var app = new Vue({
		el : '#app',
		data : {	
			sessionId : "${sessionId}",
			sessionNickName : "${sessionNickName}",
			sessionStatus : "${sessionStatus}",
			matchNum : '',
			title : '',
			cont : '',
			age : '',
			gNum : '',
			cnt : '',
			info : {},
			list : []

		},
		methods : {
			fnGetInfo : function(){
                var self = this;
                if(self.sessionId == ""){
					alert("회원가입 후 이용해주세요.");
					location.href="/main.do";
				}
				else {
	                var nparmap = {uId : self.sessionId};
	                $.ajax({
	                    url:"/Guest/BoardInfo.dox",
	                    dataType:"json",	
	                    type : "POST", 
	                    data : nparmap,
	                    success : function(data) {  
	                    	if(data.info.cName != ""){	                    			                 
		                    	self.info = data.info;
		                    	self.list = data.list;
		                    	for(var i=0; i<self.list.length; i++) {
		                    		var nDate = new Date(self.list[i].mDate);
		                    		self.list[i].Day = nDate.getDate();
		                    		self.list[i].Month = nDate.getMonth();
		                    	}
		                    }
	                    	else {
	                    		alert("클럽 가입 후 이용해주세요.");
	                    	}
	                    }
	                }); 
				}
            },
    		fnPutInfo : function() {
    			var self = this;
    			var chkCnt = document.getElementsByName("posi").length; // name=posi인 checkbox 개수를 변수에 저장
    			var arr =['', '', '']; // 선호 포지션을 담아둘 배열 생성
    			var arrCnt=0; // 카운트 세기 용도
    			
    			for (var i=0; i<chkCnt; i++) { // 전체 체크박스 갯수만큼 반복문 시작
    	            if (document.getElementsByName("posi")[i].checked == true) { // 체크박스에 체크가 되어 있을 경우 아래 구문 작동
    	                arr[arrCnt] = document.getElementsByName("posi")[i].value; // 체크박스의 value를 arr 배열에 저장
    	                arrCnt++; // 다음 value 저장을 위해 카운트 숫자 +1
    	            }
    	        }
    			var nparmap = {
                		uPosi1 : arr[0],
                		uPosi2 : arr[1],
                		uPosi3 : arr[2],
                		mNo : self.matchNum,
                		title : self.title,
                		cont : self.cont,
                		gNum : self.gNum,
                		age : self.age,
                		uId : self.uId,
                		cnt : arr.length
                };
    			console.log(nparmap);
                $.ajax({
                    url:"/Guest/add.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {  
                    	alert("저장되었습니다.");
                    	location.href="sub03_02.do";
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