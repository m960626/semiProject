<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/subHeader.jsp"></jsp:include>
<title>티키타카 - 마이페이지</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<link rel="stylesheet" type="text/css" href="../css/pearl.css">
</head>
<body>
<div class="container">
<div class="wrap" id="app">
    <div class="mypage__body">
        <div class="sub_title">
            <h2>마이페이지</h2>
        </div>
        <div class="mypage_profile">
            <div class="profile_photo">
            	<p v-if="sessionGender == 'F'">
                	<img src="../images/profile_photo_woman.png" alt="여자 프로필 이미지">
                </p>
                <p v-else>
                	<img src="../images/profile_photo_man.png" alt="남자 프로필 이미지">
                </p>
                
            </div>
            <div class="profile_txt">
                <p>{{sessionNickName}}님 안녕하세요!</p>
                <a href="/user/info.do" class="profile_edit">회원정보수정<i class="ico_edit"></i></a>
            </div>
        </div><!-- // mypage_profile -->
        <div class="line_h"></div>
        <div class="mypage_menu">
            <ul>
                <li><a href="javascript:;" @click="fnView(sessionId)"><i class="ico_mypage01"></i>팀 정보가기</a></li>
                <li><a href="javascript:;" @click="fnReserve(sessionId)"><i class="ico_mypage02"></i>예약현황</a></li>
                <li><a href="javascript:;" @click="fnMyInfo(sessionId)"><i class="ico_mypage04"></i>최근기록</a></li>
            </ul>
        </div><!-- // mypage_menu -->
    </div><!-- //mypage__body -->
</div>
</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
		sessionId : "${sessionId}",
		sessionStatus : "${sessionStatus}",
		sessionNickName : "${sessionNickName}",
		sessionGender : "${sessionGender}"
    }   
    , methods: {
    	pageChange : function(url, param) {
			var target = "_self";
			if(param == undefined){
			//	this.linkCall(url);
				return;
			}
			var form = document.createElement("form"); 
			form.name = "dataform";
			form.action = url;
			form.method = "post";
			form.target = target;
			for(var name in param){
				var item = name;
				var val = "";
				if(param[name] instanceof Object){
					val = JSON.stringify(param[name]);
				} else {
					val = param[name];
				}
				var input = document.createElement("input");
	    		input.type = "hidden";
	    		input.name = item;
	    		input.value = val;
	    		form.insertBefore(input, null);
			}
			document.body.appendChild(form);
			form.submit();
			document.body.removeChild(form);
		}, fnView : function(sessionId){
    		var self = this;
    		self.pageChange("./sub06_04.do", {sessionId : sessionId});
    	}, fnReserve : function(sessionId){
    		var self = this;
    		self.pageChange("./sub06_05.do", {sessionId : sessionId});
    	}, fnMyInfo : function(sessionId){
    		var self = this;
    		self.pageChange("./sub06_07.do", {sessionId : sessionId});
    	}
    }   
    , created: function () {
    	var self = this;
	}
});
</script>