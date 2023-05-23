<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/subHeader.jsp"></jsp:include>
<title>티키타카 - 구장 정보 조회(02_04)</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/pearl.css">
<link rel="stylesheet" type="text/css" href="../css/hong.css">

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<style>
</style>
<body>
	<div id="app">
	 	<div class="filed__container">
	        <div class="wrap">
	            <div class="filed__body">
	                <div class="filed_img">
	                    <img src="/images/img_ground.jpg" alt="">
	                </div>
	                <div class="filed_infos">
	                    <section class="section01">
	                        <div class="section__title">
	                            <h3>구장 위치</h3>
	                        </div>
	                        <div class="info__list">
	                            <div class="filed_date">{{info.mDate}} {{info.mTimeS}}</div>
	                            <div class="filed_name">{{info.fName}}</div>
	                            <div class="filed_loc">{{info.fLoc}}</div>
	                            <div class="filed_price">{{info.fPrice}}원</div>
	                        </div>
	                    </section>
	                    <section class="section02">
	                        <div class="section__title">
	                            <h3>경기장 정보</h3>
	                        </div>
	                        <div class="info__list">
	                            <ul>
	                                <li><i class="ico_size"></i>구장 크기<br>40 X 20</li>
	                                <li v-if="info.showerYn == 'Y'"><i class="ico_shower"></i>샤워실<br>있음</li>
	                                <li v-if="info.showerYn != 'Y'"><i class="ico_shower"></i>샤워실<br>없음</li>
	                                <li v-if="info.parking == '1'"><i class="ico_parking"></i>유료주차</li>
	                                <li v-if="info.parking == '2'"><i class="ico_parking"></i>무료주차</li>
	                                <li v-if="info.parking == '3'"><i class="ico_parking"></i>주차장 없음</li>
	                                <li v-if="info.ballYn == 'Y'"><i class="ico_ball"></i>공 대여여부<br>가능</li>
	                                <li v-if="info.ballYn != 'Y'"><i class="ico_ball"></i>공 대여여부<br>불가능</li>
	                                <li v-if="info.smokeYn == 'Y'"><i class="ico_smoking"></i>흡연실<br>있음</li>
	                                <li v-if="info.smokeYn != 'Y'"><i class="ico_smoking"></i>흡연실<br>없음</li>
	                                <li v-if="info.marketYn == 'Y'"><i class="ico_store"></i>매점<br>있음</li>
	                                <li v-if="info.marketYn != 'Y'"><i class="ico_store"></i>매점<br>없음</li>
	                                <li v-if="info.vestYn == 'Y'"><i class="ico_vest"></i>조끼대여<br>가능</li>
	                                <li v-if="info.vestYn != 'Y'"><i class="ico_vest"></i>조끼대여<br>불가능</li>
	                            </ul>
	                        </div>
	                    </section>
	                    <section class="section03">
	                        <div class="section__title">
	                            <h3>경기 상세정보</h3>
	                        </div>
	                        <pre>
	                            ■경기 시간: <span>{{info.mTimeS}} ~ {{info.mTimeE}}</span>
	                            
	                            ■유니폼 색상: {{info.mColor}}
	    
	                            ■멤버 성별: <span v-if="info.mGender == 1">남자</span><span v-if="info.mGender == 2">여자</span><span  v-if="info.mGender == 3">혼성</span>	                           
	    
	                            ■상대팀 실력: <span v-if="info.mGrade == 1">하</span><span v-if="info.mGrade == 2">중</span><span v-if="info.mGrade == 3">상</span><span v-if="info.mGrade == 4">최상</span>
	   	    
	                            ■추가 사항: {{info.mCont}}
	    
	                        </pre>
	                    </section>
	                    <section class="section04">
	                        <div class="section__title">
	                            <h3 class="locTitle">구장 위치</h3>
								<div class="map_wrap">
								    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
								
								    <div id="menu_wrap" class="bg_white">
								        <div class="option">
								            <div>
								                <template>
								                    키워드 : <input type="text" v-model="info.fLoc" id="keyword" size="15"> 
								                    <button @click="searchPlaces">검색하기</button> 
								                </template>
								            </div>
								        </div>
								        <hr>
								        <ul id="placesList"></ul>
								        <div id="pagination"></div>
								    </div>
								</div>	                            
	                        </div>
	                    </section>
				<div class="btnBox2">
					<button class="btn_form" @click="opendimmed">참여인원 선택하기</button>
					<button class="btn_form" @click="fnApply">신청하기</button>
				</div>
				<!-- // foot_btn -->
				<div id="myModal" class="editDimmed">
				    <div class="editDimmed-content">				 
				        <h1>참여인원 선택</h1>				        
				      	<div class="tbl tbl-list">
						<table>
							<colgroup>
								<col style="width: 50px">
								<col style="width: 50px">
								<col style="width: 100px">
								<col style="width: 100px">
								<col style="width: 100px">
								<col style="width: 100px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col">No.</th>
									<th scope="col">선수명</th>
									<th scope="col">포지션</th>
									<th scope="col">득점수</th>
									<th scope="col">활동 경기수</th>
								</tr>
							</thead>
							<tbody>
								<template>
									<tr v-for="(item, index) in list">							
										<td scope="col">
											<div class="details_check">
												<input type="checkbox"  v-model="pList" :value="item.id" :id="item.name">
												<label :for="item.name"><span></span></label>
											</div>										
										</td>
										<td scope="col">{{index + 1}}</td>
										<td scope="col">{{item.name}}</td>
										<td scope="col">{{item.position1}}</td>
										<td scope="col">{{item.mgoal}}</td>
										<td scope="col">{{item.cnt}}</td>
									</tr>
								</template>
							</tbody>
						</table>
						</div>
						<div class="dimBtn">
					        <button class="btn" @click="fnpList">저장</button>
					        <button @click="fnCloseDim">취소</button>
				        </div>
				    </div>
				</div>		                    
	                </div>
	            </div><!-- // matching__body -->
	        </div>
	    </div>		
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			mNo : "${map.mNo}",
			sessionId : "${sessionId}",
			sessionNickName : "${sessionNickName}",
			sessionStatus : "${sessionStatus}",
			idInfo : {},
			info : {},
			map : {},
	    	ps : {},
	    	marker : {},
	    	markers : [],
	    	pList : [],
	    	list : [],
		
		},
		methods : {
			// 클럽 여부 확인
			fnCheck : function() {
				var self = this;
				if(self.sessionId == ""){
					alert("로그인 후 이용해주세요.");
					location.href="/login.do";
				}
				else {
					var nparmap = {id : self.sessionId};			
			        $.ajax({
			            url:"/checkClub.dox",
			            dataType:"json",	
			            type : "POST", 
			            data : nparmap,
			            success : function(data) { 
			            	if(data.result == "success") {
			            		self.idInfo = data.info;
			            		self.fnGetInfo();		        			
			            	}
			            	else {
			            		alert("클럽 가입 후 이용해주세요.");
								location.href="/main.do";
			            	}
			            }
			        }); 
				}
			}
			, fnGetInfo : function(){
				var self = this;
				if(self.mNo != ""){
		    		var nparmap ={mNo : self.mNo};
		             $.ajax({
		                 url:"/matching/getInfo.dox",
		                 dataType:"json",	
		                 type : "POST", 
		                 data : nparmap,
		                 success : function(data) { 
		                	 self.info = data.info; 
	                		 var tDate = self.info.mDate;	                		 
	                		 var lDate = new Date(tDate);
							 tDate = (lDate.getMonth()+1) + "월 " + lDate.getDate() + "일"
	                		 self.info.mDate = tDate;
	                		 
	                		 var time1 = self.info.mTimeS.slice(0, 5);
	                		 self.info.mTimeS = time1;	                		 
	                		 var time2 = self.info.mTimeE.slice(0, 5);
	                		 self.info.mTimeE = time2;
	                		 const dateA = new Date(time1);
	                		 const dateB = new Date(time2);
		                 }
		             });
				}
			}
			, opendimmed : function() {
				  var modal = document.getElementById("myModal");
				  modal.style.display = "block";
				  var self = this;
				  var nparmap = {id : self.sessionId};
	             $.ajax({
	                 url:"/clubPList.dox",
	                 dataType:"json",	
	                 type : "POST", 
	                 data : nparmap,
	                 success : function(data) { 
	                	 self.list = data.list;
	                 }
	             }); 
		   }
		   ,fnpList : function (){
			   var self = this;
			   if(self.pList.length < 7){
				   alert("8명 이상부터 매칭이 가능합니다.");
			   }
			   else if(self.pList.length > 15){
				   alert("15명 이하로 선택해주세요.");
			   }
			   else{
			   	closedimmed();
		   	   }
		   }
		   , fnCloseDim : function (){
			   var self = this;
			   self.pList = [];
			   closedimmed();
		   }
		   , fnMatchP : function(mNo) {
				var self = this;
				var nparmap = {list : JSON.stringify(self.pList), mNo : self.mNo, cName : self.idInfo.cName};
	            $.ajax({
	                 url:"/addPList.dox",
	                 dataType:"json",	
	                 type : "POST", 
	                 data : nparmap,
	                 success : function(data) { 
	                 }
	             });  
			}
		   , fnUpdateMatch : function() {
				var self = this;
				var nparmap = {mNo : self.mNo, cName : self.idInfo.cName};
	            $.ajax({
	                 url:"/updateMatch.dox",
	                 dataType:"json",	
	                 type : "POST", 
	                 data : nparmap,
	                 success : function(data) { 
	                 }
	             });  
			}
		   	// 구장 & 경기 정보 추가
		   , fnApply : function(){
	    		var self = this;	    		
	    		if(self.pList.length == 0){
	    			alert("참여 인원을 선택해주세요.");
	    		}
	    		else {
					self.fnMatchP();
					self.fnUpdateMatch();
					alert("매칭 신청되었습니다.");
					//location.href="/sub02_03";
	    		} 
			}
				,initMap() {
		    		var container = document.getElementById('map');
		    	       var options = {
		    	         center: new kakao.maps.LatLng(33.450701, 126.570667),
		    	         level: 3
		    	       };
		    	       this.map = new kakao.maps.Map(container, options);
		    	       
		    	       //마커추가하려면 객체를 아래와 같이 하나 만든다.
		    	       var marker = new kakao.maps.Marker({
		    	         position: this.map.getCenter()
		    	       });
		    	       marker.setMap(this.map);
		    	       
		    	    // 장소 검색 객체를 생성합니다
		   	       this.ps = new kakao.maps.services.Places();  
		
		   	       // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		   	       this.infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		   	       // 키워드로 장소를 검색합니다
		   	       this.searchPlaces();
		   	    
		   	    },
		   	    
		   	    addScript() {
		   	      const script = document.createElement('script');
		   	        /* global kakao */
		   	        script.onload = () => kakao.maps.load(this.initMap);
		   	        script.src = 'http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=30e998e52c143c51abd2dbc6754b52d3&libraries=services';
		   	        document.head.appendChild(script);
		   	    },
		   	    
			   	// 키워드 검색을 요청하는 함수입니다
			   	 searchPlaces : function() {
			
			   	     var keyword = document.getElementById('keyword').value;
			
			   	     if (!keyword.replace(/^\s+|\s+$/g, '')) {
			   	         alert('키워드를 입력해주세요!');
			   	         return false;
			   	     }
			
			   	     // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			   	     this.ps.keywordSearch( keyword, this.placesSearchCB); 
			   	 },
			
			   	 // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
			   	 placesSearchCB : function(data, status, pagination) {
			   	     if (status === kakao.maps.services.Status.OK) {
			
			   	         // 정상적으로 검색이 완료됐으면
			   	         // 검색 목록과 마커를 표출합니다
			   	         this.displayPlaces(data);
			
			   	         // 페이지 번호를 표출합니다
			   	         this.displayPagination(pagination);
			
			   	     } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			
			   	         alert('검색 결과가 존재하지 않습니다.');
			   	         return;
			
			   	     } else if (status === kakao.maps.services.Status.ERROR) {
			
			   	         alert('검색 결과 중 오류가 발생했습니다.');
			   	         return;
			
			   	     }
			   	 },
			
			   	 // 검색 결과 목록과 마커를 표출하는 함수입니다
			   	 displayPlaces : function(places) {
					var self = this;
			   	     var listEl = document.getElementById('placesList'), 
			   	     menuEl = document.getElementById('menu_wrap'),
			   	     fragment = document.createDocumentFragment(), 
			   	     bounds = new kakao.maps.LatLngBounds(), 
			   	     listStr = '';
			   	     
			   	     // 검색 결과 목록에 추가된 항목들을 제거합니다
			   	     this.removeAllChildNods(listEl);
			
			   	     // 지도에 표시되고 있는 마커를 제거합니다
			   	     this.removeMarker();
			   	     
			   	     for ( var i=0; i<places.length; i++ ) {
			
			   	         // 마커를 생성하고 지도에 표시합니다
			   	         var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
			   	             marker = this.addMarker(placePosition, i), 
			   	             itemEl = this.getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
			
			   	         // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			   	         // LatLngBounds 객체에 좌표를 추가합니다
			   	         bounds.extend(placePosition);
			
			   	         // 마커와 검색결과 항목에 mouseover 했을때
			   	         // 해당 장소에 인포윈도우에 장소명을 표시합니다
			   	         // mouseout 했을 때는 인포윈도우를 닫습니다
			   	         (function(marker, title) {
			   	             kakao.maps.event.addListener(marker, 'mouseover', function() {
			   	            	self.displayInfowindow(marker, title);
			   	             });
			
			   	             kakao.maps.event.addListener(marker, 'mouseout', function() {
			   	                 self.infowindow.close();
			   	             });
			
			   	             itemEl.onmouseover =  function () {
			   	            	self.displayInfowindow(marker, title);
			   	             };
			
			   	             itemEl.onmouseout =  function () {
			   	                 self.infowindow.close();
			   	             };
			   	         })(marker, places[i].place_name);
			
			   	         fragment.appendChild(itemEl);
			   	     }
			
			   	     // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			   	     listEl.appendChild(fragment);
			   	     menuEl.scrollTop = 0;
			
			   	     // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			   	     this.map.setBounds(bounds);
			   	 },
			
			   	 // 검색결과 항목을 Element로 반환하는 함수입니다
			   	 getListItem : function(index, places) {
			
			   	     var el = document.createElement('li'),
			   	     itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
			   	                 '<div class="info">' +
			   	                 '   <h5>' + places.place_name + '</h5>';
			
			   	     if (places.road_address_name) {
			   	         itemStr += '    <span>' + places.road_address_name + '</span>' +
			   	                     '   <span class="jibun gray">' +  places.address_name  + '</span>';
			   	     } else {
			   	         itemStr += '    <span>' +  places.address_name  + '</span>'; 
			   	     }
			   	                  
			   	       itemStr += '  <span class="tel">' + places.phone  + '</span>' +
			   	                 '</div>';           
			
			   	     el.innerHTML = itemStr;
			   	     el.className = 'item';
			
			   	     return el;
			   	 },
			
			   	 // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			   	 addMarker : function(position, idx, title) {
			   	     var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			   	         imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
			   	         imgOptions =  {
			   	             spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			   	             spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			   	             offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			   	         },
			   	         markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
			   	             marker = new kakao.maps.Marker({
			   	             position: position, // 마커의 위치
			   	             image: markerImage 
			   	         });
			
			   	     marker.setMap(this.map); // 지도 위에 마커를 표출합니다
			   	     this.markers.push(marker);  // 배열에 생성된 마커를 추가합니다
			
			   	     return marker;
			   	 },
			
			   	 // 지도 위에 표시되고 있는 마커를 모두 제거합니다
			   	 removeMarker : function() {
			   	     for ( var i = 0; i < this.markers.length; i++ ) {
			   	    	this.markers[i].setMap(null);
			   	     }   
			   	  	this.markers = [];
			   	 },
			
			   	 // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
			   	 displayPagination : function(pagination) {
			   	     var paginationEl = document.getElementById('pagination'),
			   	         fragment = document.createDocumentFragment(),
			   	         i; 
			
			   	     // 기존에 추가된 페이지번호를 삭제합니다
			   	     while (paginationEl.hasChildNodes()) {
			   	         paginationEl.removeChild (paginationEl.lastChild);
			   	     }
			
			   	     for (i=1; i<=pagination.last; i++) {
			   	         var el = document.createElement('a');
			   	         el.href = "#";
			   	         el.innerHTML = i;
			
			   	         if (i===pagination.current) {
			   	             el.className = 'on';
			   	         } else {
			   	             el.onclick = (function(i) {
			   	                 return function() {
			   	                     pagination.gotoPage(i);
			   	                 }
			   	             })(i);
			   	         }
			
			   	         fragment.appendChild(el);
			   	     }
			   	     paginationEl.appendChild(fragment);
			   	 },
			
			   	 // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
			   	 // 인포윈도우에 장소명을 표시합니다
			   	 displayInfowindow : function(marker, title) {
			   	     var self = this;
			   		 var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
			
			   	     self.infowindow.setContent(content);
			   	     self.infowindow.open(self.map, marker);
			   	 },
			
			   	  // 검색결과 목록의 자식 Element를 제거하는 함수입니다
			   	 removeAllChildNods : function(el) {   
			   	     while (el.hasChildNodes()) {
			   	         el.removeChild (el.lastChild);
			   	     }
			   	 }
		}   	    
	    , mounted(){
	    	window.kakao && window.kakao.maps ? this.initMap() : this.addScript();  
		},
		created : function() {
			var self = this;			
			self.fnCheck();
		}
		
});	
	
//dimmed 창 열기
function opendimmed() {
  var modal = document.getElementById("myModal");
  modal.style.display = "block";
}

// dimmed 창 닫기
function closedimmed() {
  var modal = document.getElementById("myModal");
  modal.style.display = "none";
}

// 선택인원 제한
$(document).ready(function () {
       $("input[type='checkbox']").on("click", function(){
           let count = $("input:checked[type='checkbox']").length;

           if(count > 11){
               $(this).prop("checked", false);
               alert("11명까지만 선택할 수 있습니다.")
           }
       })
   });
			 
</script>