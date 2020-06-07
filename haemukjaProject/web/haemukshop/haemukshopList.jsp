<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, product.model.vo.*, common.*, member.model.vo.*"%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	Seller loginSeller = (Seller)session.getAttribute("loginSeller");
	
	String sbKind = request.getParameter("sbKind");
	
	ArrayList<Sale> sList = (ArrayList<Sale>)request.getAttribute("sList");
	ArrayList<Attachment> files = (ArrayList<Attachment>)request.getAttribute("files");
	ArrayList<String> companies = (ArrayList<String>)request.getAttribute("companies");
	PageInfo sp = (PageInfo)request.getAttribute("sp");
	
	int listCount = sp.getListCount();
	int currentPage = sp.getCurrentPage();
	int maxPage = sp.getMaxPage();
	int startPage = sp.getStartPage();
	int endPage = sp.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>해먹샵</title>

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
    @import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap');
  
    * {
      font-family: 'Nanum Gothic', sans-serif;
      font-size: 13px;
    }
  
    .logo {
      height: 80px;
    }
  
    .list-group-item {
      border-style: none;
    }
  
    .panel-heading {
      background-color: orange;
      line-height: 50px;
      vertical-align: middle;
      color: white;
      font-size: 30px;
    }
  
    #login {
      background-color: rgb(188, 188, 188);
      text-align: center;
      width: 150px;
      height: 200px;
      border-radius: 15px;
    }
  
    #loginBtn {
      background-color: rgb(50, 50, 50);
      text-align: center;
      border: none;
      border-radius: 3px;
      color: white;
    }
  
    a {
      color: black;
      text-decoration: none;
    }
  
    a:hover {
      text-decoration: none;
      color: orange;
      font-weight: bold;
    }
  
    footer {
      background-color: rgb(230, 230, 230);
      height: 200px;
    }
  
    #shopmenubar {
      width: 100%;
      background-color: orange;
  
  
    }
  
    #menuname li a {
      font-size: 1.5em;
    }
  
  
  
    #loginbutton {
      font-size: 20px;
  
    }
  
    .carousel slide my-4 {
      width: 100%;
    }
  
    .col-lg-9 {
      flex: 0 0 100%;
      max-width: 100%;
    }
  
    .carousel-item {
  
      flex: 0 0 100%;
      max-width: 100%;
    }
  
    .d-block {
      width: 100%;
      height: 350px;
    }
  
    .card-img-top {
      width: 100%;
      height: 231px;
    }
  
    li>a {
      margin-left: 40px;
    }
    
    .paging {
  	  font-size: 20px;
  	  background-color: orange;
  	  color: white;
  	  border: none;
  	  border-radius: 3px;
  	}
  </style>
  
</head>

