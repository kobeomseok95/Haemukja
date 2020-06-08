<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>판매자 회원가입</title>

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
   @import url(https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap);*{font-family:'Nanum Gothic',sans-serif;font-size:15px}.logo{height:80px}.list-group a{font-size:18px;font-weight:700}.list-group-item{border-style:none}.panel-heading{background-color:orange;text-align:center;line-height:50px;vertical-align:middle;color:#fff;font-size:20px;font-weight:700}#login{background-color:orange;text-align:center;width:150px;height:200px;border-radius:15px;position:fixed}#loginBtn{background-color:#323232;text-align:center;border:none;border-radius:3px;color:#fff}a{color:#000;text-decoration:none}a:hover{color:orange;text-decoration:none}button{float:right;background-color:#323232;text-align:center;border:none;border-radius:3px;color:#fff;}footer{background-color:#e6e6e6;height:200px}.notice{background-color:#ffbfdd}#write{text-align:right}.btn{background-color:#323232;color:#fff}.shipInfoBox{display:none}.form-control{display:inline}.result{border-style:none}
   </style>
</head>

<body>


<main class="seller-form">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                
                     <div class="card-header" align="center">
                       <img src="../images/haemukjalogo.png" width="400px">
                     </div>
                     
                    <div align="center"><h3>판매자 회원가입</h3></div>
                    <div class="card-body">
                        <form id="sellerJoin" action="<%= request.getContextPath() %>/sellerjoin.me" method="post">

               <div class="form-group row" id=joinForm>
                  <label for="join-type" class="col-md-4 col-form-label text-md-right">회원선택</label>
                      <div class="col-md-6">
                          <button type="button" id="member" class="form-control size" name="member"  required autofocus checked="checked" value="member-normal" onclick="goMember();">일반회원</button> &nbsp;&nbsp;
                          <button type="button" id="seller" class="form-control size" name="seller" required autofocus value="member-seller" onclick="goSeller()">판매회원</button>
                     </div>        
              </div>
                           
                          <div class="form-group row" id="sellerJoin">
                                <label for="seller-id" class="col-md-4 col-form-label text-md-right">아이디</label>
                                <div class="col-md-6">
                                    <input type="text" id="seller-id" class="form-control size" name="seller-id" placeholder="아이디를 입력하세요" required autofocus>
                                    <br><span id="resultId" class="result"></span>
                                </div>
                          </div>

                           <div class="form-group row" id="sellerJoin" >
                                <label for="seller-pwd1" class="col-md-4 col-form-label text-md-right">비밀번호</label>
                                <div class="col-md-6">
                                    <input type="password" id="seller-pwd1" class="form-control size" name="seller-pwd" placeholder="비밀번호를 입력하세요" required autofocus><br>
                                    <span id="resultPwd1" class="result"></span>
                                </div>
                            </div>

                              <div class="form-group row" id="sellerJoin">
                                <label for="join-pwd2" class="col-md-4 col-form-label text-md-right">비밀번호 확인</label>
                                <div class="col-md-6">
                                    <input type="password" id="seller-pwd2" class="form-control size" name="seller-pwd" placeholder="비밀번호를 입력하세요" required autofocus><br>
                                    <span id="resultPwd2" class="result"></span>
                                </div>
                            </div>


                            <div class="form-group row" id="sellerJoin">
                                <label for="seller-name" class="col-md-4 col-form-label text-md-right">사업자명</label>
                                <div class="col-md-6">
                                    <input type="text" id="seller-name" class="form-control size" name="seller-name" placeholder="이름을 입력하세요" required autofocus>
                                   <br>
                             <span id="resultName" class="result"></span>
                              </div>
                         </div>
                         
                              <div class="form-group row" id="sellerJoin">
                                <label for="join-address1" class="col-md-4 col-form-label text-md-right">사업자번호</label>
                                <div class="col-md-6">
                                    <input type="text" id="seller-address1" class="form-control" name="seller-address1" placeholder="주민번호 앞6자리" required autofocus style="width: 100px"> - 
                                    <input type="password" id="seller-address2" class="form-control" name="seller-address2" placeholder="주민번호 뒤7자리" required autofocus style="width: 100px">
                                </div>
                            </div>

                             <div class="form-group row" id="sellerJoin">
                                <label for="join-phone1" class="col-md-4 col-form-label text-md-right">전화번호</label>
                                <div class="col-md-6">
                                    <select id="seller-phone1" class="form-control" name="seller-phone" required autofocus style="width: 63px">
                      <option value="010">010</option>
                      <option value="011">011</option>
                      <option value="016">016</option>
                      <option value="019">019</option>
                    </select> -
                    <input type="text" id="seller-phone2" class="form-control" name="seller-phone2"  required autofocus style="width: 63px"> - 
                    <input type="text" id="seller-phone3" class="form-control" name="seller-phone3"  required autofocus style="width: 63px">
                                </div>
                            </div>

               <div class="form-group row" id=joinForm>
                  <label for="join-residence" class="col-md-4 col-form-label text-md-right">주소</label>
                  <div class="col-md-6">
                    <input type="text" id="join-residence" class="form-control" name="join-residence" required placeholder="우편번호" style="width: 120px">&nbsp;&nbsp;
                    <button class="btn btn-primary" style="background-color: orange; width: 100px; border: none" onclick="execDaumPostcode();">우편번호</button><br>
                    <input type="text" id="join-residence2" class="form-control" name="join-residence2" width="180px"; required placeholder="주소 "><br>
                    <input type="text" id="join-residence3" class="form-control" name="join-residence3" required placeholder="상세주소 "><br>
                  </div>
                </div>
                            <div class="col-md-6 offset-md-4">               
                                <button type="button" class="btn btn-primary" style="background-color: orange; margin: 5px; border:none;">
                                          취소
                                </button>&nbsp;&nbsp;
                                <button type="submit" class="btn btn-primary" style="background-color: orange; margin: 5px; border:none;">
                                          가입하기
                                </button><br>
                                
                                
                            </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
      </div>
    </div>
  

</main>
<!-- Bootstrap core JavaScript--> 
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
<script> 
        
      function goMain(){
         location.href="<%=request.getContextPath()%>/main.jsp";
      }
      function goMember(){
         location.href="<%= request.getContextPath()%>/member/join.jsp";
      }
      function goSeller(){
         location.href="<%=request.getContextPath()%>/member/sellerJoin.jsp";
      }
           
      function execDaumPostcode() {
          new daum.Postcode({
              oncomplete: function(data) {

                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수

                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      addr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if(data.userSelectedType === 'R'){
                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                  } else {
                    
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('join-residence').value = data.zonecode;
                  document.getElementById("join-residence2").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("join-residence3").focus();
              }
          }).open();
      }
          
      
            $(function(){
                    
            // 아이디 유효성 검사
            $('#seller-id').blur(function() {

              var value = $('#seller-id').val().trim();
              var reg = /^[a-z0-9]{4,}$/;

              if (!reg.test(value)) {
                $('#resultId').text("4글자이상, 영문자 숫자만 가능");
                $('#resultId').css({ 'color': 'red', 'font-weight': 'bolder' });

                $('#seller-id').val('');
                $('#seller-id').focus();
              } else {
                $('#resultId').text("");
              }
            });
            
            //패스워드 유효성 검사
            $('#seller-pwd1').blur(function() {

              var pw1 = $('#seller-pwd1').val().trim();
              var reg = /^[a-z0-9]{4,}$/;

              if (!reg.test(pw1)) {
                $('#resultPwd1').text("4글자이상, 영문자 숫자만 가능");
                $('#pwd1').css({ 'color': 'red', 'font-weight': 'bolder' });
                $('#seller-pwd1').val('');
                $('#seller-pwd1').focus();
              } else {
                $('#seller-pwd1').text("");
              }
            });

            //패스워드 확인
            $('#seller-pwd2').keyup(function(e) {

              var pw1 = $('#seller-pwd1').val().trim();
              var pw2 = $('#seller-pwd2').val().trim();

              if (pw1 == pw2) {
                $('#resultPwd2').html("비밀번호가 일치합니다");
                $('#resultPwd2').css({ 'color': 'green', 'font-weight': 'bolder' });
              } else {
                $('#resultPwd2').html("비밀번호가 일치하지 않습니다");
                $('#resultPwd2').css({ 'color': 'red', 'font-weight': 'bolder' });
              }      
            });

            // 이름 유효성 검사
            $('#seller-name').blur(function() {

              var value = $('#seller-name').val().trim();
              var reg = /^[가-힣]{2,}$/;

              if (!reg.test(value)) {
                $('#resultName').text("두글자 이상 한글만 가능");
                $('#resultName').css({ 'color': 'red', 'font-weight': 'bolder' });

                $('#seller-name').val('');
                $('#seller-name').focus();
              } else {
                $('#resultName').text("");
              }
            });

          });
        </script>

      </body>

      </html>