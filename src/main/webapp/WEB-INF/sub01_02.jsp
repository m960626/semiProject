<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/pearl.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="css/hong.css">
<title>티키타카 - 클럽 검색/조회(01_02)</title>

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- 페이징 추가 1-->
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>

</head>

<body>
	<div id="app">
		<div class="container">
			<!-- 클럽 조회 / 검색 -->
			<div class="wrap clubS">
				<div class="sub_title">
					<h2>클럽 조회 / 검색</h2>
				</div>
				<!-- 검색 영역 시작 -->
				<div>
					<div class="form_row form_flex serch">
						<div class="form_inner">
							<label for="logo" class="lbl">클럽검색</label> <input type="text"
								id="logo" class="int" v-model="info.cName"
								@keyup.enter="fnGetList()" placeholder="클럽명 검색">
						</div>
						<button id="searchForm" class="btn1" @click="fnGetList"
							class="btn btn-primary">검색</button>
						<button class="btn2" @click="fnReset()">초기화</button>
					</div>
					<!-- 활동지역 선택 -->
					<div class="form_row form_flex">
						<div class="form_inner">
							<label for="ground" class="lbl">활동지역</label> <select name=""
								id="" class="selectBox" v-model="info.cLoc">
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
						<!-- 클럽 상태 선택 -->
						<div class="form_inner">
							<label for="mem_gender" class="lbl">클럽 상태</label> <select name=""
								id="" class="selectBox" v-model="info.cStat">
								<option value="">전체</option>
								<option value="1">모집중</option>
								<option value="2">모집마감</option>
								<option value="3">포화</option>
							</select>
						</div>
					</div>
					<!-- 인원수 선택 -->
					<div class="form_row form_flex">
						<div class="form_inner">
							<label for="grade" class="lbl">인원수</label> <select name=""
								id="people" class="selectBox" v-model="info.cnt1"
								@click="fnCnt1">
								<option value="">전체</option>
								<option value="10">10명 이상</option>
								<option value="20">20명 이상</option>
								<option value="30">30명 이상</option>
								<option value="40">40명 이상</option>
								<option value="50">50명 이상</option>
							</select> <input type="text" id="uni_color" class="int"
								placeholder="직접 입력" v-model="info.cnt2" @click="fnCnt2">

						</div>
						<!-- 연령대 선택 -->
						<div class="form_inner">
							<label for="time" class="lbl">연령대</label> <select id="age1"
								class="selectBox" v-model="info.cAge1">
								<option value="">전체</option>
								<option value="10">10대</option>
								<option value="20">20대</option>
								<option value="30">30대</option>
								<option value="40">40대</option>
								<option value="50">50대</option>
							</select> <span class="between">~</span> <select id="age2"
								class="selectBox" v-model="info.cAge2">
								<option value="">전체</option>
								<option value="10">10대</option>
								<option value="20">20대</option>
								<option value="30">30대</option>
								<option value="40">40대</option>
								<option value="50">50대</option>
							</select>
						</div>
					</div>
					<!-- 승률 검색 -->
					<div class="form_row form_flex">
						<div class="form_inner">
							<label for="parking" class="lbl">승률</label> <select name="" id=""
								class="selectBox" v-model="info.rate">
								<option value="">전체</option>
								<option value="10">10%</option>
								<option value="20">20%</option>
								<option value="30">30%</option>
								<option value="40">40%</option>
								<option value="50">50%</option>
								<option value="60">60%</option>
								<option value="70">70%</option>
								<option value="80">80%</option>
								<option value="90">90%</option>
							</select>
						</div>
						<!-- 성별 검색 -->
						<div class="form_inner">
							<label for="toliet" class="lbl">멤버 성별</label> <select name=""
								id="" class="selectBox" v-model="info.cGender">
								<option value="">전체</option>
								<option value="1">남자</option>
								<option value="2">여자</option>
								<option value="3">혼성</option>
							</select>
						</div>
					</div>

					<!-- 선호요일 선택 -->
					<div class="form_row col_7">
						<label for="gender" class="lbl">선호 요일</label>
						<div class="details_check">
							<input type="checkbox" name="day" id="day_1" v-model="cDay"
								value="월"> <label for="day_1"><span></span>월요일</label>
						</div>
						<div class="details_check">
							<input type="checkbox" name="day" id="day_2" v-model="cDay"
								value="화"> <label for="day_2"><span></span>화요일</label>
						</div>
						<div class="details_check">
							<input type="checkbox" name="day" id="day_3" v-model="cDay"
								value="수"> <label for="day_3"><span></span>수요일</label>
						</div>
						<div class="details_check">
							<input type="checkbox" name="day" id="day_4" v-model="cDay"
								value="목"> <label for="day_4"><span></span>목요일</label>
						</div>
						<div class="details_check">
							<input type="checkbox" name="day" id="day_5" v-model="cDay"
								value="금"> <label for="day_5"><span></span>금요일</label>
						</div>
						<div class="details_check">
							<input type="checkbox" name="day" id="day_6" v-model="cDay"
								value="토"> <label for="day_6"><span></span>토요일</label>
						</div>
						<div class="details_check">
							<input type="checkbox" name="day" id="day_7" v-model="cDay"
								value="일"> <label for="day_7"><span></span>일요일</label>
						</div>
					</div>

					<!-- 클럽 검색 결과 -->
					<div class="sub_title2">
						<h2>클럽 검색 결과</h2>
					</div>
					<div class="tbl tbl-list">
						<table>
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">클럽 로고</th>
									<th scope="col">클럽 명</th>
									<th scope="col">인원 수</th>
									<th scope="col">클럽 상태</th>
									<th scope="col">활동 지역</th>
									<th scope="col">연령대</th>
									<th scope="col">선호요일</th>
									<th scope="col">승률</th>
									<th scope="col">멤버 성별</th>
									<th scope="col">클럽 <br>생성일</th>
								</tr>
							</thead>
							<tbody>
								<template v-if="dataFlg">
									<tr v-for="(item, index) in list" @click="fnViewClub(item)">
										<td>{{index + 1}}</td>
										<td class="clubImg">
											<img :src="item.imgData" />
										</td>
										<td>{{item.cName}}</td>
										<td>{{item.cnt}} 명</td>
										<td>{{item.cStat}}</td>
										<td>{{item.locName}}</td>
										<td>{{item.cAge1}}대 ~ <br>{{item.cAge2}}대</td>
										<td>{{item.cDay1}} <span v-if="item.cDay2 != null">,
												{{item.cDay2}}</span> <span v-if="item.cDay3 != null">,
												{{item.cDay3}}</span>
										</td>
										<td>{{item.rate}} %</td>
										<td>{{item.cGender}}</td>
										<td>{{item.cDate.slice(0, 5)}}<br>{{item.cDate.slice(5)}}</td>
	
									</tr>
								</template>
							</tbody>
						</table>
					</div>
					<div v-if="!dataFlg">검색결과가 없습니다.</div>
					 <!-- 페이징 추가 3-->
					<template>
					  <paginate
					    :page-count="pageCount"
					    :page-range="3"
					    :margin-pages="2"
					    :click-handler="fnSearch"
					    :prev-text="'<'"
					    :next-text="'>'"
					    :container-class="'page_navi'"
					    :page-class="'page-number'">
					  </paginate>
					</template>
				</div>
			</div>
		</div>
	</div>
