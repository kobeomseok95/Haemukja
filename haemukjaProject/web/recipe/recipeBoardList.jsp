<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, member.model.vo.*, recipe.model.vo.*, common.*, qna.model.vo.Notice"%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	Seller loginSeller = (Seller)session.getAttribute("loginSeller");

	String nCode = request.getParameter("nCode");
	//범석
	String searchOption = (String)request.getAttribute("searchOption");
	String searchContent = (String)request.getAttribute("searchContent");
	
	ArrayList<Recipe> rlist = (ArrayList<Recipe>)request.getAttribute("rlist");
	ArrayList<Attachment> flist = (ArrayList<Attachment>)request.getAttribute("flist");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Notice> noticeList = (ArrayList<Notice>)request.getAttribute("noticeList");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	String panelName = "";
	int flag = 0;
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
		panelName = "'" + searchContent + "' 검색 결과";
		flag = 1;
	}
	
	ArrayList<String> nicknames = (ArrayList<String>)request.getAttribute("nicknames");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>해먹자메인</title>

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
  
  	.paging {
  	  font-size: 20px;
  	  background-color: orange;
  	}
  	
  	.thumbnailArea {
 	  width: 252px;
 	  height: 150px;
  	}
  	
  	.thumbnail {
      width: 100%;
      height: 100%;
      max-width: 525px;
      max-height: 300px;
      vertical-align: middle;
      cursor: pointer;
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
          <div class="panel-heading"><%=panelName %></div>
          <%for(Notice n : noticeList) {%>
			  <div class="notice">!!공지사항!!<a href="<%= request.getContextPath() %>/noticeDetail.qn?nno=<%=n.getNno()%>"> <%=n.getNtitle() %></a></div>
		  <%} %>
        </div>
        <br>
        <!-- /panel -->
        <div class="row">
			
			<% for(int i = 0; i < rlist.size(); i++) {
				Recipe r = rlist.get(i); %>
				<div class="col-lg-4 col-md-6 mb-4" class="listArea">
		        	<div class="card h-100">
		        		<% for(int j = 0; j < flist.size(); j++) { 
		        			Attachment a = flist.get(j); %>
		        			
		        			<% if(r.getbNo() == a.getbNo()) {  %>
		        				<input type="hidden" value="<%= a.getbNo() %>" class="bNo">
			        				<div class="thumbnailArea ">
				        				<a href="<%= request.getContextPath() %>/detail2.re?bNo=<%=r.getbNo()%>" class="detail">
				        					<img class="card-img-top thumbnail" src="<%= request.getContextPath() %>/uploadFiles/<%= a.getFileName() %>">
				        				</a>
			        				</div>
				             	<div class="card-body">
				                	<h5><a href="<%= request.getContextPath() %>/detail2.re?bNo=<%=r.getbNo()%>"><%= r.getbTitle() %></a></h5>
				                	<p class="card-text"><%= r.getbDate() %></p>
				                	<p class="card-text"><%= nicknames.get(i) %></p>
				                	<p class="card-text">조회수 : <%= r.getbViews() %></p>
				              	</div>
		        			<% } %>
		        			
		        		<% } %>
		              	
		            </div>
		    	</div>
			<% } %>

        </div>

        <div class="row">
            <div class="col-sm-12" align="right">
              <button type="button" id = "writeBtn">글쓰기</button>
            </div>
          </div>
      </div>

      <div class="col-lg-1">
         <%if(loginMember != null && loginSeller == null) { %>
         <input type="hidden" id="loginStatus" value="1">
        <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
             <%=loginMember.getMnickname() %><br>반갑습니다!<br><br>
          <a href="#" style="color: white; margin-bottom: 10px;"
          	onclick="location.href='<%=request.getContextPath()%>/mypage/mypageUpdate.jsp'">마이페이지</a>
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
             <button onclick="login();">로그인</button><br><br>
              <a href="#" style="color: white; margin-bottom: 10px;"
          	onclick="location.href='<%=request.getContextPath()%>/mypage/nMyCart.jsp'">비회원</a>
        </div>
        <%} else { %>
        <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
             <button onclick="login();">로그인</button><br><br>
                <a href="#" style="color: white; margin-bottom: 10px;"
          	onclick="location.href='<%=request.getContextPath()%>/mypage/nMyCart.jsp'">비회원</a>
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
    <br><br><br><br>
    <!-- /.row -->
    
    <!-- 페이징 처리 시작 -->
    <div class="row">
    <%if (flag == 1) { %>
      <div class="col-sm-12" style="text-align: center; font-size: 25px;">
      	<!-- 처음으로(<<) -->
        <button onclick="location.href='<%=request.getContextPath()%>/search.re?currentPage=1&searchOption=<%=searchOption %>&searchContent=<%=searchContent %>'"
        		class="paging"> << </button>
        
        <!--  이전 페이지로(<) -->
		<%if(currentPage == 1) {%>
			<button disabled class="paging"> < </button>
		<% } else {%>
			<button onclick="location.href='<%=request.getContextPath()%>/search.re?currentPage=<%=currentPage-1%>&searchOption=<%=searchOption %>&searchContent=<%=searchContent %>'"
					class="paging"> < </button>
		<% } %>
		
		<!-- 10개의 페이지 목록 -->
		<% for(int p = startPage; p <= endPage; p++){ %>
			<% if(currentPage == p){ %>
				<button disabled class="paging"><%=p %></button>
			<% } else {%>
				<button onclick="location.href='<%=request.getContextPath()%>/search.re?currentPage=<%=p %>&searchOption=<%=searchOption %>&searchContent=<%=searchContent %>'"
						class="paging"><%=p %></button>
			<% } %>
		<% } %>
	
		<!--  다음 페이지로(>) -->
		<%if(currentPage == maxPage) {%>
			<button disabled class="paging"> > </button>
		<% } else {%>
			<button onclick="location.href='<%=request.getContextPath()%>/search.re?currentPage=<%=currentPage+1 %>&searchOption=<%=searchOption %>&searchContent=<%=searchContent %>'" 
					class="paging"> > </button>
		<% } %>
		
		<!--  마지막으로(>>) -->
		<button onclick="location.href='<%=request.getContextPath()%>/search.re?currentPage=<%=maxPage %>&searchOption=<%=searchOption %>&searchContent=<%=searchContent %>'"
				class="paging"> >> </button>
			
      </div>
     <%} else{ %>
     <div class="col-sm-12" style="text-align: center; font-size: 25px;">
      	<!-- 처음으로(<<) -->
        <button onclick="location.href='<%=request.getContextPath()%>/list.re?currentPage=1&nCode=<%=nCode %>'"
        		class="paging"> << </button>
        
        <!--  이전 페이지로(<) -->
		<%if(currentPage == 1) {%>
			<button disabled class="paging"> < </button>
		<% } else {%>
			<button onclick="location.href='<%=request.getContextPath()%>/list.re?currentPage=<%=currentPage-1 %>&nCode=<%=nCode %>'"
					class="paging"> < </button>
		<% } %>
		
		<!-- 10개의 페이지 목록 -->
		<% for(int p = startPage; p <= endPage; p++){ %>
			<% if(currentPage == p){ %>
				<button disabled class="paging"><%=p %></button>
			<% } else {%>
				<button onclick="location.href='<%=request.getContextPath()%>/list.re?currentPage=<%=p %>&nCode=<%=nCode %>'"
						class="paging"><%=p %></button>
			<% } %>
		<% } %>
		
		<!--  다음 페이지로(>) -->
		<%if(currentPage == maxPage) {%>
			<button disabled class="paging"> > </button>
		<% } else {%>
			<button onclick="location.href='<%=request.getContextPath()%>/list.re?currentPage=<%=currentPage+1 %>&nCode=<%=nCode %>'" 
					class="paging"> > </button>
		<% } %>
		
		<!--  마지막으로(>>) -->
		<button onclick="location.href='<%=request.getContextPath()%>/list.re?currentPage=<%=maxPage %>&nCode=<%=nCode %>'"
				class="paging"> >> </button>
			
      </div>
     <%} %>
    </div>
  </div>
  <!-- /.container -->
  <br><br>
  <!-- footer -->
  <%@ include file="../static/bottom.jsp"%>

  <input type="hidden" id="nCode" value="<%=nCode%>">
  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath() %>/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath() %>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <script>
  	$(function(){
  		<%-- $(".detail").click(function(){
  			var bNo = $(".bNo").val();
  			
			location.href="<%= request.getContextPath() %>/detail2.re?bNo=" + bNo;
  		}); --%>
  		
  		$("#writeBtn").click(function(){
  			var loginMember = $("#loginStatus").val();
  			var nCode = $("#nCode").val();
  			
  		    if(loginMember =="1") {
  				location.href = "<%=request.getContextPath()%>/recipe/recipeBoardWrite.jsp?nCode=" + nCode;
  			} else {
  				location.href = "<%=request.getContextPath()%>/member/loginHaemukja.jsp"
  			}
  			
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