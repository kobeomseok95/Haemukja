<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, member.model.vo.*, recipe.model.vo.*, common.Attachment"%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	Seller loginSeller = (Seller)session.getAttribute("loginSeller");
	Recipe recipe = (Recipe)request.getAttribute("recipe");
	ArrayList<String> contents = (ArrayList<String>)request.getAttribute("contents");
	ArrayList<Attachment> files = (ArrayList<Attachment>)request.getAttribute("files");
	ArrayList<Tag> tags = (ArrayList<Tag>)request.getAttribute("tags");
	Attachment thumbnail = (Attachment)request.getAttribute("thumbnail");
	
	int bNo = recipe.getbNo();
	String nickname = (String)request.getAttribute("nickname");
	
	String loginId = "";
	if(loginMember != null) {
		loginId = loginMember.getMid();	
	}
	
	String nCode = recipe.getnCode();
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
 
    .imageArea {
      width: 525px;
      height: 300px;
    }
    .image {
      width: 100%;
      max-width: 525px;
      max-height: 300px;
      vertical-align: middle;
      cursor: pointer;
    }
    .no {
      color: green;
      font-size: 30px;
      font-weight: bold;
    }
    
    .tagResult {
      background-color: rgb(230, 230, 230);
      width: 620px;
      padding: 5px;
    }

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
    
    #thumbnailArea{
    	padding: 10px;
    	width: 550px;
    	height: 350px;
    	background: orange;
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
        <!-- table -->
        <table class="table" style="text-align: center;">
          <thead>
            <tr>
              <th style="width: 100px;">번호</th>
              <th style="width: 300px;">제목</th>
              <th style="width: 100px;">작성자</th>
              <th style="width: 100px;">작성일자</th>
              <th style="width: 70px;">조회수</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td style="width: 100px;"><%= recipe.getbNo() %></td>
              <td style="width: 300px;"><%= recipe.getbTitle() %></td>
              <td style="width: 100px;"><%= nickname %></td>
              <td style="width: 100px;"><%= recipe.getbDate() %></td>
              <td style="width: 70px;"><%= recipe.getbViews() %></td>
            </tr>
            <tr>
              <td colspan='5' align="center">
              	<form action="<%=request.getContextPath()%>/update.re" method="post" enctype="multipart/form-data">
              	  <input type="hidden" value="<%= recipe.getbNo() %>" name="bNo">
	              <label for="title"><h5>제목 : </h5></label>
	              <input type="text" name="title" style="width: 740px">
	              <label for="thumbnail"><h5>썸네일 : </h5></label><br>
	              <div id="thumbnailArea">
		              <img src="<%= request.getContextPath() %>/uploadFiles/<%= thumbnail.getFileName() %>" class="image">
		              <input type="hidden" name="thumbnail" class="aId" value="<%= thumbnail.getaId() %>">
		              <input type="file" id="thumbnail" name="a" class="insertImage">
		              <input type="hidden" class="checkChange" value="" name="aId">	              
	              </div>
	              <br><br><br><br>
	              
	              <h5>1.</h5>
	              <% if(files.size() > 0) { %>
	              	<img src="<%= request.getContextPath() %>/uploadFiles/<%= files.get(0).getFileName() %>" class="image">
	              	<input type="hidden" name="image1" value="<%= files.get(0).getaId() %>">	              
	              <% } %>
	              <input type="file" id="image1" name="b" class="insertImage">
	              <input type="hidden" class="checkChange" value="" name="aId">
	              <h6 style="color: red; font-weight: bold">※이미지 변경시 태그를 새로 달아주세요.※</h6>
	              <div class="tagResult">
	              <% for(int i = 0; i < tags.size(); i ++) { %>
					<% if(files.size() > 0 && tags.get(i).getaId() == files.get(0).getaId()) { %>
						<input type="text" value="<%=tags.get(i).getTag() %>" readonly>
					<% } %>
	              <% } %>	              
	              </div>
	              <button type="button" class="tagBtn">태그달기</button>
	              <div class="tag">
	              	<input type="text" class="tag1" name="tag">
	              	<input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag2" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag3" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
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
	              <% if(files.size() > 0) { %>
	              	<textarea name="content" cols="110" rows="3"><%= contents.get(0) %></textarea>
	              <% } else { %>
	              	<textarea name="content" cols="110" rows="3"></textarea>
	              <% } %>
	              <br><br>
	              
	              <h5>2.</h5>
	              <% if(files.size() > 1) { %>
	              	<img src="<%= request.getContextPath() %>/uploadFiles/<%= files.get(1).getFileName() %>" class="image">
	              	<input type="hidden" name="image2" value="<%= files.get(1).getaId() %>">	              
	              <% } %>
	              <input type="file" id="image2" name="c" class="insertImage">
	              <input type="hidden" class="checkChange" value="" name="aId">
	              <h6 style="color: red; font-weight: bold">※이미지 변경시 태그를 새로 달아주세요.※</h6>
	              <div class="tagResult">
	              <% for(int i = 0; i < tags.size(); i ++) { %>
					<% if(files.size() > 1 && tags.get(i).getaId() == files.get(1).getaId()) { %>
						<input type="text" value="<%=tags.get(i).getTag() %>" readonly>
					<% } %>
	              <% } %>	              
	              </div>
	              <button type="button" class="tagBtn">태그달기</button>
	              <div class="tag">
	              	<input type="text" class="tag1" name="tag">
	              	<input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag2" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag3" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
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
	              <% if(files.size() > 1) { %>
	              	<textarea name="content" cols="110" rows="3"><%= contents.get(1) %></textarea>
	              <% } else { %>
	              	<textarea name="content" cols="110" rows="3"></textarea>
	              <% } %>
	              <br><br>
	              
	              <h5>3.</h5>
	              <% if(files.size() > 2) { %>
	              	<img src="<%= request.getContextPath() %>/uploadFiles/<%= files.get(2).getFileName() %>" class="image">
	              	<input type="hidden" name="image3" value="<%= files.get(2).getaId() %>">	              
	              <% } %>
	              <input type="file" id="image3" name="d" class="insertImage">
	              <input type="hidden" class="checkChange" value="" name="aId">
	              <h6 style="color: red; font-weight: bold">※이미지 변경시 태그를 새로 달아주세요.※</h6>
	              <div class="tagResult">
	              <% for(int i = 0; i < tags.size(); i ++) { %>
					<% if(files.size() > 2 && tags.get(i).getaId() == files.get(2).getaId()) { %>
						<input type="text" value="<%=tags.get(i).getTag() %>" readonly>
					<% } %>
	              <% } %>	              
	              </div>
	              <button type="button" class="tagBtn">태그달기</button>
	              <div class="tag">
	              	<input type="text" class="tag1" name="tag">
	              	<input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag2" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag3" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
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
	              <% if(files.size() > 2) { %>
	              	<textarea name="content" cols="110" rows="3"><%= contents.get(2) %></textarea>
	              <% } else { %>
	              	<textarea name="content" cols="110" rows="3"></textarea>
	              <% } %>
	              <br><br>
	              
	              <h5>4.</h5>
	              <% if(files.size() > 3) { %>
	              	<img src="<%= request.getContextPath() %>/uploadFiles/<%= files.get(3).getFileName() %>" class="image">
	              	<input type="hidden" name="image4" value="<%= files.get(3).getaId() %>">	              
	              <% } %>
	              <input type="file" id="image4" name="e" class="insertImage">
	              <input type="hidden" class="checkChange" value="" name="aId">
	              <h6 style="color: red; font-weight: bold">※이미지 변경시 태그를 새로 달아주세요.※</h6>
	              <div class="tagResult">
	              <% for(int i = 0; i < tags.size(); i ++) { %>
					<% if(files.size() > 3 && tags.get(i).getaId() == files.get(3).getaId()) { %>
						<input type="text" value="<%=tags.get(i).getTag() %>" readonly>
					<% } %>
	              <% } %>	              
	              </div>
	              <button type="button" class="tagBtn">태그달기</button>
	              <div class="tag">
	              	<input type="text" class="tag1" name="tag">
	              	<input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag2" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag3" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
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
	              <% if(files.size() > 3) { %>
	              	<textarea name="content" cols="110" rows="3"><%= contents.get(3) %></textarea>
	              <% } else { %>
	              	<textarea name="content" cols="110" rows="3"></textarea>
	              <% } %>
	              <br><br>
	              
	              <h5>5.</h5>
	              <% if(files.size() > 4) { %>
	              	<img src="<%= request.getContextPath() %>/uploadFiles/<%= files.get(4).getFileName() %>" class="image">
	              	<input type="hidden" name="image5" value="<%= files.get(4).getaId() %>">	              
	              <% } %>
	              <input type="file" id="image5" name="f" class="insertImage">
	              <input type="hidden" class="checkChange" value="" name="aId">
	              <h6 style="color: red; font-weight: bold">※이미지 변경시 태그를 새로 달아주세요.※</h6>
	              <div class="tagResult">
	              <% for(int i = 0; i < tags.size(); i ++) { %>
					<% if(files.size() > 4 && tags.get(i).getaId() == files.get(4).getaId()) { %>
						<input type="text" value="<%=tags.get(i).getTag() %>" readonly>
					<% } %>
	              <% } %>	              
	              </div>
	              <button type="button" class="tagBtn">태그달기</button>
	              <div class="tag">
	              	<input type="text" class="tag1" name="tag">
	              	<input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag2" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag3" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
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
	              <% if(files.size() > 4) { %>
	              	<textarea name="content" cols="110" rows="3"><%= contents.get(4) %></textarea>
	              <% } else { %>
	              	<textarea name="content" cols="110" rows="3"></textarea>
	              <% } %>
	              <br><br>
	              
	              <h5>6.</h5>
	              <% if(files.size() > 5) { %>
	              	<img src="<%= request.getContextPath() %>/uploadFiles/<%= files.get(5).getFileName() %>" class="image">
	              	<input type="hidden" name="image6" value="<%= files.get(5).getaId() %>">	              
	              <% } %>
	              <input type="file" id="image6" name="g" class="insertImage">
	              <input type="hidden" class="checkChange" value="" name="aId">
	              <h6 style="color: red; font-weight: bold">※이미지 변경시 태그를 새로 달아주세요.※</h6>
	              <div class="tagResult">
	              <% for(int i = 0; i < tags.size(); i ++) { %>
					<% if(files.size() > 5 && tags.get(i).getaId() == files.get(5).getaId()) { %>
						<input type="text" value="<%=tags.get(i).getTag() %>" readonly>
					<% } %>
	              <% } %>	              
	              </div>
	              <button type="button" class="tagBtn">태그달기</button>
	              <div class="tag">
	              	<input type="text" class="tag1" name="tag">
	              	<input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag2" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag3" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
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
	              <% if(files.size() > 5) { %>
	              	<textarea name="content" cols="110" rows="3"><%= contents.get(5) %></textarea>
	              <% } else { %>
	              	<textarea name="content" cols="110" rows="3"></textarea>
	              <% } %>
	              <br><br>
	              
	              <h5>7.</h5>
	              <% if(files.size() > 6) { %>
	              	<img src="<%= request.getContextPath() %>/uploadFiles/<%= files.get(6).getFileName() %>" class="image">
	              	<input type="hidden" name="image7" value="<%= files.get(6).getaId() %>">	              
	              <% } %>
	              <input type="file" id="image7" name="h" class="insertImage">
	              <input type="hidden" class="checkChange" value="" name="aId">
	              <h6 style="color: red; font-weight: bold">※이미지 변경시 태그를 새로 달아주세요.※</h6>
	              <div class="tagResult">
	              <% for(int i = 0; i < tags.size(); i ++) { %>
					<% if(files.size() > 6 && tags.get(i).getaId() == files.get(6).getaId()) { %>
						<input type="text" value="<%=tags.get(i).getTag() %>" readonly>
					<% } %>
	              <% } %>	              
	              </div>
	              <button type="button" class="tagBtn">태그달기</button>
	              <div class="tag">
	              	<input type="text" class="tag1" name="tag">
	              	<input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag2" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag3" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
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
	              <% if(files.size() > 6) { %>
	              	<textarea name="content" cols="110" rows="3"><%= contents.get(6) %></textarea>
	              <% } else { %>
	              	<textarea name="content" cols="110" rows="3"></textarea>
	              <% } %>
	              <br><br>
	              
	              <h5>8.</h5>
	              <% if(files.size() > 7) { %>
	              	<img src="<%= request.getContextPath() %>/uploadFiles/<%= files.get(7).getFileName() %>" class="image">
	              	<input type="hidden" name="image8" value="<%= files.get(7).getaId() %>">	              
	              <% } %>
	              <input type="file" id="image8" name="i" class="insertImage">
	              <input type="hidden" class="checkChange" value="" name="aId">
	              <h6 style="color: red; font-weight: bold">※이미지 변경시 태그를 새로 달아주세요.※</h6>
	              <div class="tagResult">
	              <% for(int i = 0; i < tags.size(); i ++) { %>
					<% if(files.size() > 7 && tags.get(i).getaId() == files.get(7).getaId()) { %>
						<input type="text" value="<%=tags.get(i).getTag() %>" readonly>
					<% } %>
	              <% } %>	              
	              </div>
	              <button type="button" class="tagBtn">태그달기</button>
	              <div class="tag">
	              	<input type="text" class="tag1" name="tag">
	              	<input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag2" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag3" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
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
	              <% if(files.size() > 7) { %>
	              	<textarea name="content" cols="110" rows="3"><%= contents.get(7) %></textarea>
	              <% } else { %>
	              	<textarea name="content" cols="110" rows="3"></textarea>
	              <% } %>
	              <br><br>
	              
	              <h5>9.</h5>
	              <% if(files.size() > 8) { %>
	              	<img src="<%= request.getContextPath() %>/uploadFiles/<%= files.get(8).getFileName() %>" class="image">
	              	<input type="hidden" name="image9" value="<%= files.get(8).getaId() %>">	              
	              <% } %>
	              <input type="file" id="image9" name="j" class="insertImage">
	              <input type="hidden" class="checkChange" value="" name="aId">
	              <h6 style="color: red; font-weight: bold">※이미지 변경시 태그를 새로 달아주세요.※</h6>
	              <div class="tagResult">
	              <% for(int i = 0; i < tags.size(); i ++) { %>
					<% if(files.size() > 8 && tags.get(i).getaId() == files.get(8).getaId()) { %>
						<input type="text" value="<%=tags.get(i).getTag() %>" readonly>
					<% } %>
	              <% } %>	              
	              </div>
	              <button type="button" class="tagBtn">태그달기</button>
	              <div class="tag">
	              	<input type="text" class="tag1" name="tag">
	              	<input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag2" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag3" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
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
	              <% if(files.size() > 8) { %>
	              	<textarea name="content" cols="110" rows="3"><%= contents.get(8) %></textarea>
	              <% } else { %>
	              	<textarea name="content" cols="110" rows="3"></textarea>
	              <% } %>
	              <br><br>
	              
	              <h5>10.</h5>
	              <% if(files.size() > 9) { %>
	              	<img src="<%= request.getContextPath() %>/uploadFiles/<%= files.get(9).getFileName() %>" class="image">
	              	<input type="hidden" name="image10" value="<%= files.get(9).getaId() %>">	              
	              <% } %>
	              <input type="file" id="image10" name="k" class="insertImage">
	              <input type="hidden" class="checkChange" value="" name="aId">
	              <h6 style="color: red; font-weight: bold">※이미지 변경시 태그를 새로 달아주세요.※</h6>
	              <div class="tagResult">
	              <% for(int i = 0; i < tags.size(); i ++) { %>
					<% if(files.size() > 9 && tags.get(i).getaId() == files.get(9).getaId()) { %>
						<input type="text" value="<%=tags.get(i).getTag() %>" readonly>
					<% } %>
	              <% } %>	              
	              </div>
	              <button type="button" class="tagBtn">태그달기</button>
	              <div class="tag">
	              	<input type="text" class="tag1" name="tag">
	              	<input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag2" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
	                <input type="text" class="tag3" name="tag">
	                <input type="hidden" class="tagAId" value="" name="tagAId">
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
	              <% if(files.size() > 9) { %>
	              	<textarea name="content" cols="110" rows="3"><%= contents.get(9) %></textarea>
	              <% } else { %>
	              	<textarea name="content" cols="110" rows="3"></textarea>
	              <% } %>
	              <br><br>
	              
	              <input type="hidden" name="nCode" value="<%= nCode %>">
	              <button type="submit" class="btn">저장</button>
	            </form>
              </td>
            </tr>
          </tbody>
        </table>
        <br><br>
        <br><br>
        <div class="row">
          <div class="col-md-12" align="left">
            <button type="button" onclick="goBack();">목록으로</button>
          </div>
        </div>
        <br><br>
      </div>
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
    </div>
    <!-- /.row -->
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
    		var value = $(this).prev().prev().prev().prev().prev().val();
    		if(value != "") {
            	$(this).next().toggle();    			
    		} else {
    			alert("기존 이미지가 없을 경우 태그 수정은 불가능 합니다. 저장 후 태그를 추가해주세요.");
    		}
        });
    	
    	$(".insertImage").change(function(){
    		var value = $(this).prev().val();
    		$(this).next().val(value);
    	});
    	
    	$(".tag1").focus(function(){
    		var check = $(this).val();
    		if(check != "") {
    			var value = $(this).parent().prev().prev().prev().prev().val();
    			$(this).next().val(value);
    		}
    	});
    	
    	$(".tag2").focus(function(){
    		var check = $(this).val();
    		if(check != "") {
    			var value = $(this).prev().val();
    			$(this).next().val(value);
    		}
    	});
    	
    	$(".tag3").focus(function(){
    		var check = $(this).val();
    		if(check != "") {
    			var value = $(this).prev().val();
    			$(this).next().val(value);
    		}
    	});
    	
    	$(document).on("click",".searchResultRow",function(){
      	  var tag = $(this).find(".sbNo").html();
      	  var tag1 = $(this).parents(".tag").find(".tag1").val();
      	  var tag2 = $(this).parents(".tag").find(".tag2").val();
      	  var tag3 = $(this).parents(".tag").find(".tag3").val();
      	  
      	  if(tag1 == "") {
      		  $(this).parents(".tag").find(".tag1").val(tag);
      		  $(this).parents(".tag").find(".tag1").focus();
      	  } else if(tag2 == "") {
      		  $(this).parents(".tag").find(".tag2").val(tag);
      		  $(this).parents(".tag").find(".tag2").focus();
      	  } else {
      		  $(this).parents(".tag").find(".tag3").val(tag);
      		  $(this).parents(".tag").find(".tag3").focus();
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
  	
  	function goBack(){
   	 	history.back();
    }
  </script>
  
</body>
</html>