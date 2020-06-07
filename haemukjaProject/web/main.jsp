<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, member.model.vo.*, recipe.model.vo.Recipe, common.Attachment"%>
<%
   Member loginMember = (Member)session.getAttribute("loginMember");
   Seller loginSeller = (Seller)session.getAttribute("loginSeller");
   
   ArrayList<Recipe> rlist = (ArrayList<Recipe>)request.getAttribute("rlist");
   ArrayList<Attachment> flist = (ArrayList<Attachment>)request.getAttribute("flist");
   ArrayList<String> nicknames = (ArrayList<String>)request.getAttribute("nicknames");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>해먹자</title>
  
  <!-- Bootstrap core CSS -->

  <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
  <script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
  <script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
  <script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>

   <style>
   @import url(https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap);*{font-family:'Nanum Gothic',sans-serif;font-size:15px}.logo{height:80px}.list-group a{font-size:18px;font-weight:700}.list-group-item{border-style:none}.panel-heading{background-color:orange;text-align:center;line-height:50px;vertical-align:middle;color:#fff;font-size:20px;font-weight:700}#login{background-color:orange;text-align:center;width:150px;height:200px;border-radius:15px;position:fixed}#loginBtn{background-color:#323232;text-align:center;border:none;border-radius:3px;color:#fff}a{color:#000;text-decoration:none}a:hover{color:orange;text-decoration:none}button{background-color:#323232;text-align:center;border:none;border-radius:3px;color:#fff}footer{background-color:#e6e6e6;height:200px}.notice{background-color:#ffbfdd}#write{text-align:right}.btn{float:right;background-color:#323232;color:#fff}.shipInfoBox{display:none}.form-control{display:inline}.result{border-style:none}
   </style>
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
    integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
    crossorigin="anonymous"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
    integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
    crossorigin="anonymous"></script>
  
  <style>
  @import url(https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap);*{font-family:'Nanum Gothic',sans-serif;font-size:15px}.logo{height:80px}.list-group a{font-size:18px;font-weight:700}.list-group-item{border-style:none}.panel-heading{background-color:orange;text-align:center;line-height:50px;vertical-align:middle;color:#fff;font-size:20px;font-weight:700}#login{background-color:orange;text-align:center;width:150px;height:200px;border-radius:15px;position:fixed}#loginBtn{background-color:#323232;text-align:center;border:none;border-radius:3px;color:#fff}a{color:#000;text-decoration:none}a:hover{color:orange;text-decoration:none}button{background-color:#323232;text-align:center;border:none;border-radius:3px;color:#fff}footer{background-color:#e6e6e6;height:200px}.notice{background-color:#ffbfdd}#write{text-align:right}.btn{float:right;background-color:#323232;color:#fff}.shipInfoBox{display:none}.form-control{display:inline}.result{border-style:none}
  
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
   
   .adArea {
   	  width: 900px;
 	  height: 300px;
   }
   
   .ad {
      width: 100%;
      height: 100%;
      max-width: 900px;
      max-height: 300px;
      vertical-align: middle;
   }
  </style>
  
</head>
<body>
  <!-- Navigation -->
  <%@ include file="static/top.jsp"%>

  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-2">
        <%@ include file="static/sideMenu.jsp"%>
      </div>
      <!-- /.col-lg-2 -->

      <div class="col-lg-9">
        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <div class="adArea">
              	<img class="d-block img-fluid ad" src="<%=request.getContextPath() %>/images/ad3.jpg" alt="First slide">
              </div>
            </div>
            <div class="carousel-item">
              <div class="adArea">
              	<img class="d-block img-fluid ad" src="<%=request.getContextPath() %>/images/ad1.jpg" alt="First slide">
              </div>
            </div>
            <div class="carousel-item">  
              <div class="adArea">
              	<img class="d-block img-fluid ad" src="<%=request.getContextPath() %>/images/ad2.jpg" alt="First slide">
              </div>
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
        <!-- panel -->
        <div class="panel panel-default">
          <div class="panel-heading">&nbsp;베스트 레시피</div>
        </div>
        <br>
        <!-- /panel -->
        
        <div class="row">
        <% for(int i = 0; i < rlist.size(); i++) { 
        	Recipe r = rlist.get(i); %>
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
            <% for(int j = 0; j < flist.size(); j++) { 
            	Attachment a = flist.get(j); %>
            	
            	<% if(r.getbNo() == a.getbNo()) { %>
            	  <input type="hidden" value="<%=a.getbNo() %>" class="bNo">
	              <div class="thumbnailArea ">
				  	<a href="<%= request.getContextPath() %>/detail2.re?bNo=<%=r.getbNo()%>" class="detail">
				    	<img class="card-img-top thumbnail" class="detail" src="<%= request.getContextPath() %>/uploadFiles/<%= a.getFileName() %>">
				    </a>
			      </div>
	              <div class="card-body">
	                 <h4><%=i+1 %>위</h4>
	                 <h5><a href="<%= request.getContextPath() %>/detail2.re?bNo=<%=r.getbNo()%>" class="detail"><%= r.getbTitle() %></a></h5>
				     <p class="card-text"><%= nicknames.get(i) %></p>
				     <p class="card-text">조회수 : <%= r.getbViews() %></p>
	              </div>
	           <% } %>
	        <% } %>
            </div>
          </div>
        <% } %>
        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->
      <div class="col-lg-1">
         <%if(loginMember != null && loginSeller == null) { %>
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
  <!-- Footer -->
  <%@ include file="static/bottom.jsp"%>

  <script>
	 <%-- $(".detail").click(function(){
	    var bNo = $(".bNo").val();
	      
	    location.href="<%= request.getContextPath() %>/detail2.re?bNo=" + bNo;
	 }); --%>
  
     function login(){
        location.href="<%=request.getContextPath()%>/member/loginHaemukja.jsp";
     }
     function logout(){
         location.href="<%=request.getContextPath()%>/logout.me";
      }
     function memberJoin(){
        
     }
  </script>
</body>
</html>