<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, member.model.vo.*, common.*, product.model.vo.Order"%>
<% 
	Member loginMember = (Member)session.getAttribute("loginMember");
	Seller loginSeller = (Seller)session.getAttribute("loginSeller");
	ArrayList<Order> olist = (ArrayList<Order>)request.getAttribute("olist");
	ArrayList<String> pTitles = (ArrayList<String>)request.getAttribute("pTitles");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>주문관리</title>

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
  
  .shipInfoBox {
      display: none;
  }
  
  table {
      text-align: center;
  }
  
  .paging {
  	  font-size: 20px;
  	  background-color: orange;
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
        <div class="list-group">
			<%@ include file="../static/sellerStatic.jsp" %>
        </div>
        <br><br>
      </div>
      <!-- /.col-lg-2 -->

      <div class="col-lg-9">
        <!-- panel -->
        <div class="panel panel-default">
          <div class="panel-heading">&nbsp;판매관리페이지</div>
        </div>
        <!-- /panel -->
        <br>
        <div class="container">
          <div class="row">
            <h3>주문 관리</h3>
            <hr>
            <table class="table">
              <thead>
                <tr>
                  <th>주문번호</th>
                  <th>제품명</th>
                  <th>결제일자</th>
                  <th>배송정보</th>
                  <th>입력여부</th>
                  <th>환불처리</th>
                  <th>교환처리</th>
                </tr>
              </thead>
              <tbody>
              	<% for(int i = 0; i < olist.size(); i++) { %>
                <tr>
                  <td>
                  	<%=olist.get(i).getoId() %>
                  	<input type="hidden" class="oId" value="<%=olist.get(i).getoId()%>">
                  </td>
                  <td><%=pTitles.get(i) %></td>
                  <td><%=olist.get(i).getoPayDate() %></td>
                  <td>
                    <button type="button" class="shipInfoBtn">배송정보입력</button>
                  </td>
                  <% if(olist.get(i).getShipNo() == 0) { %>
                  <td>입력대기</td>
                  <% } else { %>
                  <td>입력완료</td>
                  <% } %>
                  <td><button type="button" class="refundBtn">환불</button></td>
                  <td><button type="button" class="exchangeBtn">교환</button></td>
                </tr>
                <tr class="shipInfoBox" id="shipInfoBox1">
                  <td colspan="7">
                    <form action="<%=request.getContextPath()%>/update.or" method="post">
                      <input type="hidden" value="<%=olist.get(i).getoId() %>" name="oId">
                      <% if(olist.get(i).getShipNo() == 0) { %>
                      <label>택배사 : </label>&nbsp;<input type="text" name="shipCom">&nbsp;
                      <label>운송장번호 : </label>&nbsp;<input type="text" name="shipNo">&nbsp;
                      <button type="submit">저장</button>
                      <% } else { %>
                      <label>택배사 : </label>&nbsp;<input type="text" value="<%=olist.get(i).getShipCom() %>" disabled>&nbsp;
                      <label>운송장번호 : </label>&nbsp;<input type="text" value="<%=olist.get(i).getShipNo() %>" disabled>&nbsp;
                      <button type="submit" disabled>저장</button>
                      <% } %>
                    </form>
                  </td>
                </tr>
                <% } %>
              </tbody>
            </table>
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
    <br><br>
    <div class="row">
      <div class="col-sm-12" style="text-align: center; font-size: 25px;">
      	<!-- 처음으로(<<) -->
        <button onclick="location.href='<%=request.getContextPath()%>/list.or?currentPage=1"
        		class="paging"> << </button>
        
        <!--  이전 페이지로(<) -->
		<%if(currentPage == 1) {%>
			<button disabled class="paging"> < </button>
		<% } else {%>
			<button onclick="location.href='<%=request.getContextPath()%>/list.or?currentPage=<%=currentPage-1 %>"
					class="paging"> < </button>
		<% } %>
		
		<!-- 10개의 페이지 목록 -->
		<% for(int p = startPage; p <= endPage; p++){ %>
			<% if(currentPage == p){ %>
				<button disabled class="paging"><%=p %></button>
			<% } else {%>
				<button onclick="location.href='<%=request.getContextPath()%>/list.or?currentPage=<%=p %>"
						class="paging"><%=p %></button>
			<% } %>
		<% } %>
		
		<!--  다음 페이지로(>) -->
		<%if(currentPage == maxPage) {%>
			<button disabled class="paging"> > </button>
		<% } else {%>
			<button onclick="location.href='<%=request.getContextPath()%>/list.or?currentPage=<%=currentPage+1 %>" 
					class="paging"> > </button>
		<% } %>
		
		<!--  마지막으로(>>) -->
		<button onclick="location.href='<%=request.getContextPath()%>/list.or?currentPage=<%=maxPage %>"
				class="paging"> >> </button>
  		</div>
  	</div>
  </div>
  <!-- /.container -->
  <br><br>
  <!-- Footer -->
  <%@ include file="../static/bottom.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <script>
    $(function(){
      $(".shipInfoBtn").click(function(){
        console.log($(this).parent().parent().next().toggle());
      });
      
      $(".refundBtn").click(function(){
    	 var oId = $(this).parent().parent().children().children(".oId").val();
    	 
    	 location.href="<%= request.getContextPath() %>/refund.pr?oId=" + oId;
      });
      
      $(".exchangeBtn").click(function(){
     	 var oId = $(this).parent().parent().children().children(".oId").val();
     	 
     	 location.href="<%= request.getContextPath() %>/exchange.pr?oId=" + oId;
       });
    });
  </script>

</body>
</html>