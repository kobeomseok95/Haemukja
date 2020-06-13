<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	Seller loginSeller = (Seller)session.getAttribute("loginSeller");
	String nCode = request.getParameter("nCode");
	
	String panelName = "";
	if(nCode != null && nCode.equals("AS")) {
		panelName = "아시아";
	} else if(nCode != null && nCode.equals("ASK")) {
		panelName = "한국";
	} else if(nCode != null && nCode.equals("ASC")) {
		panelName = "중국";
	} else if(nCode != null && nCode.equals("ASJ")) {
		panelName = "일본";
	} else if(nCode != null && nCode.equals("ASE")) {
		panelName = "기타 아시아";
	} else if(nCode != null && nCode.equals("EU")) {
		panelName = "유럽";
	} else if(nCode != null && nCode.equals("EUI")) {
		panelName = "이탈리아";
	} else if(nCode != null && nCode.equals("EUF")) {
		panelName = "프랑스";
	} else if(nCode != null && nCode.equals("EUS")) {
		panelName = "스페인";
	} else if(nCode != null && nCode.equals("EUE")) {
		panelName = "기타 유럽";
	} else if(nCode != null && nCode.equals("AM")) {
		panelName = "아메리카";
	} else if(nCode != null && nCode.equals("AMU")) {
		panelName = "미국";
	} else if(nCode != null && nCode.equals("AME")) {
		panelName = "기타 아메리카";
	} else if(nCode != null && nCode.equals("AF")) {
		panelName = "아프리카";
	} else if(nCode != null && nCode.equals("OC")) {
		panelName = "그 밖의 국가";
	} else {
		panelName = "검색 결과";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>레시피게시판</title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
  <script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
  <script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
  <script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
  
  <!-- Custom styles for this template -->
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
    integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
    crossorigin="anonymous"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
    integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
    crossorigin="anonymous"></script>
  
  <style>
  @import url(https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap);*{font-family:'Nanum Gothic',sans-serif;font-size:15px}.logo{height:80px}.list-group a{font-size:18px;font-weight:700}.list-group-item{border-style:none}.panel-heading{background-color:orange;text-align:center;line-height:50px;vertical-align:middle;color:#fff;font-size:20px;font-weight:700}#login{background-color:orange;text-align:center;width:150px;height:200px;border-radius:15px;position:fixed}#loginBtn{background-color:#323232;text-align:center;border:none;border-radius:3px;color:#fff}a{color:#000;text-decoration:none}a:hover{color:orange;text-decoration:none}button{background-color:#323232;text-align:center;border:none;border-radius:3px;color:#fff}footer{background-color:#e6e6e6;height:200px}.notice{background-color:#ffbfdd}#write{text-align:right}.btn{float:right;background-color:#323232;color:#fff}.shipInfoBox{display:none}.form-control{display:inline}.result{border-style:none}

    .tag {
      /* text-align: center; */
      background-color: rgb(230, 230, 230);
      width: 620px;
      padding: 5px;
      display: none;
    }
    
    .tagResultTable{
    	text-align: center;
    }
    
    .searchResultRow:hover{
    	cursor: pointer;
    	font-weight: bold;
    }
  </style>
  
</head>

<body>

  <!-- Navigation -->
  <%@ include file="../static/top.jsp"%>

  <!-- Page Content -->
  <div class="container">
    <div class="row">

      <div class="col-lg-2">
        <%@ include file="../static/sideMenu.jsp"%>
      </div>
      <!-- /.col-lg-2 -->

      <div class="col-lg-9">
        <!-- panel -->
        <div class="panel panel-default">
          <div class="panel-heading">&nbsp;<%=panelName %></div>
        </div>
        <br>
        <!-- /panel -->
        <div class="container">
          <div class="center-block">
            <form action="<%=request.getContextPath()%>/insert.re" method="post" enctype="multipart/form-data">
              <label for="title"><h5>제목 : </h5></label>
              <input type="text" name="title" style="width: 740px">
              <label for="thumbnail"><h5>썸네일 : </h5></label>
              <input type="file" id="thumbnail" name="a">
              <br><br>
              <h6 style="color: red; font-weight: bold">
                ※ 최대 10개까지 업로드 가능<br>태그는 이미지 하나당 최대 3개<br>썸네일은 반드시 등록해주세요 ※<br>
                (태그 거는 법 : 해당 판매글 번호 입력)
              </h6>
              <h5>1.</h5>
              <input type="file" id="image1" name="b"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" class="tag1" name="tag">
                <input type="text" class="tag2" name="tag">
                <input type="text" class="tag3" name="tag">
                <button type="button" class="modalBtn" data-target="#layerpop1" data-toggle="modal">태그검색</button>
                <div class="modal fade" id="layerpop1" >
				  <div class="modal-dialog">
					<div class="modal-content">
				      	<!-- header -->
						<div class="modal-header">
					        <!-- 닫기(x) 버튼 -->
					        태그 검색
					        <button type="button" class="close" data-dismiss="modal">×</button>
					        <!-- header title -->
				      	</div>
					    <!-- body -->
					    <div class="modal-body" align="center">
				            <input type="text" class="searchTagContent" name="searchTagContent">
				            <button type="button" class="searchTagBtn">검색</button>
				            <hr>
				            <div class="searchResult">
				    			<table class="tagResultTable">
				    				<thead class="tagResultTableHead">
				    					<tr>
				    						<th width="100px">번호</th>
				    						<th width="400px">제목</th>
				    						<th width="200px">판매처</th>
				    					</tr>
				    				</thead>
				    				<tbody class="tagResultTableBody">
				    					<!-- ajax 실행 후 추가 -->
				    				</tbody>
				    			</table>
				    		</div>
				      	</div>
				    </div>
				  </div>
				</div>
              </div>
              <textarea name="content" cols="110" rows="3"></textarea>
              <br><br>
              <h5>2.</h5>
              <input type="file" id="image2" name="c"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" class="tag1" name="tag">
                <input type="text" class="tag2" name="tag">
                <input type="text" class="tag3" name="tag">
                <button type="button" class="modalBtn" data-target="#layerpop2" data-toggle="modal">태그검색</button>
                <div class="modal fade" id="layerpop2" >
				  <div class="modal-dialog">
					<div class="modal-content">
				      	<!-- header -->
						<div class="modal-header">
					        <!-- 닫기(x) 버튼 -->
					        태그 검색
					        <button type="button" class="close" data-dismiss="modal">×</button>
					        <!-- header title -->
				      	</div>
					    <!-- body -->
					    <div class="modal-body" align="center">
				            <input type="text" class="searchTagContent" name="searchTagContent">
				            <button type="button" class="searchTagBtn">검색</button>
				            <hr>
				            <div class="searchResult">
				    			<table class="tagResultTable">
				    				<thead class="tagResultTableHead">
				    					<tr>
				    						<th width="100px">번호</th>
				    						<th width="400px">제목</th>
				    						<th width="200px">판매처</th>
				    					</tr>
				    				</thead>
				    				<tbody class="tagResultTableBody">
				    					<!-- ajax 실행 후 추가 -->
				    				</tbody>
				    			</table>
				    		</div>
				      	</div>
				    </div>
				  </div>
				</div>
              </div>
              <textarea name="content" cols="110" rows="3"></textarea>
              <br><br>
              <h5>3.</h5>
              <input type="file" id="image3" name="d"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" class="tag1" name="tag">
                <input type="text" class="tag2" name="tag">
                <input type="text" class="tag3" name="tag">
                <button type="button" class="modalBtn" data-target="#layerpop3" data-toggle="modal">태그검색</button>
                <div class="modal fade" id="layerpop3" >
				  <div class="modal-dialog">
					<div class="modal-content">
				      	<!-- header -->
						<div class="modal-header">
					        <!-- 닫기(x) 버튼 -->
					        태그 검색
					        <button type="button" class="close" data-dismiss="modal">×</button>
					        <!-- header title -->
				      	</div>
					    <!-- body -->
					    <div class="modal-body" align="center">
				            <input type="text" class="searchTagContent" name="searchTagContent">
				            <button type="button" class="searchTagBtn">검색</button>
				            <hr>
				            <div class="searchResult">
				    			<table class="tagResultTable">
				    				<thead class="tagResultTableHead">
				    					<tr>
				    						<th width="100px">번호</th>
				    						<th width="400px">제목</th>
				    						<th width="200px">판매처</th>
				    					</tr>
				    				</thead>
				    				<tbody class="tagResultTableBody">
				    					<!-- ajax 실행 후 추가 -->
				    				</tbody>
				    			</table>
				    		</div>
				      	</div>
				    </div>
				  </div>
				</div>
              </div>
              <textarea name="content" cols="110" rows="3"></textarea>
              <br><br>
              <h5>4.</h5>
              <input type="file" id="image4" name="e"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" class="tag1" name="tag">
                <input type="text" class="tag2" name="tag">
                <input type="text" class="tag3" name="tag">
                <button type="button" class="modalBtn" data-target="#layerpop4" data-toggle="modal">태그검색</button>
                <div class="modal fade" id="layerpop4" >
				  <div class="modal-dialog">
					<div class="modal-content">
				      	<!-- header -->
						<div class="modal-header">
					        <!-- 닫기(x) 버튼 -->
					        태그 검색
					        <button type="button" class="close" data-dismiss="modal">×</button>
					        <!-- header title -->
				      	</div>
					    <!-- body -->
					    <div class="modal-body" align="center">
				            <input type="text" class="searchTagContent" name="searchTagContent">
				            <button type="button" class="searchTagBtn">검색</button>
				            <hr>
				            <div class="searchResult">
				    			<table class="tagResultTable">
				    				<thead class="tagResultTableHead">
				    					<tr>
				    						<th width="100px">번호</th>
				    						<th width="400px">제목</th>
				    						<th width="200px">판매처</th>
				    					</tr>
				    				</thead>
				    				<tbody class="tagResultTableBody">
				    					<!-- ajax 실행 후 추가 -->
				    				</tbody>
				    			</table>
				    		</div>
				      	</div>
				    </div>
				  </div>
				</div>
              </div>
              <textarea name="content" cols="110" rows="3"></textarea>
              <br><br>
              <h5>5.</h5>
              <input type="file" id="image5" name="f"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" class="tag1" name="tag">
                <input type="text" class="tag2" name="tag">
                <input type="text" class="tag3" name="tag">
                <button type="button" class="modalBtn" data-target="#layerpop5" data-toggle="modal">태그검색</button>
                <div class="modal fade" id="layerpop5" >
				  <div class="modal-dialog">
					<div class="modal-content">
				      	<!-- header -->
						<div class="modal-header">
					        <!-- 닫기(x) 버튼 -->
					        태그 검색
					        <button type="button" class="close" data-dismiss="modal">×</button>
					        <!-- header title -->
				      	</div>
					    <!-- body -->
					    <div class="modal-body" align="center">
				            <input type="text" class="searchTagContent" name="searchTagContent">
				            <button type="button" class="searchTagBtn">검색</button>
				            <hr>
				            <div class="searchResult">
				    			<table class="tagResultTable">
				    				<thead class="tagResultTableHead">
				    					<tr>
				    						<th width="100px">번호</th>
				    						<th width="400px">제목</th>
				    						<th width="200px">판매처</th>
				    					</tr>
				    				</thead>
				    				<tbody class="tagResultTableBody">
				    					<!-- ajax 실행 후 추가 -->
				    				</tbody>
				    			</table>
				    		</div>
				      	</div>
				    </div>
				  </div>
				</div>
              </div>
              <textarea name="content" cols="110" rows="3"></textarea>
              <br><br>
              <h5>6.</h5>
              <input type="file" id="image6" name="g"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" class="tag1" name="tag">
                <input type="text" class="tag2" name="tag">
                <input type="text" class="tag3" name="tag">
                <button type="button" class="modalBtn" data-target="#layerpop6" data-toggle="modal">태그검색</button>
                <div class="modal fade" id="layerpop6" >
				  <div class="modal-dialog">
					<div class="modal-content">
				      	<!-- header -->
						<div class="modal-header">
					        <!-- 닫기(x) 버튼 -->
					        태그 검색
					        <button type="button" class="close" data-dismiss="modal">×</button>
					        <!-- header title -->
				      	</div>
					    <!-- body -->
					    <div class="modal-body" align="center">
				            <input type="text" class="searchTagContent" name="searchTagContent">
				            <button type="button" class="searchTagBtn">검색</button>
				            <hr>
				            <div class="searchResult">
				    			<table class="tagResultTable">
				    				<thead class="tagResultTableHead">
				    					<tr>
				    						<th width="100px">번호</th>
				    						<th width="400px">제목</th>
				    						<th width="200px">판매처</th>
				    					</tr>
				    				</thead>
				    				<tbody class="tagResultTableBody">
				    					<!-- ajax 실행 후 추가 -->
				    				</tbody>
				    			</table>
				    		</div>
				      	</div>
				    </div>
				  </div>
				</div>
              </div>
              <textarea name="content" cols="110" rows="3"></textarea>
              <br><br>
              <h5>7.</h5>
              <input type="file" id="image7" name="h"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" class="tag1" name="tag">
                <input type="text" class="tag2" name="tag">
                <input type="text" class="tag3" name="tag">
                <button type="button" class="modalBtn" data-target="#layerpop7" data-toggle="modal">태그검색</button>
                <div class="modal fade" id="layerpop7" >
				  <div class="modal-dialog">
					<div class="modal-content">
				      	<!-- header -->
						<div class="modal-header">
					        <!-- 닫기(x) 버튼 -->
					        태그 검색
					        <button type="button" class="close" data-dismiss="modal">×</button>
					        <!-- header title -->
				      	</div>
					    <!-- body -->
					    <div class="modal-body" align="center">
				            <input type="text" class="searchTagContent" name="searchTagContent">
				            <button type="button" class="searchTagBtn">검색</button>
				            <hr>
				            <div class="searchResult">
				    			<table class="tagResultTable">
				    				<thead class="tagResultTableHead">
				    					<tr>
				    						<th width="100px">번호</th>
				    						<th width="400px">제목</th>
				    						<th width="200px">판매처</th>
				    					</tr>
				    				</thead>
				    				<tbody class="tagResultTableBody">
				    					<!-- ajax 실행 후 추가 -->
				    				</tbody>
				    			</table>
				    		</div>
				      	</div>
				    </div>
				  </div>
				</div>
              </div>
              <textarea name="content" cols="110" rows="3"></textarea>
              <br><br>
              <h5>8.</h5>
              <input type="file" id="image8" name="i"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" class="tag1" name="tag">
                <input type="text" class="tag2" name="tag">
                <input type="text" class="tag3" name="tag">
                <button type="button" class="modalBtn" data-target="#layerpop8" data-toggle="modal">태그검색</button>
                <div class="modal fade" id="layerpop8" >
				  <div class="modal-dialog">
					<div class="modal-content">
				      	<!-- header -->
						<div class="modal-header">
					        <!-- 닫기(x) 버튼 -->
					        태그 검색
					        <button type="button" class="close" data-dismiss="modal">×</button>
					        <!-- header title -->
				      	</div>
					    <!-- body -->
					    <div class="modal-body" align="center">
				            <input type="text" class="searchTagContent" name="searchTagContent">
				            <button type="button" class="searchTagBtn">검색</button>
				            <hr>
				            <div class="searchResult">
				    			<table class="tagResultTable">
				    				<thead class="tagResultTableHead">
				    					<tr>
				    						<th width="100px">번호</th>
				    						<th width="400px">제목</th>
				    						<th width="200px">판매처</th>
				    					</tr>
				    				</thead>
				    				<tbody class="tagResultTableBody">
				    					<!-- ajax 실행 후 추가 -->
				    				</tbody>
				    			</table>
				    		</div>
				      	</div>
				    </div>
				  </div>
				</div>
              </div>
              <textarea name="content" cols="110" rows="3"></textarea>
              <br><br>
              <h5>9.</h5>
              <input type="file" id="image9" name="j"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" class="tag1" name="tag">
                <input type="text" class="tag2" name="tag">
                <input type="text" class="tag3" name="tag">
                <button type="button" class="modalBtn" data-target="#layerpop9" data-toggle="modal">태그검색</button>
                <div class="modal fade" id="layerpop9" >
				  <div class="modal-dialog">
					<div class="modal-content">
				      	<!-- header -->
						<div class="modal-header">
					        <!-- 닫기(x) 버튼 -->
					        태그 검색
					        <button type="button" class="close" data-dismiss="modal">×</button>
					        <!-- header title -->
				      	</div>
					    <!-- body -->
					    <div class="modal-body" align="center">
				            <input type="text" class="searchTagContent" name="searchTagContent">
				            <button type="button" class="searchTagBtn">검색</button>
				            <hr>
				            <div class="searchResult">
				    			<table class="tagResultTable">
				    				<thead class="tagResultTableHead">
				    					<tr>
				    						<th width="100px">번호</th>
				    						<th width="400px">제목</th>
				    						<th width="200px">판매처</th>
				    					</tr>
				    				</thead>
				    				<tbody class="tagResultTableBody">
				    					<!-- ajax 실행 후 추가 -->
				    				</tbody>
				    			</table>
				    		</div>
				      	</div>
				    </div>
				  </div>
				</div>
              </div>
              <textarea name="content" cols="110" rows="3"></textarea>
              <br><br>
              <h5>10.</h5>
              <input type="file" id="image10" name="k"><button type="button" class="tagBtn">태그달기</button>
              <div class="tag">
                <input type="text" class="tag1" name="tag">
                <input type="text" class="tag2" name="tag">
                <input type="text" class="tag3" name="tag">
                <button type="button" class="modalBtn" data-target="#layerpop10" data-toggle="modal">태그검색</button>
                <div class="modal fade" id="layerpop10" >
				  <div class="modal-dialog">
					<div class="modal-content">
				      	<!-- header -->
						<div class="modal-header">
					        <!-- 닫기(x) 버튼 -->
					        태그 검색
					        <button type="button" class="close" data-dismiss="modal">×</button>
					        <!-- header title -->
				      	</div>
					    <!-- body -->
					    <div class="modal-body" align="center">
				            <input type="text" class="searchTagContent" name="searchTagContent">
				            <button type="button" class="searchTagBtn">검색</button>
				            <hr>
				            <div class="searchResult">
				    			<table class="tagResultTable">
				    				<thead class="tagResultTableHead">
				    					<tr>
				    						<th width="100px">번호</th>
				    						<th width="400px">제목</th>
				    						<th width="200px">판매처</th>
				    					</tr>
				    				</thead>
				    				<tbody class="tagResultTableBody">
				    					<!-- ajax 실행 후 추가 -->
				    				</tbody>
				    			</table>
				    		</div>
				      	</div>
				    </div>
				  </div>
				</div>
              </div>
              <textarea name="content" cols="110" rows="3"></textarea>
              <br><br><br>
              <input type="hidden" name="nCode" value="<%= nCode %>">
              <button type="submit" class="btn">저장</button>
            </form>
          </div>
        </div>
      </div>
      <!-- /.col-lg-9 -->
      <!-- /.col-lg-9 -->
      <div class="col-lg-1">
         <%if(loginMember != null && loginSeller == null) { %>
        <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
             <%=loginMember.getMnickname() %><br>반갑습니다!<br><br>
          <a href="sellerpage_register.html" style="color: white; margin-bottom: 10px;">마이페이지</a>
          <br>
          <button type="button" id="loginBtn" onclick="logout();">로그아웃</button>
        </div>
        <%} else if (loginMember == null && loginSeller != null){ %>
          <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
             <%=loginSeller.getCompany() %><br>반갑습니다!<br><br>
          <a href="#" style="color: white; margin-bottom: 10px;"
          	onclick="location.href='<%=request.getContextPath()%>/seller/sellerPageInsert.jsp'">판매관리페이지</a>
          <br>
          <button type="button" id="loginBtn" onclick="logout();">로그아웃</button>
        </div>
      <%} else if (loginMember == null && loginSeller == null) { %>
        <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
             <button onclick="login();">로그인</button>
        </div>
        <%} else { %>
        <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
             <button onclick="login();">로그인</button>
        </div>   
        <%}%>
        <script> // 두 계정이 혹시나 모두 로그인 되어있다면 로그아웃 시켜주기
           $(function(){
              <%if (loginMember != null && loginSeller != null) {%>
                 alert('두 계정이 접속되어 로그아웃 작업이 진행됩니다.');
                 logout();
              <%}%>              
           });
        </script>
      </div>
    <!-- /.row -->
	</div>
  </div>
  <!-- /.container -->
  <br><br>
  <!-- footer -->
  <%@ include file="../static/bottom.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath() %>/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath() %>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <script>
    $(function(){
      $(".tagBtn").click(function(){
        $(this).next().toggle();
      });
      
      $(document).on("click",".searchResultRow",function(){
    	  var tag = $(this).find(".sbNo").html();
    	  var tag1 = $(this).parents(".tag").find(".tag1").val();
    	  var tag2 = $(this).parents(".tag").find(".tag2").val();
    	  var tag3 = $(this).parents(".tag").find(".tag3").val();
    	  
    	  if(tag1 == "") {
    		  $(this).parents(".tag").find(".tag1").val(tag);
    	  } else if(tag2 == "") {
    		  $(this).parents(".tag").find(".tag2").val(tag);
    	  } else {
    		  $(this).parents(".tag").find(".tag3").val(tag);
    	  }
    	  
    	  $(".tagResultTableBody").html("");
    	  $('.modal').modal("hide");
    	  $(".modal-backdrop").remove();
      });
      
      $(".searchTagBtn").click(function(){
    	  var tag = $(this).parent().find(".searchTagContent").val();
    	  
    	  $.ajax({
    		url:"<%=request.getContextPath()%>/search.sa",
    		type:"get",
    		data:{tag:tag},
      		  success:function(data) {
      			$tagResultTable = $(".tagResultTableBody");
      			$tagResultTable.html("");
      			
      			for(var key in data) {
      				var $tr = $("<tr class='searchResultRow'>");
      				var $noTd = $("<td class='sbNo'>").text(data[key].sbNo).css("width","100px");
      				var $titleTd = $("<td class='sbTitle'>").text(data[key].sbTitle).css("width","400px");
      				var $writerTd = $("<td class='company'>").text(data[key].company).css("width","200px");

      				$tr.append($noTd);
      				$tr.append($titleTd);
      				$tr.append($writerTd);
      				$tagResultTable.append($tr);
      			}
      			
      			$(".searchTagContent").val("");
      		},
      		error:function(data) {
      			console.log("ajax 실패");
      		}
    	  })
      });
    });
    
    function login(){
  		location.href="<%=request.getContextPath()%>/member/loginHaemukja.jsp";
  	}
  	function logout(){
  		location.href="<%=request.getContextPath()%>/logout.me";
  	}
  	
  </script>

</body>
</html>