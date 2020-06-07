<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>로그인 - 해먹샵</title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
  <script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
  <script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
  <script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>

  <!-- Custom styles for this template -->
  <!-- <link href="../css/idpw.css" rel="stylesheet"> -->
  <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
   <script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
   <script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
   <script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
   <style>
   @import url(https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap);*{font-family:'Nanum Gothic',sans-serif;font-size:15px}body{margin:0;font-size:.9rem;font-weight:400;line-height:1.6;color:#212529;text-align:left;background-color:#f5f8fa}.my-form{padding-top:1.5rem;padding-bottom:1.5rem}.my-form .row{margin-left:0;margin-right:0}.login-form{padding-top:1.5rem;padding-bottom:1.5rem}.login-form .row{margin-left:0;margin-right:0}button{width:100px}#id,#idFind-email,#idFind-name,#join-email,#join-id,#join-name,#join-nickname,#join-pwd1,#join-pwd2,#join-residenceDetail,#password,#pwdFind-email{width:250px}
   </style>
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
    integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
    crossorigin="anonymous"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
    integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
    crossorigin="anonymous"></script>
    
  <style>
  @import url(https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap);*{font-family:'Nanum Gothic',sans-serif;font-size:15px}body{margin:0;font-size:.9rem;font-weight:400;line-height:1.6;color:#212529;text-align:left;background-color:#f5f8fa}.my-form{padding-top:1.5rem;padding-bottom:1.5rem}.my-form .row{margin-left:0;margin-right:0}.login-form{padding-top:1.5rem;padding-bottom:1.5rem}.login-form .row{margin-left:0;margin-right:0}button{width:100px}#id,#idFind-email,#idFind-name,#join-email,#join-id,#join-name,#join-nickname,#join-pwd1,#join-pwd2,#join-residenceDetail,#password,#pwdFind-email{width:250px}
  </style>
  
</head>

<body>
  <main class="login-form">
    <div class="cotainer">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <div class="card">

            <div class="card-header" align="center">
              <img src="<%=request.getContextPath()%>/images/haemukshoplogo.png" width="400px">
            </div>

            <div class="card-body">
               <!-- form -->
              <form action="<%=request.getContextPath()%>/loginsShop.me" method="post">
                <div class="form-group row">
                  <label for="email_address" class="col-md-4 col-form-label text-md-right">아이디</label>
                  <div class="col-md-6">
                    <input type="text" id="id" class="form-control" name="id" required autofocus>
                    <label for="rememberId">아이디 기억하기</label>
                  <input type="checkbox" id="rememberId" name="rememberId">
                  </div>
                </div> <!-- form-group row -->

                <div class="form-group row">
                  <label for="password" class="col-md-4 col-form-label text-md-right">비밀번호</label>
                  <div class="col-md-6">
                    <input type="password" id="password" class="form-control" name="password" required>
                  </div>
                </div> <!-- form-group row -->
                
                <div class="form-group row">
                  <label for="userType" class="col-md-4 col-form-label text-md-right">회원구분</label>
                  <div class="col-md-6">
                    <input type="radio" name="userType" value="member" checked>일반회원
                  </div>
                <br><br>
                <div class="col-md-6 offset-md-4">
                  <button type="submit" class="btn btn-primary" style="background-color: orange; border: none;">
                    로그인
                  </button>&nbsp;&nbsp;
                  <button type="button" class="btn btn-primary" style="background-color: orange; border: none;">
                    회원가입
                  </button>
                  <br><br>
                  <a href="<%=request.getContextPath()%>/member/findId.jsp" class="btn btn-link">아이디를 잊으셨나요?</a>
                  <br>
                  <a href="<%=request.getContextPath()%>/member/findPwd.jsp" class="btn btn-link">비밀번호를 잊으셨나요?</a>
                </div> <!-- col-md-6 offset-md-4 -->
              </form>
              <!-- /form -->
            </div> <!-- card-body -->
          </div> <!-- card -->
        </div> <!-- col-md-8 -->
      </div> <!-- row justify-content-center -->
    </div>  <!-- container -->
  </main>

  <!-- Bootstrap core JavaScript -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <script>
  	<% if(msg != null) { %>
		alert("회원 정보가 없습니다.");
	<% } %>
  </script>
</body>

</html>