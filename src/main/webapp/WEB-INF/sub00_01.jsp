<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/header.jsp"></jsp:include>
<title>티키타카 - 로그인</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<link rel="stylesheet" type="text/css" href="../css/moon.css">
<link rel="stylesheet" type="text/css" href="../css/pearl.css">
</head>
<style>
</style>
<body class="sub">
<div id="app">
<div class="subContainer-wrap">
<div class="subContainer">
<!-- 컨텐츠 영역 -->
	<div id="login-view">
	    <div class="login-inner">
	        <header id="login-header">
	            <h1 class="logo">티키타카 
	                <span>로그인</span></h1>
	        </header>
	        <main id="login-main" class="login">
	            <div class="main-inner">
	                <form class="login-warp" action="" method="post">
	                    <div class="login-area">
	                        <div class="login-form">
	                            <div class="login-input-box">
	                                <ul>
	                                    <li>
	                                        <label for="input_id"><i class="fas fa-user"></i><span class="srOnly">아이디</span></label>
	                                        <input type="text" v-model="info.id" name="input_id" id="input_id" value="" placeholder="아이디" class="loginText w100p" required>
	                                    </li>
	                                    <li>
	                                        <label for="input_pw"><i class="fas fa-lock"></i><span class="srOnly">비밀번호</span></label>
	                                        <input type="password" v-model="info.pwd" name="input_pw" id="input_pw" value="" placeholder="비밀번호" class="loginText w100p" required>
	                                    </li>
	                                </ul>
	                            </div>
	                            <div class="login-check-box">
	                                <span class="check check-type1">
	                                    <a href="javascript:;" onclick="join()">회원가입</a>
	                                </span>
	                                <div class="login-btn-box">
	                                    <a href="javascript:;" @click="fnId">아이디 찾기</a>
	                                    <a href="javascript:;" @click="fnPw">비밀번호 찾기</a>
	                                </div>
	                            </div>
	                            	<a href="javascript:;" type="submit" @click="fnLogin" class="btn_form type3">로그인</a>
	                        </div>
	                        <div class="login-info">
	                        <p>
	                            계정관련오류, 서비스 장애신고는 티키 관제센터 > 타카 관제팀<br />
	                            (담당:펄진주, 제갈세은)으로 문의하시기 바랍니다.
	                        </p>
	                        </div>
	                    </div>
	                </form>
	            </div>
	        </main>
	    </div>
	</div>
<!-- 컨텐츠 영역 끝 -->
</div>
</div><!-- // container -->
</div>
</body>
</html>
<script type="text/javascript">
	function join(){
		location.href = "/preJoin.do"
	}
</script>
<script type="text/javascript">
var app = new Vue({
	el : '#app',
	data : {
		info : {
			id : "${map.id}",
			pwd : "",
	    	user : {}
		}
	},
	methods : {
		fnLogin : function(){
    		var self = this;
    		var nparmap = {id : self.info.id, pwd : self.info.pwd};
    		if(self.info.id == ''){
    			alert("아이디를 입력해주세요.");
    			return;
    		}
    		if(self.info.pwd == ''){
    			alert("비밀번호를 입력해주세요.");
    			return;
    		}
    		console.log(nparmap);
    		$.ajax({
                url:"/login.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	alert(data.message);
                	if(data.result == "success"){
                		location.href="/main.do"
                	}
                }
            }); 
    	}, fnId : function(){
    		location.href = "findid.do";
    	}, fnPw : function(){
    		location.href = "findpw.do";
    	}
	},
	created : function() {
       	var self = this;
	}
		
});	
</script>