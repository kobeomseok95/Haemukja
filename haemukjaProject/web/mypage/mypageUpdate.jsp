<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "member.model.vo.*" %>
    
    

<% 
    Member loginMember = (Member)session.getAttribute("loginMember");
	String phone[] = loginMember.getMtel().split("-");
	Seller loginSeller = (Seller)session.getAttribute("loginSeller");

%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>개인정보수정</title>
  
 <!-- Custom styles for this template 
   <link href="../css/idpw.css" rel="stylesheet">
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
    integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
    crossorigin="anonymous"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
    integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
    crossorigin="anonymous"></script>-->
    
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
   <script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
   <script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
   <script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
   <style>
   @import url(https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap);*{font-family:'Nanum Gothic',sans-serif;font-size:15px}.logo{height:80px}.list-group a{font-size:18px;font-weight:700}.list-group-item{border-style:none}.panel-heading{background-color:orange;text-align:center;line-height:50px;vertical-align:middle;color:#fff;font-size:20px;font-weight:700}#login{background-color:orange;text-align:center;width:150px;height:200px;border-radius:15px;position:fixed}#loginBtn{background-color:#323232;text-align:center;border:none;border-radius:3px;color:#fff}a{color:#000;text-decoration:none}a:hover{color:orange;text-decoration:none}button{background-color:#323232;text-align:center;border:none;border-radius:3px;color:#fff}footer{background-color:#e6e6e6;height:200px}.notice{background-color:#ffbfdd}#write{text-align:right}.btn{float:right;background-color:#323232;color:#fff}.shipInfoBox{display:none}.form-control{display:inline}.result{border-style:none}.form-control{display: inline;}table {text-align: center;}
   
  </style>
</head>

<body>

  <!-- Navigation -->
  <%@ include file="../static/top.jsp" %>

  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-2">
        <div class="list-group">
          <%@ include file="../static/mypageStatic.jsp"%>
        </div>

      </div>
      <!-- /.col-lg-2 -->

      <div class="col-lg-9">
        <!-- panel -->
        <div class="panel panel-default">
          <div class="panel-heading">&nbsp;마이페이지</div>
        </div>
        <!-- /panel -->
        <br>
        <div class="container">
          <div class="row">
            <h3>개인정보 수정</h3>
          </div>
        </div>

        <hr>

        <form id="updateForm" action="<%= request.getContextPath() %>/update.me" method="post">
        <div class="form-group row col-lg-9">
            <label for="modify-name" class="col-md-4 col-form-label text-md-right">이름</label>
            <div class="col-md-6">
                <input type="text" id="modfiy-name" class="form-control size" name="join-name" required autofocus value="<%= loginMember.getMname() %>" readonly>
            </div>
        </div>

          <div class="form-group row col-lg-9">
              <label for="modify-id" class="col-md-4 col-form-label text-md-right">아이디</label>
              <div class="col-md-6">
                  <input type="text" id="modfiy-id" class="form-control size" name="join-id" required autofocus value="<%= loginMember.getMid() %>" readonly>
              </div>
              
          </div>



        <div class="form-group row col-lg-9">
            <label for="modify-pwd1" class="col-md-4 col-form-label text-md-right">비밀번호</label>
            <div class="col-md-6">
                <input type="password" id="modify-pwd1" class="form-control size" name="join-pwd" placeholder="비밀번호를 입력하세요" required autofocus><br>
                <span id="resultPwd1" class="result"></span>
            </div>
             
        </div>


        <div class="form-group row col-lg-9">
            <label for="modify-pwd2" class="col-md-4 col-form-label text-md-right">비밀번호 확인</label>
            <div class="col-md-6">
                <input type="password" id="modify-pwd2" class="form-control size" name="join-pwd" placeholder="비밀번호를 입력하세요" required autofocus><br>
                <span id="resultPwd2" class="result"></span>
            </div>
         </div>  


          <div class="form-group row col-lg-9">
              <label for="modify-nickname" class="col-md-4 col-form-label text-md-right">닉네임</label>
              <div class="col-md-6">
                  <input type="email_address" id="modify-nickname" class="form-control size" name="join-nickname" placeholder="닉네임을 입력하세요" value="<%= loginMember.getMnickname() %>">
              </div>
            </div>   

          <div class="form-group row col-lg-9">
              <label for="join-phone1" class="col-md-4 col-form-label text-md-right">전화번호</label>
              <div class="col-md-6">
                <select id="join-phone1" class="form-control phone-class" name="join-phone1" required autofocus value="<%= phone[0] %>" style="width: 75px">
                  <option>010</option>
                  <option>011</option>
                  <option>016</option>
                  <option>019</option>
                </select> -
                  <input type="text" id="join-phone2" class="form-control phone-class" name="join-phone2"  required autofocus value="<%= phone[1] %>" style="width: 75px"> - 
                  <input type="text" id="join-phone3" class="form-control phone-class" name="join-phone3"  required autofocus value="<%= phone[2] %>" style="width: 75px">
                </div>
            </div>


          <div class="form-group row col-lg-9">
              <label for="modfiy-email" class="col-md-4 col-form-label text-md-right">이메일</label>
              <div class="col-md-6">
                  <input type="email_address" id="modify-email" class="form-control size" name="join-email" placeholder="abc1234@hamukja.com" value="<%= loginMember.getEmail() %>">
              </div>
          </div>
        </form>
        <div class="col-md-12" align="right">
        <button type="submit" class="btn btn-primary" style="background-color: rgb(50, 50, 50); width: 80px; border: none;" onclick="updateMember();">수정</button><br><br>
        
         <button type="submit" class="btn btn-primary" style="background-color: rgb(50, 50, 50); width: 80px; border: none;" onclick="deleteMember();">탈퇴</button>   
      </div>


          </div>
      <!-- /.col-lg-9 -->
        <div class="col-lg-1">
         <%if(loginMember != null && loginSeller == null) { %>
        <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
             <%=loginMember.getMnickname() %><br>반갑습니다!<br>
          <a href="#" style="color: white; margin-bottom: 10px;" 
          onclick="location.href='<%=request.getContextPath() %>/mypage/mypageUpdate.jsp'">마이페이지</a>
          <br>
          <button type="button" id="loginBtn" onclick="logout();">로그아웃</button>
        </div>
        <%} else if (loginMember == null && loginSeller != null){ %>
          <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
             <%=loginSeller.getCompany() %><br>반갑습니다!<br>
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
  <script src="<%= request.getContextPath() %>/vendor/jquery/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 
  <script>
  
  		function login(){
      		location.href="<%=request.getContextPath()%>/member/loginHaemukja.jsp";
     		}
    	function logout(){
      		location.href="<%=request.getContextPath()%>/logout.me";
     		} 
  
      
        function updateMember(){   // 회원 수정하기 
          $("#updateForm").submit();
          
          }
      
        function deleteMember(){
    	  $("#updateForm").attr("action", "<%= request.getContextPath() %>/delete.me");
    	  
    	  $("#updateForm").submit();
      }
 
     
  </script>
   
  

</body>

</html> 
  