<body>

  <div class="container" style="height: 120px; padding: 20px;">
    <div class="row">
      <div class="col-lg-4">
        <a href="<%=request.getContextPath() %>/main.re">
        	<img class="logo" src="<%=request.getContextPath() %>/images/haemukjalogo_size.png">
        </a>
      </div>

      <div class="col-lg-4" align="center">
        <a href="<%=request.getContextPath() %>/mainList.sh">
        	<img class="logo" src="<%=request.getContextPath() %>/images/haemukshoplogo.png">
        </a>
      </div>
	  <!-- 로그인 정보 추가 -->
      <div class="col-lg-4" align="right">
        <div class="user" style="border: 2px solid orange; width: 200px;" align="center">
          <% if(loginMember == null && loginSeller == null) { %>
          <h4>비회원</h4>
          <!-- 로그인부분 수정하기(범석), 마이페이지, 판매관리페이지 매핑 완료  -->
          <a href="<%=request.getContextPath()%>/member/loginHaemukshop.jsp" style="font-size: 15px;">로그인</a><br>
          <a href="join.html" style="font-size: 15px">회원가입</a>
          <% } else if(loginMember != null && loginSeller == null) { %>
          <h4><%=loginMember.getMnickname() %></h4>
		  <a href="#" style="font-size: 15px;"
          	onclick="location.href='<%=request.getContextPath()%>/mypage/mypagePoint.jsp'">마이페이지</a><br>
          <a href="<%=request.getContextPath()%>/logout.me" style="font-size: 15px;">로그아웃</a>
          <% } else{ %>
          <h4><%=loginSeller.getCompany() %></h4>
          <a href="#" style="font-size: 15px;"
          	onclick="location.href='<%=request.getContextPath()%>/seller/sellerPageInsert.jsp'">판매관리페이지</a><br>
		  <a href="<%=request.getContextPath()%>/logout.me" style="font-size: 15px;">로그아웃</a>
          <% } %>
        </div>
      </div>
    </div>
  </div> 

  <!-- Page Content -->
    <div class="container">
    <div class="row">
    
      <nav class="navbar navbar-expand-lg navbar-light " id="shopmenubar">
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav" id="menuname">
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;" 	
              onclick="location.href='<%=request.getContextPath()%>/list.sh?sbKind=' + 'VEG'">채소</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;"
              onclick="location.href='<%=request.getContextPath()%>/list.sh?sbKind=' + 'FNR'">과일 견과 쌀</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;"
              onclick="location.href='<%=request.getContextPath()%>/list.sh?sbKind=' + 'SEA'">수산 해산 건어물</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;"
              onclick="location.href='<%=request.getContextPath()%>/list.sh?sbKind=' + 'ME'">정육 계란</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;"
              onclick="location.href='<%=request.getContextPath()%>/list.sh?sbKind=' + 'VM'">음료 우유</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;"
              onclick="location.href='<%=request.getContextPath()%>/list.sh?sbKind=' + 'BC'">베이커리 치즈</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;"
              onclick="location.href='<%=request.getContextPath()%>/list.sh?sbKind=' + 'NSO'">면 양념 오일</a>
            </li>
          </ul>
        </div>
      </nav>
      <br>
        <!-- /panel -->
       
      <div class="col-lg-9" style="width: 1000px">
      <br><br>
         <div class="row">
        <% for(int i = 0; i < sList.size(); i++) { 
           Sale s = sList.get(i); %>
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <% for(int j = 0; j < files.size(); j++) { 
                  Attachment a = files.get(j); %>
                       
                 <% if(s.getSbNo() == a.getSbNo()) {  %>
                    <input type="hidden" value="<%= a.getSbNo() %>">
                    <a href="<%=request.getContextPath()%>/detail.sh?sbno=<%=s.getSbNo()%>" class="detail"><img class="card-img-top" 
                       src="<%= request.getContextPath() %>/uploadFiles/<%= a.getFileName() %>">
                    </a>
                    <div class="card-body">
                       <input type="hidden" name="sbno" value="<%=s.getSbNo() %>">
                       <h5><a href="<%=request.getContextPath()%>/detail.sh?sbno=<%=s.getSbNo()%>"><%= s.getSbTitle() %></a></h5>
                        <p class="card-text"><%= s.getSbDate() %></p>
                        <p class="card-text"><%= companies.get(i) %></p>
                    </div>
                 <% } %>
                       
             <% } %>
            </div>
          </div>
        <% } %>
        </div>
      </div>
      <!-- /.col-lg-9 -->
    </div><!-- /.row -->
    <br><br>
    <div class="row">
    	<div class="col-sm-12" style="text-align: center; font-size: 25px;">
      	<!-- 처음으로(<<) -->
        <button onclick="location.href='<%=request.getContextPath()%>/list.sh?currentPage=1&sbKind=<%=sbKind %>'"
        		class="paging"> << </button>
        
        <!--  이전 페이지로(<) -->
		<%if(currentPage == 1) {%>
			<button disabled class="paging"> < </button>
		<% } else {%>
			<button onclick="location.href='<%=request.getContextPath()%>/list.sh?currentPage=<%=currentPage-1 %>&sbKind=<%=sbKind %>'"
					class="paging"> < </button>
		<% } %>
		
		<!-- 10개의 페이지 목록 -->
		<% for(int p = startPage; p <= endPage; p++){ %>
			<% if(currentPage == p){ %>
				<button disabled class="paging"><%=p %></button>
			<% } else {%>
				<button onclick="location.href='<%=request.getContextPath()%>/list.sh?currentPage=<%=p %>&sbKind=<%=sbKind %>'"
						class="paging"><%=p %></button>
			<% } %>
		<% } %>
		
		<!--  다음 페이지로(>) -->
		<%if(currentPage == maxPage) {%>
			<button disabled class="paging"> > </button>
		<% } else {%>
			<button onclick="location.href='<%=request.getContextPath()%>/list.sh?currentPage=<%=currentPage+1 %>&sbKind=<%=sbKind %>'" 
					class="paging"> > </button>
		<% } %>
		
		<!--  마지막으로(>>) -->
		<button onclick="location.href='<%=request.getContextPath()%>/list.sh?currentPage=<%=maxPage %>&sbKind=<%=sbKind %>'"
				class="paging"> >> </button>
			
      </div>
    </div>
  </div>
  <!-- /.container -->
  <br><br><br><br><br><br><br><br>
  <!-- Footer -->
  <footer>
    <div class="container">
      <br>
      <div class="row">
        <div class="col-md-12" style="text-align: center">
          <h5>Copyright &copy; 2020</h5>
          <h5>김예지 지정수 조정규 박두리 김소현 고범석</h5>
        </div>
      </div>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>