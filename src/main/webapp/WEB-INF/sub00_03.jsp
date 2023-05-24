<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/subHeader.jsp"></jsp:include>
    <title>티키타카 - 회원가입(00_03)</title>
    <link rel="stylesheet" type="text/css" href="css/pearl.css">
    <link rel="stylesheet" type="text/css" href="css/sen.css">
    <link rel="stylesheet" type="text/css" href="css/moon.css">
</head>
<body>
	<div class="container color">
        <!-- wrap -->
        <div class="wrap" id="app">
            <div class="join_form">
                <div class="sub_title">
                    <h2>회원가입</h2>                    
                </div>
                <form name="join" method="post" action="join" autocomplete="off">
                    <div class="form_row">
                        <label for="id" class="lbl need">아이디</label>
                        <input type="text" id="joinId" name="id" class="int" v-model="info.joinId" >
                        <div class="int_cert">
                            <button type="button" id="idChk" @click="fnIdChk" class="btn_form">아이디 중복 확인</button>
                        </div>
                    </div>                    
                    <div class="form_row form_flex">
                        <label for="pw1" class="lbl need">비밀번호</label>
                        <input type="password" id="pw1" class="int" v-model="pw1" required>
                        <div class="form_block">
                            <!-- <p class="form_text3">영문 대소문자, 숫자, 특수문자 중 3개 이상을 조합하여 8자리 이상 입력해주세요.</p> -->
                        </div>
                    </div>
                    <div class="form_row">
                        <label for="pw2" class="lbl need">비밀번호 확인</label>
                        <input type="password" id="pw2" class="int"  v-model="pw2" required>
                    </div>
                    <div class="form_row">
                        <label for="name" class="lbl need">이름</label>
                        <input type="text" id="name" class="int" v-model="info.name">
                    </div>
                    <div class="form_row">
                        <label for="nick" class="lbl need">닉네임</label>
                        <input type="text" id="nick" class="int" v-model="info.nick">
                        <div class="int_cert">
                            <button type="button" @click="fnNickChk" class="btn_form" id="nickChk">닉네임 중복 확인</button>
                        </div>
                    </div>
                    <!-- 폰번호부분 숫자만 넣을 수 있게 정규식 넣을건지?-? -->
                    <div class="form_row">
                        <label for="phone" class="lbl need">휴대폰 번호</label>
                        <input type="" id="phone" class="int" v-model="info.phone" placeholder="ex) 010-1234-5678" required >
                    </div>                    
                    <div>
                        <div class="form_row form_flex posi">
                            <label for="setPosi" class="lbl need">
                                희망 포지션
                            </label>    
                            <span class="opt1">(최대 3개 선택)</span>                            
                        </div>
                        <div class="posiChk">
                            <div class="form_row col_7 posiF">
                                <label for="" class="lbl">공격수</label>
                                <div class="details_check">
                                    <input type="checkbox" onclick="chkPosi(this)" name="posi" 
                                    id="posiF1" value="ST"><label for="posiF1"><span></span>ST</label>
                                </div>
                                <div class="details_check">
                                    <input type="checkbox" onclick="chkPosi(this)" name="posi" 
                                    id="posiF2" value="CF"><label for="posiF2"><span></span>CF</label>
                                </div>
                                <div class="details_check">
                                    <input type="checkbox" onclick="chkPosi(this)" name="posi" 
                                    id="posiF3" value="LW"><label for="posiF3"><span></span>LW</label>
                                </div>
                                <div class="details_check">
                                    <input type="checkbox" onclick="chkPosi(this)" name="posi" 
                                    id="posiF4" value="RW"><label for="posiF4"><span></span>RW</label>
                                </div>
                            </div>
                            <div class="form_row col_7 posiM">
                                <label for="" class="lbl">미드필더</label>
                                <div class="details_check">
                                    <input type="checkbox" onclick="chkPosi(this)" name="posi" 
                                    id="posiM1" value="CM"><label for="posiM1"><span></span>CM</label>
                                </div>
                                <div class="details_check">
                                    <input type="checkbox" onclick="chkPosi(this)" name="posi" 
                                    id="posiM2" value="CAM"><label for="posiM2"><span></span>CAM</label>
                                </div>
                                <div class="details_check">
                                    <input type="checkbox" onclick="chkPosi(this)" name="posi" 
                                    id="posiM3" value="CDM"><label for="posiM3"><span></span>CDM</label>
                                </div>
                                <div class="details_check">
                                    <input type="checkbox" onclick="chkPosi(this)" name="posi" 
                                    id="posiM4" value="LM"><label for="posiM4"><span></span>LM</label>
                                </div>
                                <div class="details_check">
                                    <input type="checkbox" onclick="chkPosi(this)" name="posi" 
                                    id="posiM5" value="RM"><label for="posiM5"><span></span>RM</label>
                                </div>
                            </div>
                            <div class="form_row col_7 posiD">
                                <label for="" class="lbl">수비수</label>
                                <div class="details_check">
                                    <input type="checkbox" onclick="chkPosi(this)" name="posi" 
                                    id="posiD1" value="CB"><label for="posiD1"><span></span>CB</label>
                                </div>
                                <div class="details_check">
                                    <input type="checkbox" onclick="chkPosi(this)" name="posi" 
                                    id="posiD2" value="LB"><label for="posiD2"><span></span>LB</label>
                                </div>
                                <div class="details_check">
                                    <input type="checkbox" onclick="chkPosi(this)" name="posi" 
                                    id="posiD3" value="RB"><label for="posiD3"><span></span>RB</label>
                                </div>
                            </div>
                            <div class="form_row col_7 posiG">
                                <label for="" class="lbl">골키퍼</label>
                                <div class="details_check">
                                    <input type="checkbox" onclick="chkPosi(this)" name="posi" 
                                    id="posiG1" value="GK"><label for="posiG1"><span></span>GK</label>
                                </div>
                            </div>
                        </div>
                    </div><!-- // form -->
                    <div class="form_row">
                        <label for="address" class="lbl need">주소</label>
                        <input type="text" id="address" class="int" v-model="info.addr" >
                        <div class="int_cert">
                            <button type="button" @click="fnSearchAddr" class="btn_form" id="btn_certification">주소 찾기</button>
                        </div>
                    </div>
                    <div class="form_row">
                        <label for="email" class="lbl need">이메일</label>
                        <input type="text" id="email" class="int" v-model="info.email" name="email">
                        <div class="int_cert">
                            <button type="button" @click="fnEmailChk" class="btn_form" id="emailChk">이메일 중복 확인</button>
                        </div>
                    </div>
                    <div class="form_row">
                        <label for="gender" class="lbl need">성별</label>
                        <div class="	">
                            <input type="radio" name="gender" id="gender1" v-model="info.gender" value="M" required><label for="gender1"><span></span>남성</label>
                        </div>
                        <div class="">
                            <input type="radio" name="gender" id="gender2" v-model="info.gender" value="F"><label for="gender2"><span></span>여성</label>
                        </div>
                    </div>

                    <div class="form_row form_flex">
                        <label for="birth" class="lbl need">생년월일</label>
                        <input type="text" id="birth" class="int" v-model="info.birth" placeholder="법정 생년월일 8자리를 입력해주세요.  ex) 20230101">                        
                    </div>
                                   
                    <div class="form_row join">                            
                        <button type="submit" @click="fnJoin" class="btn_form" id="join">가입하기</button>                                
                    </div>
                   
                    
                </form>
                </div>
            </div>
        </div>
        <!-- // wrap -->
    </div>
    <script type="text/javascript">
    	//폰번호관련
	    /*var phoneNumber = "010-1111-222g";
	    if(!/01[01689]-[1-9]{1}[0-9]{2,3}-[0-9]{4}$/.test(phoneNumber)){
	        alert("연락처가 양식에 맞는지 확인해주세요.");
	    }	
    */
        var maxChk = 3;
        var cntChk = 0;
        function chkPosi(item) {
        	console.log(item.value);
        	
            if(item.checked) {
                cntChk += 1;
            } 
            else {
                cntChk -= 1;
            }
            if(cntChk > maxChk) {
                alert("최대 "+maxChk+"개까지만 선택 가능합니다.");
                item.checked = false;
                cntChk -= 1;
            }
        }
        
        
       
        
      
    </script>
