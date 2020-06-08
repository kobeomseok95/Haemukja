<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
 
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>일반회원 가입</title>

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
   @import url(https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap);*{font-family:'Nanum Gothic',sans-serif;font-size:15px}.logo{height:80px}.list-group a{font-size:18px;font-weight:700}.list-group-item{border-style:none}.panel-heading{background-color:orange;text-align:center;line-height:50px;vertical-align:middle;color:#fff;font-size:20px;font-weight:700}#login{background-color:orange;text-align:center;width:150px;height:200px;border-radius:15px;position:fixed}#loginBtn{background-color:#323232;text-align:center;border:none;border-radius:3px;color:#fff}a{color:#000;text-decoration:none}a:hover{color:orange;text-decoration:none}button{background-color:#323232;text-align:center;border:none;border-radius:3px;color:#fff}footer{background-color:#e6e6e6;height:200px}.notice{background-color:#ffbfdd}#write{text-align:right}.btn{float:right;background-color:#323232;color:#fff}.shipInfoBox{display:none}.form-control{display:inline}.result{border-style:none}.form-control{display: inline;}
  </style>
</head>

<body>
  

  <main class="login-form">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <div class="card">

            <div class="card-header" align="center">
              <img src="../images/haemukjalogo.png" width="400px">
            </div>

            <div class="card-body">
              <form id="joinForm" action="<%= request.getContextPath()%>/join.me" method="post">
              
              <div class="form-group row">
                  <label for="join-type" class="col-md-4 col-form-label text-md-right">회원선택</label>
                      <div class="col-md-6">
                      	<div id="memberType">
	                        <input type="radio" name="joinType" value="member" checked="checked" />일반회원
	                        <input type="radio" name="joinType" value="seller" />판매회원
                        </div>
                          <!-- <button type="button" id="member" class="form-control size" name="member"  required autofocus checked="checked" value="member-normal" onclick="goMember();">일반회원</button> &nbsp;&nbsp;
                          <button type="button" id="seller" class="form-control size" name="seller" required autofocus value="member-seller" onclick="goSeller()">판매회원</button>  -->
                      </div>        
              </div>
              
              <!-- ***********해먹자 회원가입***********-->
               <div id="joinMember">
               	<!-- 아이디 -->
                <div class="form-group row">
                  <label for="join-id" class="col-md-4 col-form-label text-md-right">아이디</label>
                  <div class="col-md-6">
                    <input type="text" id="join-id" class="form-control" name="join-id" placeholder="아이디를 입력하세요" required autofocus>
                    <br>
                    <span id="resultMemberId" class="result"></span>
                  </div>
                </div>
				<!-- 비밀번호 -->
                <div class="form-group row">	
                  <label for="join-pwd1" class="col-md-4 col-form-label text-md-right">비밀번호</label>
                  <div class="col-md-6">
                    <input type="password" id="join-pwd1" class="form-control" name="join-pwd" placeholder="비밀번호를 입력하세요" required autofocus>
                    <br>
                    <span id="resultMemberPwd1" class="result"></span>
                  </div>
                </div>
	
				<!-- 비밀번호확인 -->
                <div class="form-group row">
                  <label for="join-pwd2" class="col-md-4 col-form-label text-md-right">비밀번호 확인</label>
                  <div class="col-md-6">
                    <input type="password" id="join-pwd2" class="form-control" name="join-pwd" placeholder="비밀번호를 입력하세요" required autofocus>
                    <br>
                    <span id="resultMemberPwd2" class="result"></span>
                  </div>
                </div>

				<!-- 이름 -->
                <div class="form-group row">
                  <label for="join-name" class="col-md-4 col-form-label text-md-right">이름</label>
                  <div class="col-md-6">
                    <input type="text" id="join-name" class="form-control" name="join-name" placeholder="이름을 입력하세요" required autofocus>
                    <br>
                    <span id="resultMemberName" class="result"></span>
                  </div>
                </div>

				<!-- 주민번호 -->
                <div class="form-group row">
                  <label for="join-address1" class="col-md-4 col-form-label text-md-right">주민등록번호</label>
                  <div class="col-md-6">
                    <input type="text" id="join-address1" class="form-control" name="join-address" placeholder="주민번호 앞6자리" required autofocus style="width: 100px"> - 
                    <input type="password" id="join-address2" class="form-control" name="join-address2" placeholder="주민번호 뒤7자리" required autofocus style="width: 100px">
                  </div>
                </div>
	
				<!-- 전화번호 -->
                <div class="form-group row">
                  <label for="join-phone1" class="col-md-4 col-form-label text-md-right">전화번호</label>
                  <div class="col-md-6">
                    <select id="join-phone1" class="form-control" name="join-phone" required autofocus style="width: 72px" value="">
                      <option value="010">010</option>
                      <option value="011">011</option>
                      <option value="016">016</option>
                      <option value="019">019</option>
                    </select> -
                    <input type="text" id="join-phone2" class="form-control" name="join-phone2" required autofocus style="width: 72px"> - 
                    <input type="text" id="join-phone3" class="form-control" name="join-phone3" required autofocus style="width: 72px">
                  </div>
                </div>
				
				<!-- 닉네임 -->
                <div class="form-group row">
                  <label for="join-nickname" class="col-md-4 col-form-label text-md-right">닉네임</label>
                  <div class="col-md-6">
                    <input type="email_address" id="join-nickname" class="form-control" name="join-nickname" placeholder="닉네임을 입력하세요" required>
                  </div>
                </div>
                
                <!-- 주소 -->
               <div class="form-group row">
                  <label for="join-residence" class="col-md-4 col-form-label text-md-right">주소</label>
                  <div class="col-md-6">
                    <input type="text" id="join-residence" class="form-control" name="join-residence" required placeholder="우편번호" style="width: 120px">&nbsp;&nbsp;
                    <button class="btn btn-primary" style="background-color: orange; width: 100px; border: none" onclick="execDaumPostcode();">우편번호</button><br>
                    <input type="text" id="join-residence2" class="form-control" name="join-residence2" width="180px"; required placeholder="주소 "><br>
                    <input type="text" id="join-residence3" class="form-control" name="join-residence3" required placeholder="상세주소 "><br>
                  </div>
                </div>

				<!-- 이메일 -->
                <div class="form-group row">
                  <label for="join-email" class="col-md-4 col-form-label text-md-right">이메일</label>
                  <div class="col-md-6">
                    <input type="email_address" id="join-email" class="form-control" name="join-email" placeholder="abc1234@hamukja.com" required>
                  </div>
                </div>
               </div>
               
               <!-- ***********판매자 회원가입***********-->
               <div id="joinSeller">
               	<div class="form-group row">
                                <label for="seller-id" class="col-md-4 col-form-label text-md-right">아이디</label>
                                <div class="col-md-6">
                                    <input type="text" id="seller-id" class="form-control size" name="seller-id" placeholder="아이디를 입력하세요" required autofocus>
                                    <br><span id="resultSellerId" class="result"></span>
                                </div>
                          </div>

                           <div class="form-group row">
                                <label for="seller-pwd1" class="col-md-4 col-form-label text-md-right">비밀번호</label>
                                <div class="col-md-6">
                                    <input type="password" id="seller-pwd1" class="form-control size" name="seller-pwd" placeholder="비밀번호를 입력하세요" required autofocus><br>
                                    <span id="resultSellerPwd1" class="result"></span>
                                </div>
                            </div>

                              <div class="form-group row">
                                <label for="join-pwd2" class="col-md-4 col-form-label text-md-right">비밀번호 확인</label>
                                <div class="col-md-6">
                                    <input type="password" id="seller-pwd2" class="form-control size" name="seller-pwd" placeholder="비밀번호를 입력하세요" required autofocus><br>
                                    <span id="resultSellerPwd2" class="result"></span>
                                </div>
                            </div>


                            <div class="form-group row">
                                <label for="seller-name" class="col-md-4 col-form-label text-md-right">사업자명</label>
                                <div class="col-md-6">
                                    <input type="text" id="seller-name" class="form-control size" name="seller-name" placeholder="이름을 입력하세요" required autofocus>
                                   <br>
                             <span id="resultSellerName" class="result"></span>
                              </div>
                         </div>
                         
                              <div class="form-group row">
                                <label for="join-address1" class="col-md-4 col-form-label text-md-right">사업자번호</label>
                                <div class="col-md-6">
                                    <input type="text" id="seller-address1" class="form-control" name="seller-address1" placeholder="앞6자리" required autofocus style="width: 100px"> - 
                                    <input type="password" id="seller-address2" class="form-control" name="seller-address2" placeholder="뒤7자리" required autofocus style="width: 100px">
                                </div>
                            </div>

                             <div class="form-group row">
                                <label for="join-phone1" class="col-md-4 col-form-label text-md-right">전화번호</label>
                                <div class="col-md-6">
                                    <select id="seller-phone1" class="form-control" name="seller-phone" required autofocus style="width: 72px">
                      <option value="010">010</option>
                      <option value="011">011</option>
                      <option value="016">016</option>
                      <option value="019">019</option>
                    </select> -
                    <input type="text" id="seller-phone2" class="form-control" name="seller-phone2"  required autofocus style="width: 72px"> - 
                    <input type="text" id="seller-phone3" class="form-control" name="seller-phone3"  required autofocus style="width: 72px">
                                </div>
                            </div>

               <div class="form-group row">
                  <label for="join-residence" class="col-md-4 col-form-label text-md-right">주소</label>
                  <div class="col-md-6">
                    <input type="text" id="join-residence" class="form-control" name="join-seller-residence" required placeholder="우편번호" style="width: 120px">&nbsp;&nbsp;
                    <button class="btn btn-primary" style="background-color: orange; width: 100px; border: none" onclick="execDaumPostcode();">우편번호</button><br>
                    <input type="text" id="join-residence2" class="form-control" name="join-seller-residence2" width="180px;" required placeholder="주소 "><br>
                    <input type="text" id="join-residence3" class="form-control" name="join-seller-residence3" required placeholder="상세주소 "><br>
                  </div>
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
                 
              </form>
            </div> <!-- card-body -->
            
            
          </div> <!-- card -->
        </div> <!-- col-md-8 -->
      </div> <!-- row justify-content-center -->
    </div>  <!-- container -->
  </main>

  <!-- Bootstrap core JavaScript 
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
  
  <script>
    function goMain(){
    	location.href="<%=request.getContextPath()%>/index.jsp";
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
				
                document.getElementById('join-residence').value = data.zonecode;
                document.getElementById("join-residence2").value = addr;
                document.getElementById("join-residence3").focus();
            }
        }).open();
    }
    
    
    $(function(){
      $("#joinForm").submit(function(){
    	  
      });
      var mType = $('input[name="joinType"]:checked').val();
      
      if(mType === "member"){
		$('#joinMember').show();  
		$('#joinSeller').hide();
      }
      else{
		$('#joinSeller').show();  
		$('#joinMember').hide();   	  
      }
      
      $('#memberType').children().click(function(){
    	 if(mType === "member"){
			$('#joinMember').toggle();  
			$('#joinSeller').toggle();
    	 } 
    	 else{
   			$('#joinSeller').toggle();  
   			$('#joinMember').toggle();
    	 }
      });
	  
      // 아이디 유효성 검사
      $('#join-id').blur(function() {

        var value = $('#join-id').val().trim();
        var reg = /^[a-z0-9]{4,}$/;

        if (!reg.test(value)) {
          $('#resultMemberId').text("4글자이상, 영문자 숫자만 가능");
          $('#resultMemberId').css({ 'color': 'red', 'font-weight': 'bolder' });

          $('#join-id').val('');
          $('#join-id').focus();
        } else {
          $('#resultMemberId').text("");
        }
      });
      
      //패스워드 유효성 검사
      $('#join-pwd1').blur(function() {

        var pw1 = $('#join-pwd1').val().trim();
        var reg = /^[a-z0-9]{4,}$/;

        if (!reg.test(pw1)) {
          $('#resultMemberPwd1').text("4글자이상, 영문자 숫자만 가능");
          $('#resultMemberPwd1').css({ 'color': 'red', 'font-weight': 'bolder' });
          $('#join-pwd1').val('');
          $('#join-pwd1').focus();
        } else {
          $('#resultMemberPwd1').text("");
        }
      });

      //패스워드 확인
      $('#join-pwd2').keyup(function(e) {

        var pw1 = $('#join-pwd1').val().trim();
        var pw2 = $('#join-pwd2').val().trim();

        if (pw1 == pw2) {
          $('#resultMemberPwd2').html("비밀번호가 일치합니다");
          $('#resultMemberPwd2').css({ 'color': 'green', 'font-weight': 'bolder' });
        } else {
          $('#resultMemberPwd2').html("비밀번호가 일치하지 않습니다");
          $('#resultMemberPwd2').css({ 'color': 'red', 'font-weight': 'bolder' });
        }      
      });

      // 이름 유효성 검사
      $('#join-name').blur(function() {

        var value = $('#join-name').val().trim();
        var reg = /^[가-힣]{2,}$/;

        if (!reg.test(value)) {
          $('#resultMemberName').text("두글자 이상 한글만 가능");
          $('#resultMemberName').css({ 'color': 'red', 'font-weight': 'bolder' });

          $('#join-name').val('');
          $('#join-name').focus();
        } else {
          $('#resultMemberName').text("");
        }
      });
      
   	// ------------------------------------------------판매회원 유효성검사
      $('#seller-id').blur(function() {

        var value = $('#seller-id').val().trim();
        var reg = /^[a-z0-9]{4,}$/;

        if (!reg.test(value)) {
          $('#resultSellerId').text("4글자이상, 영문자 숫자만 가능");
          $('#resultSellerId').css({ 'color': 'red', 'font-weight': 'bolder' });

          $('#seller-id').val('');
          $('#seller-id').focus();
        } else {
          $('#resultSellerId').text("");
        }
      });
      
      //패스워드 유효성 검사
      $('#seller-pwd1').blur(function() {

        var pw1 = $('#seller-pwd1').val().trim();
        var reg = /^[a-z0-9]{4,}$/;

        if (!reg.test(pw1)) {
          $('#resultSellerPwd1').text("4글자이상, 영문자 숫자만 가능");
          $('#resultSellerPwd1').css({ 'color': 'red', 'font-weight': 'bolder' });
          $('#seller-pwd1').val('');
          $('#seller-pwd1').focus();
        } else {
          $('#resultSellerPwd1').text("");
        }
      });

      //패스워드 확인
      $('#seller-pwd2').keyup(function(e) {

        var pw1 = $('#seller-pwd1').val().trim();
        var pw2 = $('#seller-pwd2').val().trim();

        if (pw1 == pw2) {
          $('#resultSellerPwd2').html("비밀번호가 일치합니다");
          $('#resultSellerPwd2').css({ 'color': 'green', 'font-weight': 'bolder' });
        } else {
          $('#resultSellerPwd2').html("비밀번호가 일치하지 않습니다");
          $('#resultSellerPwd2').css({ 'color': 'red', 'font-weight': 'bolder' });
        }      
      });

      // 이름 유효성 검사
      $('#seller-name').blur(function() {

        var value = $('#seller-name').val().trim();
        var reg = /^[가-힣]{2,}$/;

        if (!reg.test(value)) {
          $('#resultSellerName').text("두글자 이상 한글만 가능");
          $('#resultSellerName').css({ 'color': 'red', 'font-weight': 'bolder' });

          $('#seller-name').val('');
          $('#seller-name').focus();
        } else {
          $('#resultSellerName').text("");
        }
      });

    });
  </script>

</body>

</html>