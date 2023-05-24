<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/subHeader.jsp"></jsp:include>
<title>티키타카 - 소통게시판(05_02)</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/common.css">

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<!-- 페이징 추가 1-->
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>

</head>
<style>
</style>
<body>
	<div id="app">
		<!-- // container -->
		<div class="subContainer-wrap">
			<h2>게시판 수정</h2>
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
                            게시판 수정
                        </h2>
                        <p>
                            수정할 내용을 입력해 주세요.
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
                              <input type="text" id="cmTitle" name="cmTitle" v-model="info.cmTitle">
                            </td>
                          </tr>

                          <tr>
                            <th scope="row">내용</th>
                            <td colspan="2">
							  <textarea id="cmCont" name="cmCont" v-model="info.cmCont"><pre></pre></textarea> 
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
                      <button @click="fnList" class="btn-outline" style="float: right;">목록으로</button>
                    </div>
                    <div class="float-r">
                      <button @click="fnEditCm()" class="btn-fill" style="float: right;">저장</button>
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

Vue.use(Vue2Editor);
const VueEditor = Vue2Editor.VueEditor;
var app = new Vue({ 
    el: '#app',
    data: {
    	info : {}
		, cmNo : "${map.cmNo}"

    }   
    // 4. 컴포넌트 추가
    , components: {VueEditor}
    
    , methods: {
    	fnEditCm : function(){
            var self = this;
            var nparmap = {cmTitle : self.info.cmTitle
            				, cmCont : self.info.cmCont
            				, cmNo : self.cmNo};
            console.log(self.cmCont);
             $.ajax({
                url:"/cm/edit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("저장되었습니다.");
                	location.href="sub05_02";
                }
            });  
        }, 
        	fnGetBoard : function(){
            var self = this;
            var nparmap = {cmNo : self.cmNo}; 
            $.ajax({
                url:"/read.dox", 
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {  
                    self.info = data.info;
                    console.log(self.info);
                }
            }); 
        }
    	, fnList : function(){
			location.href="/sub05_02";
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
    	self.fnGetBoard();
	}
});
</script>