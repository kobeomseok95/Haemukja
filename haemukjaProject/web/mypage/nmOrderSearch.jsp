<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>주문정보 확인</title>

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
              <img src="../images/haemukjalogo.png" width="400px">
            </div>

            <div class="card-body" style="height:200px">
              <form action="<%=request.getContextPath()%>/nmorder.my" method="post" style="margin-top: 35px">
              	<div class="form-group row">
                  <label for="password" class="col-md-4 col-form-label text-md-right">주문번호</label>
                  <div class="col-md-6">
                    <input type="text" id="oid" class="form-control" name="oid" required style="width:270px">
                  </div>
                </div> <!-- form-group row -->
                <div class="col-md-6 offset-md-4">
                  <button type="submit" class="btn btn-primary" style="background-color: orange; border: none; width:150px">
                   주문정보 조회
                  </button>&nbsp;&nbsp;
         
                  <br><br>
          
                </div> <!-- col-md-6 offset-md-4 -->
              </form>
            </div> <!-- card-body -->
          </div> <!-- card -->
        </div> <!-- col-md-8 -->
      </div> <!-- row justify-content-center -->
    </div>  <!-- container -->
  </main>

  <!-- Bootstrap core JavaScript -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>