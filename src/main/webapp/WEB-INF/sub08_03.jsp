<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/header.jsp"></jsp:include>
<title>티키타카 - 새비밀번호입력</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<link rel="stylesheet" type="text/css" href="../css/pearl.css">
</head>
<body>
<div class="container">
    <div class="wrap" id="app">
        <div class="sub_title">
            <h2>새 비밀번호 입력</h2>
        </div>
        <form action="">
            <div class="login__body">
                <div class="form_row">
                    <label for="change_password">새 비밀번호</label>
                    <input type="password" v-model="info.pwd1" id="change_password" class="int" placeholder="새 비밀번호">
                </div>
                <!--
                <div class="form_text">
                    <p>영문 대소문자, 숫자, 특수문자 중 3개 이상을 조합하여 8자리 이상 입력해주세요.</p>
                </div>
                -->
                <div class="form_row">
                    <label for="password">새 비밀번호 확인</label>
                    <input type="password" v-model="info.pwd2" id="password" class="int" placeholder="비밀번호 확인">
                </div>
                <a href="javascript:;" class="btn_form type3" id="btn_sumit" @click="fnJoin();">확인</a> 
            </div><!-- //login__body -->
        </form>
    </div>
</div> 
</body>

</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
		info : {
			id : "${map.id}",
			pwd1 : "",
			pwd2 : "",
		}
    }   
    , methods: {
    	fnJoin : function(){
    		var self = this;
    		if(self.info.pwd1 == '' || self.info.pwd2 == ''){
    			alert("새 비밀번호를 입력해주세요.");
    			return;
    		}
    		if(self.info.pwd1 != self.info.pwd2){
    			alert("비밀번호가 일치하지 않습니다.");
    			return;
    		}
    		var nparmap = {pwd1 : self.info.pwd1, id : self.info.id};
            $.ajax({
                url:"/newpw.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.result == "success"){
                		alert("비밀번호가 변경되었습니다. 로그인 페이지로 이동합니다.");
                		self.id = self.info.id;
                		self.fnView();
                	} else {
                		alert("일치하는 정보가 없습니다.");
                		return;
                	}
                }
            }); 
    	}, 
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
		} , 
		fnView : function(){
			var self = this;
			self.pageChange("./login.do", {id : self.id});
		}
    }   
    , created: function () {
    
	}
});
</script>