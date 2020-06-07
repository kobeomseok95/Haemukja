<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*, qna.model.vo.*, java.util.*"%>
<% 
	Member loginMember = (Member)session.getAttribute("loginMember");	//일반
	Seller loginSeller = (Seller)session.getAttribute("loginSeller");	//판매
	
	ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");	//검색결과
	PageInfo pi = (PageInfo)request.getAttribute("pi");					//페이징
	ArrayList<Notice> noticeList = (ArrayList<Notice>)request.getAttribute("notice"); //공지사항
	
	String searchOption = (String)request.getAttribute("searchOption");
	String searchContent = (String)request.getAttribute("searchContent");
	
	int totalCount = pi.getTotalCount();
	int currentPage = pi.getCurrentPage();
//	int displayRow = pi.getDisplayRow();
//	int displayPage = pi.getDisplayPage();
	int maxPage = pi.getMaxPage();
	int beginPage = pi.getBeginPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>문의게시판</title>
  <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
   <script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
   <script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
   <script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
   <style>
   @import url(https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap);*{font-family:'Nanum Gothic',sans-serif;font-size:15px}.logo{height:80px}.list-group a{font-size:18px;font-weight:700}.list-group-item{border-style:none}.panel-heading{background-color:orange;text-align:center;line-height:50px;vertical-align:middle;color:#fff;font-size:20px;font-weight:700}#login{background-color:orange;text-align:center;width:150px;height:200px;border-radius:15px;position:fixed}#loginBtn{background-color:#323232;text-align:center;border:none;border-radius:3px;color:#fff}a{color:#000;text-decoration:none}a:hover{color:orange;text-decoration:none}button{background-color:#323232;text-align:center;border:none;border-radius:3px;color:#fff}footer{background-color:#e6e6e6;height:200px}.notice{background-color:#ffbfdd}#write{text-align:right}.btn{float:right;background-color:#323232;color:#fff}.shipInfoBox{display:none}.form-control{display:inline}.result{border-style:none}
   </style>
     <!-- Bootstrap core JavaScript -->
  <%-- <script src="<%=request.getContextPath() %>/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath() %>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> --%>
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
    integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
    crossorigin="anonymous"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
    integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
    crossorigin="anonymous"></script>

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
        <div class="panel panel-default">
          <div class="panel-heading">문의게시판</div>
          <!-- 공지사항 -->
          <%for(Notice n : noticeList) {%> 	<!-- noticeDetail Servlet -->
          	<div class="notice">!!공지사항!!<a href="<%= request.getContextPath() %>/noticeDetail.qn?nno=<%=n.getNno()%>"> <%=n.getNtitle() %></a></div>
          <%} %>
        </div>
        <!-- /panel -->
          <!-- table 게시글 -->
          <table class="table" id="qnaArea">
            <thead>
              <tr>
                <th>No</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일자</th>
                <th>답변여부</th>
              </tr>
            </thead>
            <tbody>
	              <%for(Qna q : list){ %>
	              	<tr>
	              		<input type="hidden" value="<%=q.getQid()%>"/>
	              	  	<td><%=q.getRno() %></td>
		                <td><a href="<%= request.getContextPath() %>/detail.qn?qid=<%=q.getQid()%>"><%=q.getQtitle() %></a></td>
		                <td><%=q.getMnickname() %></td>
		                <td><%=q.getQdate() %></td>
		                <td>
		                	<%if( q.getAnswer().equals("N") ) {%>
		                		답변대기
		                	<%} else { %>
		                		답변완료
		                	<%} %>
		                </td>
	              	</tr>
	              <%} %>
            </tbody>
          </table>
          <!-- /table -->
          <div class="row">
          <%if(loginMember != null) {%>	<!-- 회원만 글쓰기 밑 확인 권한이 있다. -->
            <div class="col-sm-12" align="right">
              <button type="button" onclick="location.href='qna/qnaboard_write.jsp'">글쓰기</button>
            </div>
          <%} %>
          <%if(searchOption != null) {%>	<!-- 에러, 검색된 화면상태에서는 돌아가기 버튼을 추가하여 문의게시판 첫화면으로 돌아가기 -->
            <div class="col-sm-12" align="left">
              <button type="button" onclick="location.href='<%=request.getContextPath()%>/qna.qn'">목록으로</button>
            </div>
          <%} %>
          </div>
          <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-8">
              <%-- <form method="get" action="<%=request.getContextPath()%>/search.qn"><!-- 경로설정 해주기 --> --%>
                <div class="input-group">
                  <select id="selectBox" name="searchOption">
                    <option value="nickname">닉네임</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                  </select>&nbsp;
                  <%if(searchContent == null) {%>
                  <input type="text" name="searchContent" placeholder="검색어를 입력하세요">                  
                  <%}else{ //검색이 될 경우 해당 옵션에 checked 되게끔 해주기  %>
                  <input type="text" name="searchContent" placeholder="검색어를 입력하세요" value="<%=searchContent %>">                  
                  <%} %>
                  <span class="input-group-btn">
                    &nbsp;<button id="searchBtn" type="button" onclick="goSearch();">찾기</button>
                  </span>
                </div>
              <!-- </form> -->
              <script>
            	function goSearch(){
	               var searchOption = $('#selectBox option:selected').val();
	                  var searchContent = $('input[name = searchContent]').val();
	                  if(searchContent == ""){
	                     alert("검색어를 입력해주세요.");
	                  }else{
	                     location.href="<%=request.getContextPath()%>/search.qn?searchOption="+searchOption+"&searchContent="+searchContent;
	                  }
	            }
           </script>
            </div>
          </div>
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
          <a href="sellerpage_register.html" style="color: white; margin-bottom: 10px;">판매관리페이지</a>
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
        <%} %>
      </div>
    </div>
    <br>
    <!-- /.row -->
    <!-- qna.qn?currentPage= -->
	<div class="row">
      <div class="col-sm-12" style="text-align: center; font-size: 25px;">
		<%if(searchOption == null) {%>
		<button onclick="location.href='<%=request.getContextPath()%>/qna.qn?currentPage=1'" class="paging"> << </button>
        
        <!--  이전 페이지로(<) -->
      	<%if(currentPage == 1) {%>
         <button disabled class="paging"> < </button>
      	<% } else {%>
         <button onclick="location.href='<%=request.getContextPath()%>/qna.qn?currentPage=<%=currentPage-1 %>'" class="paging"> < </button>
      	<% } %>
      
      <!-- 10개의 페이지 목록 -->
	     <% for(int p = beginPage; p <= endPage; p++){ %>
	        <% if(currentPage == p){ %>
	           <button disabled class="paging"><%=p %></button>
	        <% } else {%>
	           <button onclick="location.href='<%=request.getContextPath()%>/qna.qn?currentPage=<%=p %>'" class="paging"><%=p %></button>
	        <% } %>
	     <% } %>
      
      <!--  다음 페이지로(>) -->
      <%if(currentPage == maxPage) {%>
         <button disabled class="paging"> > </button>
      <% } else {%>
         <button onclick="location.href='<%=request.getContextPath()%>/qna.qn?currentPage=<%=currentPage+1 %>'" class="paging"> > </button>
      <% } %>
      
      <!--  마지막으로(>>) -->
      <button onclick="location.href='<%=request.getContextPath()%>/qna.qn?currentPage=<%=maxPage %>'" class="paging"> >> </button>
		
		<!-- 서치할 경우 
		searchOption=content&searchContent=ㅎㅇ
		-->
		
		<%} else { //이부분 마지막페이지갈때 오류떠서 수정했음 확인바람(범석)%>
		<button onclick="location.href='<%=request.getContextPath()%>/search.qn?currentPage=1&searchOption=<%=searchOption %>&searchContent=<%=searchContent %>'" class="paging"> << </button>
        
        <!--  이전 페이지로(<) -->
      	<%if(currentPage == 1) {%>
         <button disabled class="paging"> < </button>
      	<% } else {%>
         <button onclick="location.href='<%=request.getContextPath()%>/search.qn?currentPage=<%=currentPage-1 %>&searchOption=<%=searchOption %>&searchContent=<%=searchContent %>'" class="paging"> < </button>
      	<% } %>
      
      <!-- 10개의 페이지 목록 -->
	     <% for(int p = beginPage; p <= endPage; p++){ %>
	        <% if(currentPage == p){ %>
	           <button disabled class="paging"><%=p %></button>
	        <% } else {%>
	           <button onclick="location.href='<%=request.getContextPath()%>/search.qn?currentPage=<%=p %>&searchOption=<%=searchOption %>&searchContent=<%=searchContent %>'" class="paging"><%=p %></button>
	        <% } %>
	     <% } %>
      
      <!--  다음 페이지로(>) -->
      <%if(currentPage == maxPage) {%>
         <button disabled class="paging"> > </button>
      <% } else {%>
         <button onclick="location.href='<%=request.getContextPath()%>/search.qn?currentPage=<%=currentPage+1 %>&searchOption=<%=searchOption %>&searchContent=<%=searchContent %>'" class="paging"> > </button>
      <% } %>
      
      <!--  마지막으로(>>) -->
      <button onclick="location.href='<%=request.getContextPath()%>/search.qn?currentPage=<%=maxPage %>&searchOption=<%=searchOption %>&searchContent=<%=searchContent %>'" class="paging"> >> </button>
		<%} %>
         <!-- 처음으로(<<) -->
        

      </div>
    </div>
  </div>
  <!-- /.container -->
  <br><br>
  <!-- Footer -->
  <%@ include file="../static/bottom.jsp"%>
  <script>
  	$(function(){
  		//해먹자 회원만 글확인, href막기
  		<%if( loginMember == null ){%>
  		$("#qnaArea tbody tr td a").click(function(){
  			alert("해먹자 회원만 글을 확인할 수 있습니다.");
  		}).click(function(a){
				a.preventDefault();
		});
  		<%} %>
  		// 검색시 select option 자동선택되게끔
  		
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