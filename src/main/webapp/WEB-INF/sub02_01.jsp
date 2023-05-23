<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<jsp:include page="/layout/subHeader.jsp"></jsp:include>
<link rel="stylesheet" href="css/style.css">
<title>ƼŰŸī - ���� ����(02_01)</title>
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
					<h2>���� ����</h2>
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
	var url = 'http://openapi.seoul.go.kr:8088/63534673506d39363430425673634e/json/ListPublicReservationSport/1/7/�౸��/'
	xhr.open('GET', url);
	xhr.onreadystatechange = function () {
		if (this.readyState == xhr.DONE) { // <== ���������� �غ�Ǿ�����
			if(xhr.status == 200||xhr.status == 201){ // <== ȣ�� ���°� �������϶�
			/* console.log('Status: '+this.status+
			'\nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+
			'\nBody: '+this.responseText); */
			}
			console.log(JSON.parse(this.responseText).ListPublicReservationSport.row);
			for(var i=0; i<JSON.parse(this.responseText).ListPublicReservationSport.row.length; i++){
				if(JSON.parse(this.responseText).ListPublicReservationSport.row[i].SVCSTATNM == "������") {
					var date1S = (JSON.parse(this.responseText).ListPublicReservationSport.row[i].RCPTBGNDT.slice(0,10)).replaceAll('-', '.');
					var date1E = (JSON.parse(this.responseText).ListPublicReservationSport.row[i].RCPTENDDT.slice(0,10)).replaceAll('-', '.');
					var item = document.getElementById("ListWrap");
					// ���� ����Ʈ ���
					var row = '<li>'
					row += '<a href="'+JSON.parse(this.responseText).ListPublicReservationSport.row[i].SVCURL+'" target="_blank">'
					row += '<div class="imgBox">'
					row += '<div class="ib_top">'
					/* row += '<span class="status">������</span>' */
					if(JSON.parse(this.responseText).ListPublicReservationSport.row[i].PAYATNM == "����"){
						row += '<span class="type1">����</span>'
					}
					if(JSON.parse(this.responseText).ListPublicReservationSport.row[i].PAYATNM == "����"){
						row += '<span class="type2">����</span>'
					}
					row += '</div><img src="'+JSON.parse(this.responseText).ListPublicReservationSport.row[i].IMGURL+'" alt="��">'
					row += '</div>'
					row += '<div class="txtBox">'
					row += '<p class="name">'+JSON.parse(this.responseText).ListPublicReservationSport.row[i].SVCNM + '</p>'
					row += '<ul class="infoArea">'
					row += '<li><b class="place">��Ҹ�</b><div class="txt">'+JSON.parse(this.responseText).ListPublicReservationSport.row[i].PLACENM+'</div></li>'
					row += '<li><b class="user">�̿���</b><div class="txt">'+JSON.parse(this.responseText).ListPublicReservationSport.row[i].USETGTINFO+'</div></li>'
					row += '<li><b class="date">�����Ⱓ</b>'+date1S+' ~ '+date1E+'</li>'	
					row += '<li><b class="time">�̿�ð�</b>'+JSON.parse(this.responseText).ListPublicReservationSport.row[i].V_MIN+'~'+JSON.parse(this.responseText).ListPublicReservationSport.row[i].V_MAX+'</li>'
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