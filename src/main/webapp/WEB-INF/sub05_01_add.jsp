<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/subHeader.jsp"></jsp:include>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/hong.css">
	<!-- 1. vue2editor 에디터 cdn -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
	<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<title>게시글 작성 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<!-- // container -->
		<div class="subContainer-wrap">
        <div class="box-visual">
            <div class="wrap">
                <div class="box-navigation">
                    <div class="links">
                        <a href="#" class="link">
                            <img src="../resources/images/home-gray.png" alt="">
                        </a>
                        <a href="#" class="link">
                            게시판
                        </a>
                        <a href="#" class="link point">
                            공지사항
                        </a>
                    </div>

                    <div class="bottom">
                        <h3 class="title">공지사항</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="subContainer">
            <div class="wrap">
                <!-- 컨텐츠 영역 -->

                <!-- 페이지 타이틀 -->
                <div class="sub-top-area">
                    <div class="page-title">
                        <h2>
                            공지사항 등록
                        </h2>
                        <p>
                            공지사항을 입력하세요.
                        </p>
                    </div>
                </div>
                <!-- // 페이지 타이틀 -->


                <div class="bbs-wrap">
                  <!-- s : write -->
                  <div class="tbl-group">
                    <div class="tbl tbl-write">
                      <table>
                        <caption>
                          <strong>제목 요약</strong>
                          <p>이 표는 셀제목1, 셀제목2, 셀제목3, 셀제목4 로 구성되었습니다.</p>
                        </caption>
                        <colgroup>
                          <col style="width:20%">
                          <col style="width:auto">
                        </colgroup>
                        <tbody>
                          <!-- s : 20210602 수정 익명여부 , 이름, 부서 컬럼 추가 -->
                        
                          <tr>
                            <th scope="row">제목</th>
                            <td class="col-subject">
                              <input type="text" id="cmtTitle" name="cmtTitle" v-model="cmtTitle">
                            </td>
                          </tr>

                          <tr>
                            <th scope="row">내용</th>
                            <td colspan="2">
							  <textarea id="cmCont" name="cmCont" v-model="cmCont"><pre></pre></textarea> 
                          </tr>
                          <tr>
                            <th scope="row">파일<br>첨부</th>
                            <td class="col-file">
                              <div class="form-controls vertical type-file">
                                <div>
								    <input type="file" id="file1" name="file1" > 
								</div>
                              </div>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <!-- e : write -->
    
                  <!-- btns -->
                  <div class="btns ac clearfix">
                    <div class="float-l">
                      <button @click="fnList" class="btn" style="float: right;">목록으로</button>
                    </div>
                    <div class="float-r">
                      <button @click="fnAddCm()" class="btn" style="float: right;">저장</button>
                    </div>
                  </div>
                </div>



            </div>


                <!-- 컨텐츠 영역 끝 -->
            </div>
        </div>
	</div>
</body>
</html>

<script type="text/javascript">
// 3. 뷰에 vue2editor 추가
console.log(Vue);
Vue.use(Vue2Editor);
const VueEditor = Vue2Editor.VueEditor;
var app = new Vue({ 
    el: '#app',
    data: {
		list : [],
		checkList : [],
		cmtTitle : "",
		cmCont : ""
    }   
    // 4. 컴포넌트 추가
    , components: {VueEditor}
    
    , methods: {
    	fnAddCm : function(){
            var self = this;
            var nparmap = {cmtTitle : self.cmtTitle, cmCont : self.cmCont};
            console.log(self.cmCont);
             $.ajax({
                url:"/no/add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("저장되었습니다.");
                	location.href="sub05_01";
                }
            });  
        }, fnList : function(){
			location.href="/sub05_01";
		}
    	// 파일 업로드
	    , upload : function(){
			var form = new FormData();
	        form.append( "file1", $("#file1")[0].files[0] );
	        
	         $.ajax({
	             url : "/upload.do"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) { 
	        	   
	           }
	           
	       });
		}
    }   
    , created: function () {
    	var self = this;
	}
});
</script>
