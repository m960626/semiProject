<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/header.jsp"></jsp:include>
<link rel="stylesheet" href="css/style.css">
<title>티키타카 - 매칭 조회(02_03)</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/pearl.css">

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

</head>
<style>
</style>
<body>
	<div id="app">
	 	<div class="filed__container">
	        <div class="wrap">
	            <div class="filed__body">
	                <div class="filed_img">
	                    <img src="/resources/images/img_ground.jpg" alt="">
	                </div>
	                <div class="filed_infos">
	                    <section class="section01">
	                        <div class="section__title">
	                            <h3>구장 위치</h3>
	                        </div>
	                        <div class="info__list">
	                            <div class="filed_date">5월 14일 일요일 12:00</div>
	                            <div class="filed_name">안성 푸항항 풋살장</div>
	                            <div class="filed_loc">경기도 안성시 공도읍 진사리 345</div>
	                            <div class="filed_price">20,000원 / 2시간</div>
	                        </div>
	                    </section>
	                    <section class="section02">
	                        <div class="section__title">
	                            <h3>경기장 정보</h3>
	                        </div>
	                        <div class="info__list">
	                            <ul>
	                                <li><i class="ico_size"></i>구장 크기<br>40 X 20</li>
	                                <li><i class="ico_shower"></i>샤워실<br>있음</li>
	                                <li><i class="ico_parking"></i>무료주차</li>
	                                <li><i class="ico_ball"></i>공 대여여부<br>없음</li>
	                                <li><i class="ico_smoking"></i>흡연실<br>있음</li>
	                                <li><i class="ico_store"></i>매점<br>있음</li>
	                                <li><i class="ico_vest"></i>조끼대여<br>가능</li>
	                            </ul>
	                        </div>
	                    </section>
	                    <section class="section03">
	                        <div class="section__title">
	                            <h3>구장 특이사항</h3>
	                        </div>
	                        <pre>
	                            ■풋살장 가는 길: 롯데마트 주차장 주차 후 8층으로 이동
	                            ■22시 이 후 매치 종료 시 마트를 통해서 퇴장이 불가하기 때문에 차량 출입구를 통해서 퇴장해주셔야 됩니다.
	    
	                            ■주차: 롯데마트 주차장 이용
	    
	                            ■흡연: 흡연구역 외 절대 금연(흡연구역 외에서 흡연 적발 시 곧바로 퇴장조치됩니다) 8층 블루 구장 옆 흡연구역 이용
	    
	                            ■화장실: O
	    
	                            ■풋살화 대여: O (사이즈: 250~280mm / 대여료: 3천 원)
	    
	                            ■기타
	                            - 구장 내에서는 음료 외 다른 음식물 섭취를 금지합니다.
	                            - 운동 후 구장 내부,외부 쓰레기 정리 해주세요.
	                            -2,4주 일요일에는 마트 휴무로 인해, 마트로 입장이 불가능합니다.
	                            참가자분은 주차장 출구쪽을 통해서 입장 부탁 드립니다. (도보, 차량 모두)
	    
	                        </pre>
	                    </section>
	                    <section class="section04">
	                        <div class="section__title">
	                            <h3>구장 위치</h3>
	                        </div>
	                    </section>
	                </div>
	            </div><!-- // matching__body -->
	        </div>
	    </div>		
	</div>
</body>
</html>
<script type="text/javascript">
Vue.component('paginate', VuejsPaginate)
	var app = new Vue({
		el : '#app',
		data : {
			sessionId : "${sessionId}",
			sessionNickName : "${sessionNickName}",
			sessionStatus : "${sessionStatus}"
		
		},
		methods : {
			
		},
		created : function() {
			
		}
		
});	
</script>