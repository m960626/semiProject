<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/header.jsp"></jsp:include>
<title>티키타카 - 용병 모집 상세보기(03_03)</title>
<link rel="stylesheet" type="text/css" href="../css/pearl.css">
<link rel="stylesheet" href="../libs/remixicon/remixicon-2.5.0.css">

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>

</head>
<style>
</style>
<body>
	<div id="app">
		<div class="container">
			<div class="wrap">
				<div class="support__haed">
					<div class="sub_title">
						<h2>용병모집</h2>
					</div>
				</div>

				<div class="support__body">
					<article>
						<div class="aticle_title">{{info.gTitle}}</div>
						<div class="aticle_info">
							<span class="writer"><i class="ri-user-line"></i><b
								class="hid">작성자</b><span>{{info.name}}</span> </span> <span
								class="date"><i class="ri-time-line"></i><b class="hid">작성일</b><span>{{info.Year}}-{{info.Month}}-{{info.Date}}</span>
							</span>
						</div>
						<div class="aticle_detail">
							<p>소속 팀 : {{info.cNoH}}</p>
							<p>상대 팀 : {{info.cNoA}}</p>
							<p>구장 위치 : {{info.fLoc}}</p>
							<p>희망 연령대 : {{info.gAge}}</p>
							<p>경기 날짜 : {{info.Year}}-{{info.Month}}-{{info.Date}}</p>
							<p>경기 시간 : {{info.time1}} ~ {{info.time2}}</p>
							<p>
								희망 포지션 : <span>{{info.gPosi1}}</span> 
								<span v-if="info.gPosi2 != ''"> / {{info.gPosi2}}</span> 
								<span v-if="info.gPosi3 != ''"> / {{info.gPosi3}}</span>
							</p>
							<p>주의 사항 : {{info.gInfo}}</p>
						</div>
						<div class="comment_wrap">
							<h4>
								<i class="ri-message-2-fill"></i> 댓글달기 
								(
								<span v-if="(commCnt != null)">{{commCnt}}</span>
								<span v-else>0</span>
								)
							</h4>
							<div class="comment_list">
								<!-- 팀 매니저 용병승인/거절 -->
								<div class="comment_inner" v-for="(item, index) in list">
									<div class="comment_id">
										<b>닉네임 </b> <span>{{item.nick}}</span>
									</div>
									<div class="comment_phone">
										<b>휴대폰번호 </b> <span>{{item.phone}}</span>
									</div>
									<div class="comment_posit">
										<b>포지션 </b> <span>{{item.gPosi}}</span>
									</div>
									<div class="comment_txt">
										<b>상세내용 </b> <span>{{item.gcCont}}</span>
									</div>
									<div class="comment_btn">
										<a href="javascript:;" class="btn_form" v-if="item.gStateYn == 1">용병 거절</a> 
										<a href="javascript:;" class="btn_form type2" @click="successG(item)" v-if="item.gStateYn == 1">용병 승인</a>
										<a class="btn_form" v-if="item.gStateYn == 2">승인 완료</a> 
										
									</div>
								</div>
								<!-- // 팀 매니저 용병승인/거절 -->
								<!-- 용병이 작성시 폼 -->
								<div class="comment_inner" v-if="info.gPCnt > info.getCnt">
									<div class="comment_id">
										<label>닉네임 </label> 
										<span><input type="text" id="commId" class="int" v-model="uInfo.nick"></span>
									</div>
									<div class="comment_phone">
										<label>휴대폰번호 </label> 
										<span><input type="text" id="commPh" class="int" v-model="uInfo.phone"></span>
									</div>
									<div class="comment_posit">
										<label for="" class="lbl">포지션</label>
										<span class="form_row col_7 GuestPosi">
											<div class="details_check">
												<input type="checkbox" name="posi" id="posiF1" :value="info.gPosi1" onclick="chk(this)">
												<label for="posiF1"><span></span>{{info.gPosi1}}</label>
											</div>
											<div class="details_check" v-if="info.gPosi2 != ''">
												<input type="checkbox" name="posi" id="posiF2" :value="info.gPosi2" onclick="chk(this)">
												<label for="posiF2"><span></span>{{info.gPosi2}}</label>
											</div>
											<div class="details_check" v-if="info.gPosi3 != ''">
												<input type="checkbox" name="posi" id="posiF3" :value="info.gPosi3" onclick="chk(this)">
												<label for="posiF3"><span></span>{{info.gPosi3}}</label>
											</div>
										</span>
									</div>
									<div class="comment_txt">
										<label for="txt" class="lbl">상세내용</label>
										<span><textarea name="" id="txt" v-model="gcCont"></textarea></span>
									</div>
									<div class="comment_btn">
										<a href="javascript:;" class="btn_form type2" @click="fnAddComm">작성하기</a>
									</div>
								</div>
								<div class="comment_inner done" v-else>
									<p>용병 모집이 마감되었습니다.</p>
								</div>
								<!-- // 용병이 작성시 폼 -->
							</div>
						</div>
					</article>
				</div>
				<!-- // support__body -->



			</div>
			<!-- // wrap -->
		</div>
		<!-- // container -->
	</div>
