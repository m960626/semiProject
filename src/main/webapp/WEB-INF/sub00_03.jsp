<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/header.jsp"></jsp:include>
    <title>티키타카 - 회원가입(00_03)</title>
    <link rel="stylesheet" type="text/css" href="css/pearl.css">
    <link rel="stylesheet" type="text/css" href="css/sen.css">
    <link rel="stylesheet" type="text/css" href="css/moon.css">
</head>
<body>
	<div class="container">
        <!-- wrap -->
        <div class="wrap" id="app">
            <div class="login_form">
                <div class="sub_title">
                    <h2 v-if="sessionId == ''">회원가입</h2>
                    <h2 v-else>회원정보 수정</h2>
                </div>
                <form action="">
                	
                    <div v-if="sessionId == ''" class="form_row">
                        <label for="id" class="lbl need">아이디</label>
                        <input type="text" id="id" class="int"  v-model="info.joinId" >
                        <div class="int_cert">
                            <button type="button" onclick="chk1()" @click="fnSameChk" class="btn_form" id="idChk">아이디 중복 확인</button>
                        </div>
                    </div>
                    <div v-else class="form_row">
                        <label for="id" class="lbl need">아이디</label>
                        <input disabled v-model="sessionId" type="text" class="int"  id="id">
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
                            <button type="button" onclick="chk2()" @click="fnSameChk" class="btn_form" id="btn_certification">닉네임 중복 확인</button>
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
                            <button type="button" class="btn_form" id="btn_certification">우편번호 찾기</button>
                        </div>
                    </div>
                    <div class="form_row">
                        <label for="email" class="lbl need">이메일</label>
                        <input type="text" id="email" class="int" v-model="info.email">
                        <div class="int_cert">
                            <button type="button" @click="fnSameChk" class="btn_form" id="btn_certification">이메일 중복 확인</button>
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

                    <div v-if="sessionId == ''" class="form_row form_flex">
                        <label for="birth" class="lbl need">생년월일</label>
                        <input type="text" id="birth" class="int" v-model="info.birth" placeholder="법정 생년월일 8자리를 입력해주세요.  ex) 20230101">                        
                    </div>
                    <div v-else class="form_row form_flex">
                        <label for="birth" class="lbl need">생년월일</label>
                        <input disabled type="text" id="birth" class="int" v-model="info.birth">                        
                    </div>                    
                    <div class="form_row join">                            
                            <button v-if="sessionId == ''" type="submit" onclick="lastChk()" @click="fnJoin" class="btn_form" id="join">가입하기</button>
                            <button v-else type="submit" onclick="lastChk2()" @click="fnUserUpdate" class="btn_form" id="join">정보수정</button>                                
                        </div>
                    </div>
                    
                </form>
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
        var idChk = false;
        var nickChk = false;
        var phoneCert = false;
        function chk1() {
                idChk = true;
        }
        function chk2() {
                nickChk = true;
        }
        function chk3() {
                phoneCert = true;
        }
        // 가입하기 버튼 누를 때 경고창
        function lastChk() {
        	
            if(idChk == false) {
                alert("아이디 중복체크 버튼을 눌러주세요");
                return;
            }
            if(cntChk == 0) {
                alert("하나 이상의 포지션을 선택해주세요.");
                return;
            }
            if(nickChk == false){
                alert("닉네임 중복체크 버튼을 눌러주세요");
                return;
            }
            if(eChk == false){
            	alert("이메일 중복체크 버튼을 눌러주세요");
                return;
            }
            /*if(phoneCert == false){
                alert("핸드폰 번호 인증 버튼을 눌러주세요");
                return;
            }*/
            if(pw1 != pw2){
                alert("비밀번호를 다시 확인해주세요");
                return;
            }            
        }
        
        // 수정하기 버튼 누를 때 경고창
        function lastChk2() {
        	
        }
    </script>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
	el : '#app',
	data : {
		sessionId : "test125",
		sessionNickName : "${sessionNickName}",
		sessionStatus : "${sessionStatus}",
		info : {
			joinId : "", 
			pw : "", 
			name : "", 
			nick : "", 
			birth : "", 
			posi1: '',
			posi2: '',
			posi3: '',
			gender : "", 
			addr : "", 
			phone : "", 
			email : "", 
			status : "1"
		},//5,6,7번째 값 골라 비교
		pw1 : "",
		pw2 : "",
		list : [],
		chkFlg : false
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
			if(self.pw1 == self.pw2){
				self.info.pw1=self.pw1;
				}
				self.info.posi1 = arr[0];
				self.info.posi2 = arr[1];
				self.info.posi3 = arr[2];
				var nparmap = self.info;
				console.log(nparmap);
			 $.ajax({
	                url:"/user/join.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
	                	self.info=data.info;
	                	chkFlg;
	                	console.log(data);
	                }
	            }); 
			},
			
			fnSameChk : function(){      //중복체크 - 아이디, 닉네임, 메일주소
	    		var self = this;
				
		    	if(self.sessionId != undefined){ //세션아이디 존재할때(정보수정폼) - 닉네임, 메일주소 체크(수정했을 시에만)
		    		
		    		chkFlg; //기본값 false - 중복체크 안해도됨
		    		
		    		if(!self.info.nick==data.info.nick){ //폼에 적은 닉네임이 세션데이터값과 다를 때
		    			chkFlg = true; //중복체크 필요
		    			alert("닉네임 중복체크 버튼을 눌러주세요.")
		    			return;
		    		}
		    		if(!self.info.email==data.info.email){ //폼에 적은 메일주소가 세션데이터값과 다를 때
		    			chkFlg = true; //중복체크 필요
		    			alert("이메일 중복체크 버튼을 눌러주세요.")
		    			return;
		    		}
		    		
		    		var nparmap = {nick : self.info.nick, email : self.info.email};
		    	}
		    	
		    	else {//세션아이디 없을 때(회원가입폼) - 아이디, 닉네임, 메일주소 체크
		    		var nparmap = {id : self.info.joinId, nick : self.info.nick, email : self.info.email};
		    	
		    	}
		    	console.log(nparmap);
	            $.ajax({
	                url:"/user/check.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
	                	if(data.info.id != undefined){ //세션아이디값 있을 때
	                		if(data.cnt>0){
		                		alert("동일한 아이디가 존재합니다. 다른 아이디를 사용해주세요.");
		                		return;
		                	} else {
		                		alert("사용 가능한 아이디입니다.");
		                		return;
	                		}
	                	} 

	                	if(data.info.nick == self.info.nick){
	                		alert("동일한 닉네임이 존재합니다. 다른 닉네임을 사용해주세요.");
	                		return;
	                	} else {
	                		alert("사용 가능한 닉네임입니다.");
	                		return;
	                	}

	                	if(data.info.email == self.info.email){
	                		alert("동일한 메일 주소가 존재합니다. 다른 메일 주소를 사용해주세요.");                		
	                		return;
	                	} else {
	                		alert("사용 가능한 메일주소입니다.");
	                		return;
	                	}

	                }
	            });

	    	},
	    	fnUserInfoPg : function(){
		    	var self = this;
		    	var nparmap = {id : self.sessionId};//xml에 데이터를 넘길때 id에 sessionId를 담아 넘긴다
	            $.ajax({
	                url:"/user/info.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
	                	console.log(data);
	                	self.info = data.info;
                		for(var i=0; i< document.getElementsByName("posi").length; i++){ //
                			if(data.info.position1 != undefined){
                				if(document.getElementsByName("posi")[i].value == data.info.position1){
                					document.getElementsByName("posi")[i].checked = true;
                				}
                			}
                			if(data.info.position2 != undefined){
                				if(document.getElementsByName("posi")[i].value == data.info.position2){
                					document.getElementsByName("posi")[i].checked = true;
                				}
                			}                		
                			if(data.info.position3 != undefined){
                				if(document.getElementsByName("posi")[i].value == data.info.position3){
                					document.getElementsByName("posi")[i].checked = true;
                				}
                			}                		
                		}
	                }
	            }); 
		    },
		    fnUserUpdate : function(){
		    	var self = this;
		    	if(self.pwd1 != self.pwd2){
	    			alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
	    			return;
	    		} else{
	    			self.info.pw = self.pw1
	    		}
		    	var nparmap = self.info;
		           $.ajax({
		                url:"/user/edit.dox",
		                dataType:"json",	
		                type : "POST", 
		                data : nparmap,
		                success : function(data) { 
		                	self.info = data.info;
		                	alert("수정되었습니다.");
		                	location.href="/login.do" //로그인 화면이랑 연결
		                }
		        }); 
	    	}

	},
	created : function() {
		var self = this;
		self.fnUserInfoPg();
	}
});
</script>