</body>

</html>

<script type="text/javascript">
Vue.component('paginate', VuejsPaginate)
	// ===================== 클럽리스트 조회 =====================
	var app = new Vue({
		el : '#app',
		data : {
			sessionId : "${sessionId}",
			sessionNickName : "${sessionNickName}",
			sessionStatus : "${sessionStatus}",
			list : [],
			info : {
				cLoc : "",
				cStat : "",
				cnt1 : "",
				cnt2 : "",
				cAge1 : "",
				cAge2 : "",
				rate : "",
				cGender : "",
				startNum : 0
			},
			cDay : [],
			dataFlg : true,
			selectPage : 1,
			pageCount : 1,
			cnt : 0
		},
		methods : {
			fnGetList : function() {
				var self = this;
				self.info.cDay1 = self.cDay[0];
				self.info.cDay2 = self.cDay[1];
				self.info.cDay3 = self.cDay[2];
				var nparmap = self.info;
				$.ajax({
					url : "/getList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						if (data.result == "success") {
							self.dataFlg = true;
							self.list = data.list
							self.cnt = data.cnt;
			 	             self.pageCount = Math.ceil(self.cnt / 10);
							for (var i = 0; i < self.list.length; i++) {
								if (self.list[i].cStat == 1) {
									self.list[i].cStat = "모집중"
								} else if (self.list[i].cStat == 2) {
									self.list[i].cStat = "모집마감"
								} else {
									self.list[i].cStat = "포화"
								}
								if (self.list[i].cGender == 1) {
									self.list[i].cGender = "남자"
								} else if (self.list[i].cGender == 2) {
									self.list[i].cGender = "여자"
								} else {
									self.list[i].cGender = "혼성"
								}
								self.list[i].cDate = self.list[i].cDate.slice(
										0, 10);
							}
						} else {
							self.dataFlg = false;
						}
					}
				});
			}
			<!-- 페이징 추가 7-->
			, fnSearch : function(pageNum){
				var self = this;
				self.selectPage = pageNum;
				self.info.startNum = ((pageNum-1) * 10);
				var nparmap = self.info;
				$.ajax({
					url : "/getList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							self.dataFlg = true;
							self.list = data.list
							for (var i = 0; i < self.list.length; i++) {
								if (self.list[i].cStat == 1) {
									self.list[i].cStat = "모집중"
								} else if (self.list[i].cStat == 2) {
									self.list[i].cStat = "모집마감"
								} else {
									self.list[i].cStat = "포화"
								}
								if (self.list[i].cGender == 1) {
									self.list[i].cGender = "남자"
								} else if (self.list[i].cGender == 2) {
									self.list[i].cGender = "여자"
								} else {
									self.list[i].cGender = "혼성"
								}
								self.list[i].cDate = self.list[i].cDate.slice(
										0, 10);
							}
						} else {
							self.dataFlg = false;
						}
					}
				});
			}
			// ===================== 초기화 버튼 =====================
			,
			fnReset : function() {
				var self = this;
				self.info.cName = "";
				self.info.cLoc = "";
				self.info.cStat = "";
				self.info.cnt1 = "";
				self.info.cnt2 = "";
				self.info.cAge1 = "";
				self.info.cAge2 = "";
				self.info.rate = "";
				self.info.cGender = "";
				self.cDay = [];
				self.fnGetList();
			},
			fnCnt1 : function() {
				var self = this;
				self.info.cnt2 = "";
			},
			fnCnt2 : function() {
				var self = this;
				self.info.cnt1 = "";
			},
			
			
			// ============================ 문상혁 수정 ===================================
			fnViewClub : function(item) {
				var self = this;
				console.log(item.cNo);
				self.pageChange("./clubView.do", {cNo : item.cNo});
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
			var self = this;
			self.fnGetList();
		}

	});

	// ===================== 체크박스 선택 제한 =====================
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