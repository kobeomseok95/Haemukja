<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="common.Attachment" %>
<%
	String ptitle = (String)request.getAttribute("ptitle");
	int price = (Integer)request.getAttribute("price");
	int amprice = (Integer)request.getAttribute("amprice");
	int pcount = (Integer)request.getAttribute("pcount");
	int pid = (Integer)request.getAttribute("pid");
	Attachment thumbnail = (Attachment)request.getAttribute("thumbnail");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원 구매 페이지</title>

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
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>

<style>
	.form-control{
		display: inline-block;'
	}
	
	#apiBtn{
		font-size:15px;
		width : 130px;
		heigh : 30px;
	}


</style>

<body>
	
    <div class="reciept">
        <div class="container">
        <form action="<%=request.getContextPath()%>/nonorder.me" method="post">
            <br>
            <h3>* 주문상품</h3>
            <div class="row">
            <input type="hidden" name="pid" value=<%=pid %>>
                <div class="col-md-8">
                    <div class="col-md-4 sellBox" style="display: inline-block;">
                        <img class="media-object img-thumbnail user-img" style="height: 80px;" alt="User Picture"
                            src="<%=request.getContextPath()%>/uploadFiles/<%=thumbnail.getFileName()%>">
                    </div>
                    <div class="col-md-4 sellBox" style="display: inline-block;">
                        <div>
                            <strong name="product"><%=ptitle %></strong><br>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

				
                    <div class="form-group">

                        <div class="col-md-4">
                            가격 :
                            <input id="price" name="price" type="text" value="<%=price %>" class="form-control" readonly>
                        </div>
                    </div>

                    <div class="form-group">

                        <div class="col-md-4">
                            구매수량 :
                            <input type="text" name="count" id="count" value="<%=pcount %>" class="form-control" aria-describedby="year-addon" readonly>
                               
                           
                        </div>
                    </div>
                </div>
            </div>
            
            <div class ="row">
          	  <div class="form-group">
            		<div class= "col-md-12" >
            				
            		    총 결제금액 :
                            <input type="text" name="allamprice" id="allamprice" style="text-align: right; width:100px;" value="<%=amprice %>" class="form-control" aria-describedby="year-addon" readonly>
            		</div>
            	</div>
            
            </div>
            
          
                
                    <br>
                    <div align="left">
                        <h3>* 주문자 정보 입력</h3>
                        <br>
                        <div class="form-group row">
                            <label for="orderer" class="col-md-1 col-form-label text-md-right">주문자</label>
                            <div class="col-md-3">
                                <input type="text" id="orderer" class="form-control" name="orderer"
                                   required autofocus>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="orderphone" class="col-md-1 col-form-label text-md-right">전화번호</label>
                            <div class="col-md-3">
                                <input type="text" id="orderphone" class="form-control" name="phone1" required
                                    autofocus style="width: 
                                    63px" > - <input type="text" id="join-phone2"
                                    class="form-control" name="phone2" required autofocus style="width: 63px"> -
                                <input type="text" id="join-phone3" class="form-control" name="phone3" required
                                    autofocus style="width: 63px" >
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="ordermail" class="col-md-1 col-form-label text-md-right">이메일</label>
                            <div class="col-md-9">
                                <input type="text" id="email" class="form-control"  name="email" required
                                    style="width: 100px" >&nbsp;&nbsp;@
                                <select name="email2" class="form-control"  style="width: 150px" >
                              		
                              		<option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="google.com">google.com</option>
                                </select>

                            </div>
                        </div>
                    
                        <br>
                        <hr>
                     
                            <h3>* 수령인 정보 입력</h3>
                            <br>
                            <div class="form-group row">
                                <label for="receiver" class="col-md-1 col-form-label text-md-right">수령인</label>
                                <div class="col-md-3">
                                    <input type="text" id="receiver" class="form-control" name="receiver"
                                        placeholder="이름을 입력하세요" required autofocus>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="receiverPhone" class="col-md-1 col-form-label text-md-right">전화번호</label>
                                <div class="col-md-3">
                                    <input type="text" id="receiverPhone1" class="form-control" name="receiverPhone1"
                                        required autofocus style="width: 63px"> - <input type="text" id="receiverPhone2"
                                        class="form-control" name="receiverPhone2" required autofocus
                                        style="width: 63px"> - <input type="text" id="receiverPhone3"
                                        class="form-control" name="receiverPhone3" required autofocus
                                        style="width: 63px">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="receiverAddress" class="col-md-1 col-form-label text-md-right">주소</label>
                                <div class="col-md-4">
                                    <input type="text" id="receiverAddress1" class="form-control" name="receiverAddress1"
                                        required placeholder="도로명/지번 검색"
                                        style="width: 180px">&nbsp;&nbsp;<button type="button" class="btn btn-success btn-lg" id="apiBtn" onclick="execDaumPostcode();">우편번호 찾기</button>
                                     <input type="text" id="receiverAddress2" class="form-control" name="receiverAddress2"
                                        required style="width:320px;">   
                                    <input type="text" id="receiverAddress3" class="form-control" name="receiverAddress3"
                                        required placeholder="상세주소 입력" style="width:320px;">
                                </div>
                            </div>
                        
                        <div class="form-group row">
                            <label for="shipMemo" class="col-md-1 col-form-label text-md-right">배송메모</label>
                            <div class="col-md-3">
                                <textarea class="form-control" rows="2" id="shipMemo" placeholder="내용을 입력하세요">
                                        </textarea>
                            </div>
                        </div>
                  
                    <hr>
                    <br>
                  
                        <h3>* 결제수단 </h3>
                        <br>

                        <div class="form-group row">
                            <label for="credit" class="col-xs-1 col-form-label text-md-right">신용카드</label>
                            <div class="col-lg-4">
                                <input type="radio" id="credit" name="payment" value="1" checked>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="phonePay" class="col-xs-1 col-form-label text-md-right">휴대폰결제</label>
                            <div class="col-lg-4">
                                <input type="radio" id="phonePay" name="payment" value="2">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="deposit" class="col-xs-1 col-form-label text-md-right">무통장입금</label>
                            <div class="col-lg-4">
                                <input type="radio" id="deposit" name="payment" value="3">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="bankTrans" class="col-xs-1 col-form-label text-md-right">계좌이체</label>
                            <div class="col-lg-4">
                                <input type="radio" id="bankTrans" name="payment" value="4">
                            </div>
                        </div>
                        
                        <div class="container">
                            <div class="row">
                            
                                <div class="col text-center">
                                    <button class="btn btn-success btn-lg" id="payBtn" type="button" onclick="pay()">결제하기</button>
                                </div>
                                
                                <script>
	                                // 결제수단이 무통장과 계좌이체일 경우 결제api x -> 바로 주문리스트에 쌓임(미결제)
	                                $("#payBtn").click(function(){
	                                var payment = $('input[name="payment"]:checked').val();
	                                if(payment =='3' || payment=='4'){
	                                	$('#payBtn' ).attr('type','submit' );
	                                	
	                                	}
	                                });
                                </script>
                                
                            </div>
                        </div>
                    
            	</div> 
            </form>
       
        
    	</div><!-- container -->
    </div> <!-- reciept -->
    
    <script>
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
                document.getElementById('receiverAddress1').value = data.zonecode;
                document.getElementById("receiverAddress2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("receiverAddress3").focus();
            }
        }).open();
    }
    
    
    
    function pay(){
        var IMP = window.IMP; // 생략가능
        IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        // 결제api에 필요한 값들
        var email = $("#email").val()+'@'+$("#email2 option:selected").val();
        
 		var name = $("#orderer").val();
        var phone = $("#receiverPhone1").val()+'-'+ $("#receiverPhone2").val()+'-'+ $("#receiverPhone3").val();
        var address=$("#receiverAddress1").val() + $("#receiverAddress2").val() + $("#receiverAddress3").val();
        
        
        // nonMemberServlet에 보낼 값들
    
        var payment = $('input[name="payment"]:checked').val();
      
        var amprice = $("#allamprice").val();
        var count = $("#count").val();
       
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '해먹샵',
            amount : <%=amprice%>,
            buyer_email : email,
            buyer_name : name,
            buyer_tel : phone,
            buyer_addr : address,
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                location.href='<%=request.getContextPath()%>/nonorder.me?payment='+payment+'&allamprice='+amprice+'&count='+count+'&pid='+<%=pid%>;
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="<%=request.getContextPath()%>/detail.sh?sbno="+<%=thumbnail.getSbNo()%>;
                alert(msg);
            }
        });
        
    };
    
    </script>
  </body>
  </html>
   
