<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://kit.fontawesome.com/5cfee10c06.js" crossorigin="anonymous"></script>
</head>
<style>
</style>
<body>
    <header id="header" class="header type01">
        <div class="wrap">
            <!-- 로고 영역 -->
            <a href="/main.do" class="logo toggle-active-opacity" title="메인페이지로 이동">
                <img src="../images/logo2.png" alt="티키타카카 로고" class="inactive">
                <img src="../images/logo1.png" alt="티키타카카 로고" class="active">
            </a>
            <!-- gnb 영역 시작 -->
            <nav id="gnb" class="navs">
                <div class="box-nav">
                    <a href="javascript:;" class="nav">
                        <span class="text">클럽</span>
                    </a>
                    <div class="fragment">
                        <div class="wrap">
                            <div class="left">
                                <div class="content">
                                    <h3 class="title">
                                        <span class="text"><span>티키타카 클럽</span></span>
                                    </h3>
                                    <p class="body">최고의 클럽을 만들어보세요!</p>
                                </div>
                            </div>
                            <div class="right">
                                <div class="box-nav">
                                    <a href="/sub01_01" class="nav">
                                        <span class="text">클럽 생성</span>
                                    </a>
                                    <div class="box-nav">
                                        <!--2  -->
                                    </div>
                                </div>
                                <div class="box-nav">
                                    <a href="/sub01_02" target="" class="nav">
                                        <span class="text">클럽 조회</span>
                                    </a>
                                    <div class="box-nav">
                                        <!--2  -->
                                    </div>
                                </div>
                                <div class="box-nav">
                                    <a href="javascript:;" target="" class="nav" @click="fnViewMyClub">
                                        <span class="text">내 클럽</span>
                                    </a>
                                    <div class="box-nav">
                                        <!--2  -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-nav">
                    <a href="javascript:;" class="nav">
                        <span class="text">매칭</span>
                    </a>
                    <div class="fragment">
                        <div class="wrap">
                            <div class="left">
                                <div class="content">
                                    <h3 class="title">
                                        <span class="text"><span>티키타카 매칭</span></span>
                                    </h3>
                                    <p class="body">티키타카를 통해 상대와 겨뤄보세요!</p>
                                </div>
                            </div>
                            <div class="right">
                                <div class="box-nav">
                                    <a href="javascript:;" class="nav">
                                        <span class="text">구장 예약</span>
                                    </a>
                                    <div class="box-nav">
                                        <!--2  -->
                                    </div>
                                </div>
                                <div class="box-nav">
                                    <a href="/sub02_02" class="nav">
                                        <span class="text">매칭 예약</span>
                                    </a>
                                    <div class="box-nav">
                                        <!--4  -->
                                    </div>
                                    <!--1  -->
                                </div>

                                <div class="box-nav">
                                    <a href="/sub02_03" class="nav">
                                        <span class="text">매칭 조회</span>
                                    </a>
                                    <div class="box-nav">
                                        <!--4  -->
                                    </div>
                                    <!--1  -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-nav">
                    <a href="javascript:;" class="nav">
                        <span class="text">용병</span>
                    </a>
                    <div class="fragment">
                        <div class="wrap">
                            <div class="left">
                                <div class="content">
                                    <h3 class="title">
                                        <span class="text"><span>티키타카 용병</span></span>
                                    </h3>
                                    <p class="body">일당백 최고의 용병을 구해보세요!</p>
                                </div>
                            </div>
                            <div class="right">
                                <div class="box-nav">
                                    <a href="/sub03_01.do" class="nav">
                                        <span class="text">용병 모집</span>
                                    </a>
                                    <div class="box-nav">
                                    </div>
                                </div>
                                <div class="box-nav">
                                    <a href="/sub03_02.do" class="nav">
                                        <span class="text">용병 참여</span>
                                    </a>
                                    <div class="box-nav">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-nav">
                    <a href="javascript:;" class="nav">
                        <span class="text">나의 랭킹</span>
                    </a>
                    <div class="fragment">
                        <div class="wrap">
                            <div class="left">
                                <div class="content">
                                    <h3 class="title">
                                        <span class="text"><span>티키타카 랭킹</span></span>
                                    </h3>
                                    <p class="body">티키타카 시즌 나만의 기록을 확인하세요!</p>
                                </div>
                            </div>
                            <div class="right">
                                <!-- 일반게시판 -->
                                <div class="box-nav">
                                    <a href="/sub04_01" class="nav">
                                        <span class="text">랭킹 확인하기</span>
                                    </a>
                                    <div class="box-nav">
                                        <!--2  -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-nav">
                    <a href="javascript:;" class="nav">
                        <span class="text">소통마당</span>
                    </a>
                    <div class="fragment">
                        <div class="wrap">
                            <div class="left">
                                <div class="content">
                                    <h3 class="title">
                                        <span class="text"><span>티키타카 소통마당</span></span>
                                    </h3>
                                    <p class="body">소통해요~</p>
                                </div>
                            </div>
                            <div class="right">
                                <div class="box-nav">
                                    <a href="/sub05_01" class="nav">
                                        <span class="text">공지사항</span>
                                    </a>
                                    <div class="box-nav">
                                        <!--2  -->
                                    </div>
                                </div>
                                <div class="box-nav">
                                    <a href="/sub05_02" class="nav">
                                        <span class="text">소통게시판</span>
                                    </a>
                                    <div class="box-nav">
                                        <!--2  -->
                                    </div>
                                </div>
							</div>
						</div>
					</div>
				</div>
            </nav>
            <nav class="head_login">
            	<ul v-if="sessionId != '' && sessionId != null">
	                <li class="colorId"><a href="/mypage.do">{{sessionNickName}}</a>님 환영합니다.</li>
	            </ul>
	            <ul v-else>
	                <li><a href="/login.do">로그인</a></li>
	                <span>|</span>
	                <li><a href="/join.do">회원가입</a></li>
	            </ul>
            </nav>
            <!-- gnb 영역 끝 -->
        </div>
    </header>
</body>
</html>

<script type="text/javascript">
var app = new Vue({ 
    el: '#header',
    data: {
		sessionId : "${sessionId}",
		sessionStatus : "${sessionStatus}",
		sessionNickName : "${sessionNickName}",
		sessionCNo : "${sessionCNo}"
    }   
    , methods: {
    	fnViewMyClub : function(){
    		var self = this;
    		if(self.sessionCNo != "" && self.sessionCNo > 0) {
    			self.pageChange("./clubView.do", {cNo : self.sessionCNo});
    		}
    		else{
    			alert("가입된 클럽이 없습니다.");
    		}
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
		}
	},
	created : function() {
	}
});


</script>
