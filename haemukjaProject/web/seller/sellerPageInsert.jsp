<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
<%	
	Member loginMember = (Member)session.getAttribute("loginMember");
	Seller loginSeller = (Seller)session.getAttribute("loginSeller");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>제품등록</title>

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
            <h3>제품 등록</h3>
            <hr>
            <form class="table" action="<%=request.getContextPath()%>/insert.pr" method="post">
              <table class="table" style="text-align: center;">
                <thead>
                  <tr>
                    <th>카테고리</th>
                    <th>제품명</th>
                    <th>가격</th>
                    <th>할인율(%)</th>
                    <th>수량</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <select name="pCode">
                        <option value="veg">채소</option>
                        <option value="fnr">과일,견과,쌀</option>
                        <option value="sea">수산,해선,건어물</option>
                        <option value="me">정육,계란</option>
                        <option value="vm">음료,우유</option>
                        <option value="bc">베이커리,치즈</option>
                        <option value="nso">면,양념,오일</option>
                      </select>
                    </td>
                    <td>
                      <input type="text" name="productName" placeholder="제품명을 입력하세요">
                    </td>
                    <td>
                      <input type="number" name="price" min="1" style="width: 80px;">
                    </td>
                    <td>
                      <input type="number" name="discount" min="0" max="100" value="0" style="width: 50px;">
                    </td>
                    <td>
                      <input type="number" name="amount" min="1" style="width: 70px">
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <select name="pCode">
                        <option value="VEG">채소</option>
                        <option value="FNR">과일,견과,쌀</option>
                        <option value="SEA">수산,해선,건어물</option>
                        <option value="ME">정육,계란</option>
                        <option value="VM">음료,우유</option>
                        <option value="BC">베이커리,치즈</option>
                        <option value="NSO">면,양념,오일</option>
                      </select>
                    </td>
                    <td>
                      <input type="text" name="productName" placeholder="제품명을 입력하세요">
                    </td>
                    <td>
                      <input type="number" name="price" min="1" style="width: 80px;">
                    </td>
                    <td>
                      <input type="number" name="discount" min="0" max="100" value="0" style="width: 50px;">
                    </td>
                    <td>
                      <input type="number" name="amount" min="1" style="width: 70px">
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <select name="pCode">
                        <option value="veg">채소</option>
                        <option value="fnr">과일,견과,쌀</option>
                        <option value="sea">수산,해선,건어물</option>
                        <option value="me">정육,계란</option>
                        <option value="vm">음료,우유</option>
                        <option value="bc">베이커리,치즈</option>
                        <option value="nso">면,양념,오일</option>
                      </select>
                    </td>
                    <td>
                      <input type="text" name="productName" placeholder="제품명을 입력하세요">
                    </td>
                    <td>
                      <input type="number" name="price" min="1" style="width: 80px;">
                    </td>
                    <td>
                      <input type="number" name="discount" min="0" max="100" value="0" style="width: 50px;">
                    </td>
                    <td>
                      <input type="number" name="amount" min="1" style="width: 70px">
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <select name="pCode">
                        <option value="veg">채소</option>
                        <option value="fnr">과일,견과,쌀</option>
                        <option value="sea">수산,해선,건어물</option>
                        <option value="me">정육,계란</option>
                        <option value="vm">음료,우유</option>
                        <option value="bc">베이커리,치즈</option>
                        <option value="nso">면,양념,오일</option>
                      </select>
                    </td>
                    <td>
                      <input type="text" name="productName" placeholder="제품명을 입력하세요">
                    </td>
                    <td>
                      <input type="number" name="price" min="1" style="width: 80px;">
                    </td>
                    <td>
                      <input type="number" name="discount" min="0" max="100" value="0" style="width: 50px;">
                    </td>
                    <td>
                      <input type="number" name="amount" min="1" style="width: 70px">
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <select name="pCode">
                        <option value="veg">채소</option>
                        <option value="fnr">과일,견과,쌀</option>
                        <option value="sea">수산,해선,건어물</option>
                        <option value="me">정육,계란</option>
                        <option value="vm">음료,우유</option>
                        <option value="bc">베이커리,치즈</option>
                        <option value="nso">면,양념,오일</option>
                      </select>
                    </td>
                    <td>
                      <input type="text" name="productName" placeholder="제품명을 입력하세요">
                    </td>
                    <td>
                      <input type="number" name="price" min="1" style="width: 80px;">
                    </td>
                    <td>
                      <input type="number" name="discount" min="0" max="100" value="0" style="width: 50px;">
                    </td>
                    <td>
                      <input type="number" name="amount" min="1" style="width: 70px">
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <select name="pCode">
                        <option value="veg">채소</option>
                        <option value="fnr">과일,견과,쌀</option>
                        <option value="sea">수산,해선,건어물</option>
                        <option value="me">정육,계란</option>
                        <option value="vm">음료,우유</option>
                        <option value="bc">베이커리,치즈</option>
                        <option value="nso">면,양념,오일</option>
                      </select>
                    </td>
                    <td>
                      <input type="text" name="productName" placeholder="제품명을 입력하세요">
                    </td>
                    <td>
                      <input type="number" name="price" min="1" style="width: 80px;">
                    </td>
                    <td>
                      <input type="number" name="discount" min="0" max="100" value="0" style="width: 50px;">
                    </td>
                    <td>
                      <input type="number" name="amount" min="1" style="width: 70px">
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <select name="pCode">
                        <option value="veg">채소</option>
                        <option value="fnr">과일,견과,쌀</option>
                        <option value="sea">수산,해선,건어물</option>
                        <option value="me">정육,계란</option>
                        <option value="vm">음료,우유</option>
                        <option value="bc">베이커리,치즈</option>
                        <option value="nso">면,양념,오일</option>
                      </select>
                    </td>
                    <td>
                      <input type="text" name="productName" placeholder="제품명을 입력하세요">
                    </td>
                    <td>
                      <input type="number" name="price" min="1" style="width: 80px;">
                    </td>
                    <td>
                      <input type="number" name="discount" min="0" max="100" value="0" style="width: 50px;">
                    </td>
                    <td>
                      <input type="number" name="amount" min="1" style="width: 70px">
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <select name="pCode">
                        <option value="veg">채소</option>
                        <option value="fnr">과일,견과,쌀</option>
                        <option value="sea">수산,해선,건어물</option>
                        <option value="me">정육,계란</option>
                        <option value="vm">음료,우유</option>
                        <option value="bc">베이커리,치즈</option>
                        <option value="nso">면,양념,오일</option>
                      </select>
                    </td>
                    <td>
                      <input type="text" name="productName" placeholder="제품명을 입력하세요">
                    </td>
                    <td>
                      <input type="number" name="price" min="1" style="width: 80px;">
                    </td>
                    <td>
                      <input type="number" name="discount" min="0" max="100" value="0" style="width: 50px;">
                    </td>
                    <td>
                      <input type="number" name="amount" min="1" style="width: 70px">
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <select name="pCode">
                        <option value="veg">채소</option>
                        <option value="fnr">과일,견과,쌀</option>
                        <option value="sea">수산,해선,건어물</option>
                        <option value="me">정육,계란</option>
                        <option value="vm">음료,우유</option>
                        <option value="bc">베이커리,치즈</option>
                        <option value="nso">면,양념,오일</option>
                      </select>
                    </td>
                    <td>
                      <input type="text" name="productName" placeholder="제품명을 입력하세요">
                    </td>
                    <td>
                      <input type="number" name="price" min="1" style="width: 80px;">
                    </td>
                    <td>
                      <input type="number" name="discount" min="0" max="100" value="0" style="width: 50px;">
                    </td>
                    <td>
                      <input type="number" name="amount" min="1" style="width: 70px">
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <select name="pCode">
                        <option value="veg">채소</option>
                        <option value="fnr">과일,견과,쌀</option>
                        <option value="sea">수산,해선,건어물</option>
                        <option value="me">정육,계란</option>
                        <option value="vm">음료,우유</option>
                        <option value="bc">베이커리,치즈</option>
                        <option value="nso">면,양념,오일</option>
                      </select>
                    </td>
                    <td>
                      <input type="text" name="productName" placeholder="제품명을 입력하세요">
                    </td>
                    <td>
                      <input type="number" name="price" min="1" style="width: 80px;">
                    </td>
                    <td>
                      <input type="number" name="discount" min="0" max="100" value="0" style="width: 50px;">
                    </td>
                    <td>
                      <input type="number" name="amount" min="1" style="width: 70px">
                    </td>
                  </tr>
                </tbody>
              </table>
              <button type="submit" class="btn">등록</button>
            </form>
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
          <a href="sellerpage_register.html" style="color: white; margin-bottom: 10px;">판매관리페이지</a>
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
  <%@ include file="../static/bottom.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script>
	  function login(){
	      location.href="<%=request.getContextPath()%>/member/loginHaemukja.jsp";
	  }
	  function logout(){
	      location.href="<%=request.getContextPath()%>/logout.me";
	  }
  </script>

</body>
</html>