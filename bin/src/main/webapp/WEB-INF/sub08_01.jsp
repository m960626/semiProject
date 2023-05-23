<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/header.jsp"></jsp:include>
<title>티키타카 - 아이디찾기</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<link rel="stylesheet" type="text/css" href="../css/pearl.css">
</head>
<body>
<div class="container">
    <div class="wrap" id="app">
        <div class="sub_title">
            <h2>아이디 찾기</h2>
        </div>
        <form action="">
            <div class="login__body">
                <div class="form_row">
                    <label for="name" class="lbl medium">이름</label>
                    <input type="text" v-model="info.name" id="name" class="int" placeholder="이름">
                </div>
                <div class="form_row">
                    <label for="email" class="lbl medium">이메일</label>
                    <input type="text" v-model="info.email" id="email" class="int" placeholder="이메일">
                </div>
				<a href="javascript:;" class="btn_form type3" id="btn_sumit" @click="fnJoin">아이디 찾기</a>                
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
			id : "",
			name : "",
			email : ""
		}
    }   
    , methods: {
    	fnJoin : function(){
    		var self = this;
    		var nparmap = {id : self.info.id, name : self.info.name, email : self.info.email};
    		
    		if(self.info.name == ''){
    			alert("이름을 입력해주세요.");
    			return;
    		}
    		if(self.info.email == ''){
    			alert("이메일을 입력해주세요.");
    			return;
    		}
    		console.log(nparmap);
    		$.ajax({
                url:"/findid.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	if(data.result == "success"){
                		alert("아이디는 " + data.info.id + "입니다. 로그인 페이지로 이동합니다.");
                		self.id = data.info.id;
                		self.fnView();
                	} else {
                		alert("일치하는 정보가 없습니다.");
                		return;
                	}
                }
            }); 
    	}, pageChange : function(url, param) {
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