</body>
</html>
<script type="text/javascript">

	var chkNum = 0;
	function chk(item) {
		if(item.checked) {
			chkNum += 1;
		} else {
			chkNum -= 1;
		}
		if(chkNum > 1) {
			alert("희망 포지션은 한개만 선택 가능합니다.");
			item.checked = false;
			chkNum -= 1;
		} 
	}

</script>


<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			info : {},
			list : [],
			gNo : "${map.gNo}",
			uInfo : {},
			gcId : 'test125',
			gcPosi : '',
			gcCont : '',
			commCnt : ''
			
			
		},
		methods : {
			fnGetBoard : function() {
				var self = this;
				var nparmap = {
					gNo : self.gNo
				};
				$.ajax({
					url : "/Guest/read.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.info = data.info;
						var gDate = new Date(self.info.gDate);
						if (gDate.getDate() < 10) {
							self.info.Date = '0' + gDate.getDate();
						} else
							self.info.Date = gDate.getDate();

						if (gDate.getMonth() + 1 < 10) {
							self.info.Month = '0' + (gDate.getMonth() + 1);
						} else
							self.info.Month = gDate.getMonth() + 1;
						self.info.Year = gDate.getFullYear();

						self.info.time1 = (self.info.mTimeS).substring(0, 5);
						self.info.time2 = (self.info.mTimeE).substring(0, 5);
						console.log(self.info);
					}
				});
			},
			/* 댓글 리스트 출력 */
			fnGetComm : function() {
				var self = this;
				var nparmap = {
						gNo : self.gNo
				};
				$.ajax({
					url : "/Guest/getComm.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						console.log(self.list);
					}
				});
				
			},
			/* 댓글 작성 */
			fnAddComm : function() {
				var self = this;
                var chkCnt = document.getElementsByName("posi").length;
                for (var i=0; i<chkCnt; i++) {
    	            if (document.getElementsByName("posi")[i].checked == true) {
    	                self.gPosi = document.getElementsByName("posi")[i].value;
    	            }
    	        }
				var nparmap = {
						uId : self.gcId,
						gPosi : self.gPosi,
						gcCont : self.gcCont,
						gNo : self.gNo
				}
				console.log(nparmap);
				$.ajax({
                    url:"/Guest/commAdd.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {  
                    	alert("저장되었습니다.");
                    	self.pageChange("./sub03_03.do", {gNo : self.gNo});
                    	
                    }
                }); 
			},
			/* 댓글 작성자 정보 가져오기*/
			fnUserInfo : function(){
                var self = this;
                var nparmap = {
                		uId : self.gcId
                };
                console.log(nparmap);
                $.ajax({
                    url:"/Guest/CommInfo.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
                    	self.uInfo = data.info;
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
        	},
        	/* 댓글 갯수 */
        	fnCommCnt : function() {
        		var self = this;
        		var nparmap = {gNo : self.gNo};
        		$.ajax({
                    url:"/Guest/commCnt.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
                    	self.commCnt = data.cnt;
                    }
                });
        	},
        	/* 용병 Cnt 증가 */
        	GuestCntUp : function() {
        		var self = this;
        		var nparmap = {gNo : self.gNo};
        		$.ajax({
                    url:"/Guest/GuestCntUp.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
                    }
                }); 
        	},
        	/* 용병 승인 버튼 */
        	successG : function(item) {
        		console.log(item);
        		var self = this;
        		var nparmap = {gcNo : item.gcNo};
        		$.ajax({
                    url:"/Guest/successGuest.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {  
                    	alert("용병을 승인하였습니다.");
                    	self.GuestCntUp();
                    	self.pageChange("./sub03_03.do", {gNo : self.gNo});
                    }
                }); 
        	}
            
		},
		created : function() {
			var self = this;
			self.fnGetBoard();
			self.fnGetComm();
			self.fnCommCnt();
			self.fnUserInfo();
			
		}

	});
</script>