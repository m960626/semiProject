<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<jsp:include page="/layout/subHeader.jsp"></jsp:include>
<link rel="stylesheet" href="css/style.css">
<title>티키타카 - 구장 예약(02_01)</title>
<link rel="stylesheet" href="css/pearl.css">
<link rel="stylesheet" href="css/moon.css">

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>

</head>
<style>
</style>
<body>
	<div id="app">
		<div class="container">
			<div class="wrap">

				<div class="sub_title">
					<h2>구장 예약</h2>
				</div>
				<ul id="ListWrap">
				
				</ul>

			</div>
			<!-- // wrap -->
		</div>
		<!-- // container -->
	</div>
</body>
</html>

<script>
	
	var xhr = new XMLHttpRequest();
	var url = 'http://openapi.seoul.go.kr:8088/63534673506d39363430425673634e/json/ListPublicReservationSport/1/7/축구장/'
	xhr.open('GET', url);
	xhr.onreadystatechange = function () {
		if (this.readyState == xhr.DONE) { // <== 정상적으로 준비되었을때
			if(xhr.status == 200||xhr.status == 201){ // <== 호출 상태가 정상적일때
			/* console.log('Status: '+this.status+
			'\nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+
			'\nBody: '+this.responseText); */
			}
			console.log(JSON.parse(this.responseText).ListPublicReservationSport.row);
			for(var i=0; i<JSON.parse(this.responseText).ListPublicReservationSport.row.length; i++){
				if(JSON.parse(this.responseText).ListPublicReservationSport.row[i].SVCSTATNM == "접수중") {
					var date1S = (JSON.parse(this.responseText).ListPublicReservationSport.row[i].RCPTBGNDT.slice(0,10)).replaceAll('-', '.');
					var date1E = (JSON.parse(this.responseText).ListPublicReservationSport.row[i].RCPTENDDT.slice(0,10)).replaceAll('-', '.');
					var item = document.getElementById("ListWrap");
					// 구장 리스트 출력
					var row = '<li>'
					row += '<a href="'+JSON.parse(this.responseText).ListPublicReservationSport.row[i].SVCURL+'" target="_blank">'
					row += '<div class="imgBox">'
					row += '<div class="ib_top">'
					/* row += '<span class="status">접수중</span>' */
					if(JSON.parse(this.responseText).ListPublicReservationSport.row[i].PAYATNM == "무료"){
						row += '<span class="type1">무료</span>'
					}
					if(JSON.parse(this.responseText).ListPublicReservationSport.row[i].PAYATNM == "유료"){
						row += '<span class="type2">유료</span>'
					}
					row += '</div><img src="'+JSON.parse(this.responseText).ListPublicReservationSport.row[i].IMGURL+'" alt="뿡">'
					row += '</div>'
					row += '<div class="txtBox">'
					row += '<p class="name">'+JSON.parse(this.responseText).ListPublicReservationSport.row[i].SVCNM + '</p>'
					row += '<ul class="infoArea">'
					row += '<li><b class="place">장소명</b><div class="txt">'+JSON.parse(this.responseText).ListPublicReservationSport.row[i].PLACENM+'</div></li>'
					row += '<li><b class="user">이용대상</b><div class="txt">'+JSON.parse(this.responseText).ListPublicReservationSport.row[i].USETGTINFO+'</div></li>'
					row += '<li><b class="date">접수기간</b>'+date1S+' ~ '+date1E+'</li>'	
					row += '<li><b class="time">이용시간</b>'+JSON.parse(this.responseText).ListPublicReservationSport.row[i].V_MIN+'~'+JSON.parse(this.responseText).ListPublicReservationSport.row[i].V_MAX+'</li>'
					row += '</ul>'
					row += '</div>'
					row += '</a>'
					row += '</li>'
					item.innerHTML += row;
				}
			}
		}
	};
	
	xhr.send('');
</script>


<script type="text/javascript">     
	var app = new Vue({
		el : '#app',
		data : {
			
		},
		methods : {
		},
		created : function() {
		}
		
});	
</script>