</body>
</html>
<script type="text/javascript">
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	app.fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo);
} 

var app = new Vue({
	el : '#app',
	data : {		
		info : {
			joinId : "", 
			pw : "", 
			name : "", 
			nick : "", 
			birth : "", 
			posi1: '',
			posi2: '',
			posi3: '',
			gender : "M", 
			addr : "", 
			phone : "", 
			email : "", 
			status : "1"
		},//5,6,7번째 값 골라 비교
		pw1 : "",
		pw2 : "",
		list : [],
		idFlg : false,
		nickChk : false,
		emailChk : false
	},
	methods : {
		fnJoin : function() {
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
			/*var phoneNumber = "010-1111-222g";
		    if(!/01[01689]-[1-9]{1}[0-9]{2,3}-[0-9]{4}$/.test(phoneNumber)){
		        alert("연락처가 양식에 맞는지 확인해주세요.");
		    }	*/
				self.info.posi1 = arr[0];
				self.info.posi2 = arr[1];
				self.info.posi3 = arr[2];
			if(self.info.joinId == "" || self.info.joinId == undefined){
           		alert("아이디를 입력해 주세요.");
           		return;
			}
			if(self.info.nick == "" || self.info.nick == undefined){
        		alert("닉네임을 입력해주세요.");
        		return;
        	}
			if(self.info.email == "" || self.info.email == undefined){
        		alert("메일주소를 입력해주세요.");
        		return;
        	}
			if(self.info.addr == "" || self.info.addr == undefined){
				alert("주소를 입력해주세요.");
        		return;
        	}
			if(self.pw1 == self.pw2){
				self.info.pw1=self.pw1;
				}
			if(!self.idFlg){
				alert("아이디 중복체크를 해주세요.");
				return;
			}
			if(!self.nickChk){
				alert("닉네임 중복체크를 해주세요.");
				return;
			}
			if(!self.emailChk){
				alert("이메일 중복체크를 해주세요.");
				return;
			}
			
				var nparmap = self.info;
				console.log(nparmap);
			 $.ajax({
	                url:"/join.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
	                	self.info=data.info;
	                	
	                	console.log(data);
	                }
	            }); 
			},
			fnIdChk : function(){
		    	var self = this;
		    	var nparmap = {id : self.info.joinId};
		    	if(self.info.joinId == "" || self.info.joinId == undefined){
            		alert("아이디를 입력해 주세요.");
            		return;
            	}
	            $.ajax({
	                url:"/join/idCheck.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
                		if(data.cnt > 0){
	                		alert("아이디가 이미 존재합니다.");
	                	} else {
	                		alert("사용 가능한 아이디입니다.");
	                		self.idFlg = true;
	                	}
	                	
	                }
	            }); 
		    }
			, fnNickChk : function(){
		    	var self = this;
		    	var nparmap = {nick : self.info.nick};
		    	if(self.info.nick == "" || self.info.nick == undefined){
            		alert("닉네임을 입력해주세요.");
            		return;
            	}
	            $.ajax({
	                url:"/join/nickCheck.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
                		if(data.cnt > 0){
	                		alert("이미 사용중인 닉네임입니다.");
	                		self.info.nick = "";
	                		return;
	                	} else {
	                		alert("사용 가능한 닉네임입니다.");
	                		self.nickChk = true;
	                	}
	                	
	                }
	            }); 
		    }
			, fnSearchAddr : function(){
	    		var self = this;
	    		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
	    		window.open("addr.do", "test", option);
	    	},
	    	
	    	fnResult : function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	    		var self = this;
	    		self.info.addr = roadFullAddr;
	    		// 콘솔 통해 각 변수 값 찍어보고 필요한거 가져다 쓰면 됩니다.
	    		console.log(roadFullAddr);
	    		console.log(roadAddrPart1);
	    		console.log(addrDetail);
	    		console.log(engAddr);
	    	}
			, fnEmailChk : function(){
		    	var self = this;
		    	var nparmap = {email : self.info.email};
		    	if(self.info.email == "" || self.info.email == undefined){
            		alert("메일주소를 입력해주세요.");
            		return;
            	}
	            $.ajax({
	                url:"/join/emailCheck.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
                		if(data.cnt > 0){
	                		alert("이미 존재하는 메일주소입니다.");
	                	} else {
	                		alert("사용 가능한 메일주소입니다.");
	                		self.emailChk = true;
	                	}
	                	
	                }
	            }); 
		    }
			
	},
	created : function() {
		var self = this;
		
	}
});
</script>