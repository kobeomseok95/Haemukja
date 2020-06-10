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
              <!-- 여기! -->
              <div class="form-group row">
	              <label for="join-type" class="col-md-4 col-form-label text-md-right">회원선택</label>
		          <div class="col-md-6">
		           	  <div id="memberType">
			              <input type="radio" name="joinType" value="member" checked="checked" />일반회원
			           	  <input type="radio" name="joinType" value="seller" />판매회원
		              </div>    
				  </div>        
              </div>
              
              <!-- ***********해먹자 회원가입***********-->
               <div id="joinMember">
               
               <form action="<%= request.getContextPath()%>/join.me" method="post">
               <input type="hidden" name="joinTypeValue" value="1" />	<!-- 1번일때 일반회원가입 -->
               	
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
                    <button id="memaddr" class="btn btn-primary" style="background-color: orange; width: 100px; border: none" >우편번호</button><br>
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
                
                <div class="col-md-6 offset-md-4">               
                     <button type="button" class="btn btn-primary" style="background-color: orange; margin: 5px; border:none;">
                         		취소
                     </button>&nbsp;&nbsp;
                     <button type="submit" class="btn btn-primary" style="background-color: orange; margin: 5px; border:none;">
                         		가입하기
                     </button><br>                              
                </div>
                 
              </form>
               </div><!-- End of joinMember -->
               
               <!-- ***********판매자 회원가입***********-->
				<div id="joinSeller">
				<form action="<%= request.getContextPath()%>/join.me" method="post">
               	<input type="hidden" name="joinTypeValue" value="2" />	<!-- 2번일때 일반회원가입 -->
					
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
						<br><span id="resultSellerName" class="result"></span>
					</div>
				</div>
				
				<div class="form-group row">
					<label for="join-address1" class="col-md-4 col-form-label text-md-right">사업자번호</label>
					<div class="col-md-6">
						<input type="text" id="seller-address1" class="form-control" name="seller-address1" required autofocus style="width: 72px"> - 
						<input type="text" id="seller-address2" class="form-control" name="seller-address2" required autofocus style="width: 60px"> -
						<input type="text" id="seller-address3" class="form-control" name="seller-address3" required autofocus style="width: 110px">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="join-phone1" class="col-md-4 col-form-label text-md-right">전화번호</label>
					<div class="col-md-6">
						<select id="seller-phone1" class="form-control" name="seller-phone" required autofocus style="width: 72px">
						<option value="02">02</option>
						<option value="031">031</option>
						<option value="032">032</option>
						<option value="033">033</option>
						<option value="041">041</option>
						<option value="042">042</option>
						<option value="043">043</option>
						<option value="051">051</option>
						<option value="051">051</option>
						<option value="052">052</option>
						<option value="053">053</option>
						<option value="054">054</option>			
						<option value="055">055</option>
						<option value="061">061</option>
						<option value="062">062</option>
						<option value="063">063</option>			
						<option value="064">064</option>
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
						<input type="text" id="join-residence-sell" class="form-control" name="seller-residence" required placeholder="우편번호" style="width: 120px">&nbsp;&nbsp;
						<button id="selladdr" class="btn btn-primary" style="background-color: orange; width: 100px; border: none" >우편번호</button><br>
						<input type="text" id="join-residence2-sell" class="form-control" name="seller-residence2" width="180px;" required placeholder="주소 "><br>
						<input type="text" id="join-residence3-sell" class="form-control" name="seller-residence3" required placeholder="상세주소 "><br>
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
				</div><!-- End of joinSeller -->	
               
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
    
    function execDaumPostcode(x) { 
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
				if(x === 1){
	                document.getElementById("join-residence").value = data.zonecode;
	                document.getElementById("join-residence2").value = addr;
	                document.getElementById("join-residence3").focus();					
				} else if( x === 2 ){
					document.getElementById("join-residence-sell").value = data.zonecode;
	                document.getElementById("join-residence2-sell").value = addr;
	                document.getElementById("join-residence3-sell").focus();				
				}
            }
        }).open();
    }
    
    
    $(function(){
	  $('#memaddr').click(function(){
	  	execDaumPostcode(1);
	  });
	  $('#selladdr').click(function(){
		execDaumPostcode(2);  
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
	  //-------------------------------------------일반회원 유효성검사-------------------------------------
      // 아이디 유효성 및 중복검사
      $('#join-id').blur(function() {

        var value = $('#join-id').val().trim();
        var reg = /^[a-z0-9]{8,15}$/;
        
		$.ajax({
			url: "${pageContext.request.contextPath}/checkId.me?userId="+ value +"&joinType=1",
			type:"get",
			success : function(data){
				if (!reg.test(value)) { //일단 유효성 검사 먼저
		          $('#resultMemberId').text("8자 이상 15자이하 소영문자,숫자만 가능합니다.");
		          $('#resultMemberId').css({ 'color': 'red', 'font-weight': 'bolder' });

		          $('#join-id').val('');
		        } else {	//유효성 검사가 끝났다면
		        	if(data == 1){	//아이디가 중복일 경우
		        		$('#resultMemberId').text("아이디가 중복되었습니다.");
		        		$('#resultMemberId').css({ 'color': 'red', 'font-weight': 'bolder' });
					}
					else{	//중복되지 않을 경우
						$('#resultMemberId').text("사용 가능합니다.");
		        		$('#resultMemberId').css({ 'color': 'green', 'font-weight': 'bolder' });
					}	
		        }
			},
			error : function(data){
				console.log("*****ERROR join.jsp line 393*****");
			}
		}); 
      });
      
      //패스워드 유효성 검사
      $('#join-pwd1').blur(function() {

        var pw1 = $('#join-pwd1').val().trim();
        //특수문자 숫자 문자 포함형태의 8~20이내 비밀번호
        var regex = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

        if (!regex.test(pw1)) {
          $('#resultMemberPwd1').text("8자이상 20자 이하, 영대소문자/숫자/특수기호만 가능합니다.");
          $('#resultMemberPwd1').css({ 'color': 'red', 'font-weight': 'bolder' });
          $('#join-pwd1').val('');
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

      // 이름 유효성 검사 삭제
      
   	// --------------------------------------------------------------------------------------------판매회원 유효성검사
      $('#seller-id').blur(function() {
    	  var value = $('#seller-id').val().trim();
          var reg = /^[a-z0-9]{8,15}$/;
    	  
        $.ajax({
  			url: "${pageContext.request.contextPath}/checkId.me?userId="+ value +"&joinType=2",
  			type:"get",
  			success : function(data){
  				if (!reg.test(value)) { //일단 유효성 검사 먼저
  		          $('#resultSellerId').text("8자 이상 15자이하 소영문자,숫자만 가능합니다.");
  		          $('#resultSellerId').css({ 'color': 'red', 'font-weight': 'bolder' });

  		          $('#seller-id').val('');
  		        } else {	//유효성 검사가 끝났다면
  		        	if(data == 1){	//아이디가 중복일 경우
  		        		$('#resultSellerId').text("아이디가 중복되었습니다.");
  		        		$('#resultSellerId').css({ 'color': 'red', 'font-weight': 'bolder' });
  					}		
  					else{	//중복되지 않을 경우
  						$('#resultSellerId').text("사용 가능합니다.");
  		        		$('#resultSellerId').css({ 'color': 'green', 'font-weight': 'bolder' });
  					}	
  		        }
  			},
  			error : function(data){
  				console.log("*****ERROR join.jsp line 486*****");
  			}
  		}); 
      });
      
      //패스워드 유효성 검사
      $('#seller-pwd1').blur(function() {

        var pw1 = $('#seller-pwd1').val().trim();
      	//특수문자 숫자 문자 포함형태의 8~20이내 비밀번호
        var regex = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

        if (!regex.test(pw1)) {
          $('#resultSellerPwd1').text("8자이상 20자 이하, 영대소문자/숫자/특수기호만 가능합니다.");
          $('#resultSellerPwd1').css({ 'color': 'red', 'font-weight': 'bolder' });
          $('#seller-pwd1').val('');
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
    });
  </script>

</body>

</html>