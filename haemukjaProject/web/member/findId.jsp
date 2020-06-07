<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	String mid = (String)request.getAttribute("id");
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>아이디찾기</title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
  <script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
  <script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
  <script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>

  <!-- Custom styles for this template -->
  <link href="../css/idpw.css" rel="stylesheet">
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
              <img src="<%=request.getContextPath() %>/images/haemukjalogo.png" width="400px">
            </div>

            <div class="card-body">
              <form  action="<%=request.getContextPath()%>/id.me" id="findForm" method="post">
                <div class="form-group row">
                  <label for="idFind-name" class="col-md-4 col-form-label text-md-right">이름</label>
                  <div class="col-md-6">
                    <input type="text" id="idFind-name" class="form-control" name="name" placeholder="이름을 입력하세요" required autofocus>
                  </div>
                </div>
                <br>
                <div class="form-group row">
                  <label for="idFind-email" class="col-md-4 col-form-label text-md-right">이메일</label>
                  <div class="col-md-6">
                    <input type="email" id="idFind-email" class="form-control" name="email" placeholder="abc1234@haemukja.com" required>
                  </div>
                </div>
                <br>
				  	<%if(mid!=null){%>
				  		 <div align="center"><h3>찾으시는 아이디는 '<%=mid %>' 입니다.</h3></div>
				  	<%}else if(mid==null && msg != null){%>
				  		 <div align="center"><h3><%=msg %></h3></div>
				  	<%}%>
               
                <br>
                <div class="col-md-6 offset-md-4">            
                  <button type="submit" class="btn btn-primary" id="findButton" style="background-color: orange; border: none; width: 120px;">
                  아이디 찾기</button>
                  &nbsp;&nbsp;
                  <button type="button" class="btn btn-primary" style="background-color: orange; border: none;"
                  		onclick="location.href = '<%=request.getContextPath()%>/member/loginHaemukja.jsp'">
                  로그인</button><br><br>
                  <a href="<%=request.getContextPath()%>/member/findPwd.jsp" class="btn btn-link">비밀번호를 잊으셨나요?</a>
                </div>
              </form>
            </div> <!-- card-body -->
          </div> <!-- card -->
        </div> <!-- col-md-8 -->
      </div> <!-- row justify-content-center -->
    </div>  <!-- container -->
  </main>
  


  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath() %>/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath() %>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <script>
 	


  		 
  
 	 
  </script>
  
</body>

</html>