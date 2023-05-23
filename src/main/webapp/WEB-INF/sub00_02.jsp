<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <jsp:include page="/layout/header.jsp"></jsp:include>
    <title>티키타카 - 회원가입약관</title>
    <link rel="stylesheet" type="text/css" href="../css/pearl.css">
    <link rel="stylesheet" type="text/css" href="../css/sen.css">
</head>
<body>  
    <div class="container">
        <!-- wrap -->
        <div class="wrap">
            <div class="login_form">
                <div class="sub_title">
                    <h2>회원가입약관</h2>
                </div>
                        <form action="" id="joinForm">
                            <ul class="join_box">
                                <li class="checkBox check01">
                                    <ul class="clearfix">
                                        <li>서비스 이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</li>
                                        <li class="checkAllBtn">
                                            <input type="checkbox" name="chkAll" id="chkAll" class="chkAll"><label for="chkAll"><span></span></label>
                                        </li>
                                    </ul>
                                </li>
                                <li class="checkBox check02">
                                    <ul class="clearfix">
                                        <li>이용약관 동의(필수)</li>
                                        <li class="checkBtn">
                                            <input type="checkbox" class="chk" name="check" id="chk1"><label for="chk1"><span></span></label> 
                                        </li>
                                    </ul>
                                    <textarea name="" id="">  티키타카의 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 티키타카 서비스의 이용과 관련하여 티키타카 서비스를 제공하는 티키타카 주식회사(이하 '티키타카')와 이를 이용하는 티키타카 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 티키타카 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.</textarea>
                                </li>
                                <li class="checkBox check03">
                                    <ul class="clearfix">
                                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                                        <li class="checkBtn">
                                            <input type="checkbox" class="chk" name="check" id="ch2"><label for="ch2"><span></span></label>
                                        </li>
                                    </ul>
                                    <textarea name="" id="">  티키타카의 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 티키타카 서비스의 이용과 관련하여 티키타카 서비스를 제공하는 티키타카 주식회사(이하 '티키타카')와 이를 이용하는 티키타카 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 티키타카 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.</textarea>
                                </li>                                
                            </ul>
                            <ul class="footBtwrap clearfix">
                                <li><button class="fpmgBt1" type="button" onclick="reject()">비동의</button></li>
                                <li><button class="fpmgBt2" type="submit" onclick="sign(); return false;">동의</button></li>
                            </ul>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   
        $(document).ready(function(){
            //전체 체크박스 선택
            $("#chkAll").click(function() {
                if ($("#chkAll").prop("checked")) {
                    $(".chk").prop("checked", true);
                } else {
                    $(".chk").prop("checked", false);
                }
            });
            
            //전체 체크박스 선택중 체크박스 하나를 풀었을때 "전체" 체크해제
            $(".chk").click(function() {
                if ($("input[name='check']:checked").length == 2) {
                    $("#chkAll").prop("checked", true);
                } else {
                    $("#chkAll").prop("checked", false);
                }
            }); 
        });
        
        //버튼이벤트
       
        // 동의버튼 눌렀을 때
        function sign() {
       		if($("#chkAll").is(":checked")==true){
       			location.href="/join.do"
   	        } else {
   	        	alert("필수 약관에 동의하지 않으시면 서비스를 이용하실 수 없습니다.");
       		}
        }
        
        // 비동의버튼 눌렀을 때
        function reject() {
        	alert("약관에 동의하지 않으시면 서비스를 이용하실 수 없습니다.");
        	return;
        }
    
</script>
