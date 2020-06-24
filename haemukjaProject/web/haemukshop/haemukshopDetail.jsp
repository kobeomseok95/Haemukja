<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.model.vo.*,common.*,member.model.vo.*"%>
<%
   Member loginMember = (Member)session.getAttribute("loginMember");
   Seller loginSeller = (Seller)session.getAttribute("loginSeller");
   Sale s = (Sale)request.getAttribute("sale");
   Product p = (Product)request.getAttribute("p");
   Attachment thumbnail = (Attachment)request.getAttribute("thumbnail");
   ArrayList<Attachment> detailList = (ArrayList<Attachment>)request.getAttribute("detailList");
   ArrayList<Review> review = (ArrayList<Review>)request.getAttribute("review");
   String company = (String)request.getAttribute("company");
   ArrayList<SComment> replys = (ArrayList<SComment>)request.getAttribute("comment");
%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>해먹샵판매글</title>
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
    @import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap');

    * {
      font-family: 'Nanum Gothic', sans-serif;
      font-size: 13px;
    }

    .logo {
      height: 80px;
    }

    .list-group-item {
      border-style: none;
    }

    .panel-heading {
      background-color: orange;
      line-height: 50px;
      vertical-align: middle;
      color: white;
      font-size: 30px;
    }

    #login {
      background-color: rgb(188, 188, 188);
      text-align: center;
      width: 150px;
      height: 200px;
      border-radius: 15px;
    }

    #loginBtn {
      background-color: rgb(50, 50, 50);
      text-align: center;
      border: none;
      border-radius: 3px;
      color: white;
    }

    a {
      color: black;
      text-decoration: none
    }

    a:hover {
      color: orange;
      text-decoration: none;
      font-weight: bold;
    }

    footer {
      background-color: rgb(230, 230, 230);
      height: 200px;
    }

    #shopmenubar{
      width: 100%;
      background-color: orange;


    }

    #menuname li a{
      font-size: 1.5em;
    }

   

    #loginbutton{
      font-size: 20px;

    }

    .carousel slide my-4{
      width: 100%;
    }

    .col-lg-9{
      flex: 0 0 50%;
      max-width: 100%;
    }
   
   .carousel-item{

    flex: 0 0 100%;
      max-width: 100%;

    }
    .d-block{
      width: 100%;
      height: 350px;
    }

     .card-img-top{
      width: 348px;
      height: 231px;
    }

    #count{
      border-radius: .25rem;
      border: 1px solid #ced4da;
      width: 50px;
    }


    .cart-buy-button{
    
      border-radius: .25rem;
      border: 1px solid #ced4da;
      width: 100px;
      height: 40px


    }

    #buy{
      background-color: darkgray;
    }

    #saleDetail{
      padding-top: 20px;
    }

    .sellerComment{
      background-color: lightgray;
    }

    #contentSubmit{
      background-color: lightgray;

    }

    #forList{
      border-radius: .25rem;
      border: 1px solid #ced4da;
      width: 80px;
      height: 30px;
    }
    .table{
      text-align: center;
    }

    #qna{
       border-radius: .25rem;
      border: 1px solid #ced4da;
    }

    #detail{
       border-radius: .25rem;
      border: 1px solid #ced4da;
    }
    .contentBox{
      width: 100%;
      height: 50px;
      border: 1px solid lightgray;
      border-radius: .25rem;
      border: 1px solid #ced4da;
      background-color: lightgray;
    }

    .sell-detail-img{
      width: 100%;
    }

    button {
      background-color: rgb(50, 50, 50);
      text-align: center;
      border: none;
      border-radius: 3px;
      color: white;
      height: 30px;
    }

    li>a {
      margin-left: 40px;
    }

    .replyText{
      display: none;
    }

    #thumbnail{
      width: 100%;
      max-width: 525px;
      max-height: 300px;
      vertical-align: middle;
    }

  </style>
</head>

<body>

  <div class="container" style="height: 120px; padding: 20px;">
    <div class="row">
      <div class="col-lg-4">
        <a href="<%=request.getContextPath()%>/main.re"><img class="logo" src="<%=request.getContextPath()%>/images/haemukjalogo_size.png"></a>
      </div>

      <div class="col-lg-4" align="center">
        <a href="<%=request.getContextPath()%>/mainList.sh"><img class="logo" src="<%=request.getContextPath()%>/images/haemukshoplogo.png"></a>
      </div>

      <!-- 로그인 정보 추가 -->
      <div class="col-lg-4" align="right">
        <div class="user" style="border: 2px solid orange; width: 200px;" align="center">
          <% if(loginMember == null && loginSeller == null) { %>
          <h4>비회원</h4>
          <!-- 로그인부분 수정하기(범석), 마이페이지, 판매관리페이지 매핑 완료  -->
          <a href="<%=request.getContextPath()%>/member/loginHaemukshop.jsp" style="font-size: 15px;">로그인</a><br>
          <a href="join.html" style="font-size: 15px">회원가입</a>
          <% } else if(loginMember != null && loginSeller == null) { %>
          <h4><%=loginMember.getMnickname() %></h4>
        <a href="#" style="font-size: 15px;"
             onclick="location.href='<%=request.getContextPath()%>/mypage/mypagePoint.jsp'">마이페이지</a><br>
          <a href="<%=request.getContextPath()%>/logout.me" style="font-size: 15px;">로그아웃</a>
          <% } else{ %>
          <h4><%=loginSeller.getCompany() %></h4>
          <a href="#" style="font-size: 15px;"
             onclick="location.href='<%=request.getContextPath()%>/seller/sellerPageInsert.jsp'">판매관리페이지</a><br>
        <a href="<%=request.getContextPath()%>/logout.me" style="font-size: 15px;">로그아웃</a>
          <% } %>
        </div>
      </div>
    </div>
  </div> 

  <!-- Page Content -->
  <div class="container">
    <div class="row">
     
     <nav class="navbar navbar-expand-lg navbar-light " id="shopmenubar">
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav" id="menuname">
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;"    
              onclick="location.href='<%=request.getContextPath()%>/list.sh?sbKind=' + 'VEG'">채소</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;"
              onclick="location.href='<%=request.getContextPath()%>/list.sh?sbKind=' + 'FNR'">과일 견과 쌀</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;"
              onclick="location.href='<%=request.getContextPath()%>/list.sh?sbKind=' + 'SEA'">수산 해산 건어물</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;"
              onclick="location.href='<%=request.getContextPath()%>/list.sh?sbKind=' + 'ME'">정육 계란</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;"
              onclick="location.href='<%=request.getContextPath()%>/list.sh?sbKind=' + 'VM'">음료 우유</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;"
              onclick="location.href='<%=request.getContextPath()%>/list.sh?sbKind=' + 'BC'">베이커리 치즈</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white;"
              onclick="location.href='<%=request.getContextPath()%>/list.sh?sbKind=' + 'NSO'">면 양념 오일</a>
            </li>
          </ul>
        </div>
      </nav>
      
      <br>
       
      <div class="col-lg-9" >
         <br>
         <span style="font-size: 20px;">판매글 번호 : <%=s.getSbNo() %></span>
         <%if(loginSeller != null && loginSeller.getSid().equals(p.getsId())) {%>
               <button type="button" onclick="deleteSale();" style="background-color:white; color: red; font-size: 20px;">판매글 삭제</button>
        <%}%>
        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel" style="width: 525px; height: 300px;">
          
          <img src="<%=request.getContextPath()%>/uploadFiles/<%=thumbnail.getFileName() %>" id="thumbnail">
          
        </div>
      </div>
      <div class="col-lg-9" id="saleDetail" >
        <form>
          <h3 id="saleTitle"><%=p.getpTitle() %></h3>
          <% if(p.getSoldout().equals("Y")) { %>
          <h5 style="color: red; font-weight: bold;">SOLD OUT</h5>
          <% } %>
          <br>
          <h4 id="price"><%=p.getPrice() %>원</h4>
          <br>
          <hr>
          <br>
          <h5><%=company %></h5>
          <h5 style="display: inline-block;">원산지</h5>
          <h5 id="origin" style="display: inline-block;">국산</h5>
          <hr>
          <br>
          <h5 style="display: inline-block;">구매수량</h5>
          <input type="number" id="count" name="count" min="1" max="100" step="1" placeholder="0">
          <br>
          <br>
          <br>
          <div align="right">
            <button type="button" onclick="cartInsert();">장바구니</button>
            <button type="button" onclick="buy();">구매하기</button>
             <button type="button" onclick="nonMem();">비회원 구매하기</button>
          </div>
        </form>
      </div>

    </div>
  </div>
  <!-- /.container -->
  <br><br>
  <div class="container" id="button-box"> 
    <div align="right">
      <button type="button" id="detail" name="detail">상세내용</button>
      <button type="button" id="review" name="review">리뷰확인</button>
      <button type="button" id="qna" name="qna">문의하기</button>
    </div>
    <hr>
  </div>

  <div class="container" id="detail-box">
     <%for(int i=0;i<detailList.size();i++){ %>
    <img src="<%=request.getContextPath()%>/uploadFiles/<%=detailList.get(i).getFileName()%>" class="sell-detail-img">
    <br><br><br>
    <%} %>
    
    <h3><%=s.getSbTitle() %></h3>
    <span><%=s.getSbContent() %></span>
  </div>

  <div class="container" id="reviewBox" style="display: none">
    <table class="table">
      <thead>
        <tr>
          <th>번호</th>
          <th>작성자</th>
          <th>리뷰내용</th>
          <th>구매날짜</th>
        </tr>
      </thead>
      <tbody>
        <%for(int i=0;i<review.size();i++){ %>
        <tr>
          <td><%=i+1%></td>
          <td><%=review.get(i).getName() %></td>
          <td><%=review.get(i).getContent() %></td>
          <td><%=review.get(i).getOdate() %></td>
        </tr>
        <%} %>
      </tbody>
    </table>
  </div>

  <div  class="container" id="qnaBox" style="display: none">
	          <table class="table">
              <thead>
                <tr>
                  <th>번호</th>
                  <th>댓글내용</th>
                  <th>작성자</th>
                  <th>작성날짜</th>
                  <th></th>
                </tr>
              </thead>
              <tbody id="commentTable">
                <%
                	if(replys.isEmpty()) {
                %>
	                <tr>
		                <td colspan='5'>
		                	댓글이 없습니다.
		                </td>
		            </tr>
                <%
                	} else {
                %>
                	<%
                		for(SComment c : replys) {
                	%>
                		<%if(c.getDepth() == 0) {%>	<!-- 댓글 -->
                	<tr>
                		<td class="groupNo">
	                		<p style="display:none;"><%=c.getScno()%></p>		
	                		<p><%=c.getGroupNo() %></p>
                		</td>
                		<td class="commentArea">
                			<p><%=c.getsComment() %></p>
                			<textarea class="updateContent" style="display:none;" cols="50px"><%=c.getsComment() %></textarea>
                		</td>
                		<td><%=c.getmNickname() %></td>
                		<td><%=c.getsDate() %></td>
                		<td><button class="lookReplys group<%=c.getGroupNo() %>">답글</button>&nbsp;
                		<%if( loginMember != null ) { %>
                			<%if( loginMember.getMnickname().equals("관리자") || loginMember.getMnickname().equals(c.getmNickname()) ) {%>
                		<button class="changeTextarea">수정</button>&nbsp;
                		<button class="changeReply deleteComment">삭제</button></td>
                			<%} %>
                		<%} else if( loginSeller != null ){ %>
                			<% if( loginSeller.getCompany().equals(c.getmNickname()) ){ %>
                		<button class="changeTextarea">수정</button>&nbsp;
                		<button class="changeReply deleteComment">삭제</button></td>	
                			<%} %>
                		<%}%>
                	</tr>
                	<tr class="hideReplys group<%=c.getGroupNo() %>" style="display:none;">
						<td colspan="4">
							<textarea class="replyContent" cols="68px"></textarea>
						</td>
						<td>
							<button class="changeReply addReply">답글작성</button>
						</td>
					</tr>
                		<%} else{ %>	<!-- 답글 -->
					<tr class="hideReplys group<%=c.getGroupNo() %>" style="display:none;">
						<td>
	                		<p style="display:none;"><%=c.getScno()%></p>		
	                		<p style="display:none;"><%=c.getParentNo() %></p>
						</td>
                		<td class="commentArea">
                			<p><%=c.getsComment() %></p>
                			<textarea class="updateContent" style="display:none;" cols="50px"><%=c.getsComment() %></textarea>
                		</td>
                		<td><%=c.getmNickname() %></td>
                		<td><%=c.getsDate() %></td>
                		<td>
                		<%if( loginMember != null ) { %>
                			<%if( loginMember.getMnickname().equals("관리자") || loginMember.getMnickname().equals(c.getmNickname()) 
                					|| loginSeller.getCompany().equals(c.getmNickname()) ) {%>
                		<button class="changeTextarea">수정</button>&nbsp;
                		<button class="changeReply deleteReply">삭제</button>
                			<%} %>
                		<%} else if( loginSeller != null ){ %>
                			<% if( loginSeller.getCompany().equals(c.getmNickname()) ){ %>
                		<button class="changeTextarea">수정</button>&nbsp;
                		<button class="changeReply deleteReply">삭제</button>			
                			<%} %>
                		<%}%>
                		</td>
					</tr>
						<%} %>
                	<%} %>
                <%} %>
              </tbody>
            </table>
            <div class="form-horizontal">
            	<!-- 여기는 댓글 작성하는 곳 -->
                <div class="writeGroup">
                  <label>댓글</label>
                  <textarea id="commentContent" class="form-control" rows="2"></textarea>
                </div>
                <div id="addComDiv" align="right">
                  <button class="changeReply addComment">등록</button>
                </div>
            </div> 
            
  </div>
  
  <br>
  <div align="center"><button type="button" onclick="tothelist();">메인으로</button></div>
  <br>

  <!-- Footer -->
  <%@ include file="../static/bottom.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <script>

      <%--  <%if(result!=null){%>
           alert("장바구니에 추가되었습니다.");
        <%}%> --%>

   $('#detail').click(function(){
     $('#detail-box').show();
     $('#qnaBox').hide();
     $('#reviewBox').hide();
   });

   $('#qna').click(function(){
     $('#detail-box').hide();
     $('#qnaBox').show();
     $('#reviewBox').hide();
    });

   $('#review').click(function(){
     $('#detail-box').hide();
     $('#qnaBox').hide();
     $('#reviewBox').show();
   });

   $(".replyBtn").click(function(){
     console.log($(this).parent().parent().next().toggle());
   });
   
   $(function(){
			$("table").on("click", ".lookReplys", function(){	//대댓글 보여주거나 숨기기
				var lookReplys = $(this).attr("class").split(" ")[1];
				$(".hideReplys." + lookReplys).toggle();
			});
			
			$(document).on('click', '.changeTextarea', function(){
				$(this).addClass('update');
				$(this).addClass('changeReply');
				$(this).prev().toggle();
				$(this).next().toggle();
				var $newBtn = $("<button>");
				$newBtn.addClass("cancel");
				$newBtn.text("취소");
				$(this).parent().append($newBtn);
				$(this).parent().siblings('td.commentArea').children('p').hide();
				$(this).parent().siblings('td.commentArea').children('textarea').show();
			});
			
			$(document).on('click', '.cancel', function(){
				$(".changeTextarea").removeClass('update').removeClass('changeReply');
				$(this).parent().siblings('td.commentArea').children('p').show();
				$(this).parent().siblings('td.commentArea').children('textarea').hide();
				$(this).prev().toggle();
				$(this).prev().prev().prev().toggle();
				$(this).remove();
			});
			
			$(document).on('click', '.changeReply', function(){	
				<%if( loginMember != null || ( loginSeller != null && loginSeller.getSid().equals(s.getsId())) ){ %>
					var actionType= $(this).attr("class").split(" ")[1];
					var scno = 0;
					var writer = "";
					<% if(loginMember != null && loginSeller == null){ %>
						writer = "<%=loginMember.getMid()%>" + ",member";
					<% } else if(loginMember == null && loginSeller != null){ %>
						writer = "<%=loginSeller.getSid()%>" + ",seller";
					<% } %>
					var sbno = <%=s.getSbNo()%>;
					var content = "";
					var parentNo = 0;
					var orderNo = 1;
					var groupNo = 0;
					var depth = 0;
					
					if(actionType === "addComment"){
						groupNo = $(".groupNo").length + 1;
						content = $("#commentContent").val();
					}
					else if(actionType === "addReply"){
						content = $(this).parent().prev().children().val();
						var temp = $(this).parent().parent().prev().children('td.groupNo').children()[0];
						parentNo = temp.textContent;
						var orderNoClass = $(this).parent().parent().attr("class").split(" ")[1];
						orderNo = $("tr." + orderNoClass).length + 1;
						groupNo = orderNoClass.substring(5);
						depth = 1;
					}
					else if(actionType === "deleteComment" || actionType === "deleteReply"){
						if(confirm("해당 댓글을 삭제하시겠습니까?")){
							var y = $(this).parent().siblings()[0].children[0];
							scno = y.textContent;
						}
						else{
							return false;
						}
					}
					else if(actionType === "update"){
						var y = $(this).parent().siblings()[0].children[0];
						scno = y.textContent;
						content = $(this).parent().siblings(".commentArea").children('textarea').val();
					}
					
					if(content == "" && ((actionType.indexOf("add") >= 0))){
						alert("내용을 입력해주세요.");
						return;
					}
					else if(content == "" && ((actionType === "update"))){
						alert("내용을 입력해주세요.");
						$(".cancel").remove();
						$(this).parent().siblings(".commentArea").children('p').toggle();
						$(this).parent().siblings(".commentArea").children('textarea').toggle();
						$(".changeTextarea").removeClass('update').removeClass('changeReply');
						return;
					}
					
					$.ajax({
						url:"changeComment.sh",
						type:"post",
						data:{scno:scno,
								sbno:sbno,
								sComment:content, 
								mid:writer,
								parentNo:parentNo,
								orderNo:orderNo,
								groupNo:groupNo,
								depth:depth,
								actionType:actionType},
						success:function(data){
							$commentTable = $("#commentTable");
							$commentTable.html(""); 
							
							if(data.length == 0){
								var $tr = $("<tr>");
								var $td = $("<td>");
								$td.attr("colspan", 5);
								$td.text("댓글이 없습니다.");
								$tr.append($td);
								$commentTable.append($tr);
							}else{
								for(var i in data){
									if(data[i].depth == 0){	
										//댓글일 경우
										var $firstTr = $("<tr>");
										
										var $firstTd = $("<td>");
										$firstTd.addClass("groupNo")
										var $p1 = $("<p>").css("display", "none").text(data[i].scno);
										var $p2 = $("<p>").text(data[i].groupNo);
										$firstTd.append($p1);
										$firstTd.append($p2);
										
										var $secondTd = $("<td>");
										var $p = $("<p>");
										$p.text(data[i].sComment);
										var $textarea = $("<textarea>");
										$textarea.addClass('updateContent');
										$textarea.css("display", "none");
										$textarea.attr("cols", "50px");
										$textarea.val($p.text());
										$secondTd.addClass("commentArea");
										$secondTd.append($p);
										$secondTd.append($textarea);
										
										
										var $thirdTd = $("<td>");
										$thirdTd.text(data[i].mNickname);
										
										var $fourthTd = $("<td>");
										$fourthTd.text(data[i].sDate);
										
										var $fifthTd = $("<td>");
										var loginMember = "${loginMember.mnickname}";
										var loginSeller = "${loginSeller.company}"
										if( (loginMember != null && data[i].mNickname == loginMember) || loginMember == "관리자" 
												|| (loginSeller != null && data[i].mNickname == loginSeller) ){
											$fifthTd.html("<button class='lookReplys group" + data[i].groupNo + "'>답글</button>&nbsp;<button class='changeTextarea'>수정</button>&nbsp;<button class='changeReply deleteComment'>삭제</button>");
										}
										else{
											$fifthTd.html("<button class='lookReplys group" + data[i].groupNo + "'>답글</button>&nbsp;");
										}
										$firstTr.append($firstTd);
										$firstTr.append($secondTd);
										$firstTr.append($thirdTd);
										$firstTr.append($fourthTd);
										$firstTr.append($fifthTd);
										
										var $secondTr = $("<tr>");
										$secondTr.addClass("hideReplys group" + data[i].groupNo).css("display", "none");
										
										var $firstTd2 = $("<td>");
										$firstTd2.attr("colspan", 4);
										$firstTd2.html("<textarea class='replyContent' cols='77px'></textarea>");
										
										var $secondTd2 = $("<td>");
										$secondTd2.html("<button class='changeReply addReply'>답글작성</button>");
										
										$secondTr.append($firstTd2);
										$secondTr.append($secondTd2);
										$commentTable.append($firstTr);
										$commentTable.append($secondTr);
									}	
									else{
										//답글일 경우
										var $tr = $("<tr>");
										$tr.addClass("hideReplys");
										$tr.addClass("group" + data[i].groupNo);
										$tr.css("display", "none");
										
										var $firstTd = $("<td>");
										var $p1 = $("<p>").css("display", "none").text(data[i].scno);
										var $p2 = $("<p>").css("display", "none").text(data[i].parentNo);
										$firstTd.append($p1);
										$firstTd.append($p2);
										
										var $secondTd = $("<td>");
										var $p = $("<p>");
										$p.text(data[i].sComment);
										var $textarea = $("<textarea>");
										$textarea.addClass('updateContent');
										$textarea.css("display", "none");
										$textarea.attr("cols", "50px");
										$textarea.val($p.text());
										$secondTd.addClass("commentArea");
										$secondTd.append($p);
										$secondTd.append($textarea);
										
										var $thirdTd = $("<td>").text(data[i].mNickname);
										
										var $fourthTd = $("<td>").text(data[i].sDate);
										
										var $fifthTd = $("<td>");
										var loginMember = "${loginMember.mnickname}";
										if( (loginMember != null && data[i].mNickname == loginMember) || loginMember == "관리자" 
											|| (loginSeller != null && data[i].mNickname == loginSeller) ){
											$fifthTd.html("<button class='changeTextarea'>수정</button>&nbsp;<button class='changeReply deleteReply'>삭제</button>");
										}
										$tr.append($firstTd);
										$tr.append($secondTd);
										$tr.append($thirdTd);
										$tr.append($fourthTd);
										$tr.append($fifthTd);
										
										$commentTable.append($tr);
									}	
								}
							}
							$("textarea").val("");
						},
						error:function(request,status,error){
						    console.log("error");
						}
					}); 
					
					
				<%}else if (loginSeller == null && loginMember == null) { %>
					if(confirm("해먹자 회원 로그인이 필요합니다. 로그인 하시겠어요?")){
						location.href="<%=request.getContextPath()%>/member/loginHaemukja.jsp";
					}
					else{
						return false;
					}
				<%}else if (loginSeller != null && !loginSeller.getSid().equals(s.getsId())) {%>
					alert("해당 게시판의 작성자가 아닙니다.");
				<%}%>
			});
	    });
   
   function logout(){
      location.href="<%=request.getContextPath()%>/logout.me";
   }
   
   function cartInsert(){
      var count= $("#count").val();
      
      if(count==0){
         alert("수량을 입력해주세요.");
      }else{
       <%if(loginMember==null){%>
       location.href="<%=request. getContextPath()%>/ncart.sh?pid=<%=p.getpId()%>&ptitle=<%=p.getpTitle()%>&thumbnail=<%=thumbnail.getFileName()%>&price=<%=p.getPrice()%>&sbno=<%=thumbnail.getSbNo()%>&count="+count;
       
       <%}else if(loginSeller!=null){%>
          alert("일반회원만 이용가능합니다.");
       
       <%}else{%>
       location.href="<%=request. getContextPath()%>/cart.sh?pid=<%=p.getpId()%>&count="+count;
   
       <%}%>
      }
   }
   
   function buy(){
      
      var count= $("#count").val();
      
      if(count==0){
         alert("수량을 입력해주세요.")
      }else{
      
      
       <%if(loginMember==null && loginSeller == null){%>
          alert("로그인이 필요합니다");
       
       <%}else if(loginSeller!=null){%>
          alert("일반회원만 이용가능합니다.");
       
       <%}else{%>
         location.href="<%=request.getContextPath()%>/member.me?ptitle=<%=p.getpTitle()%>&price=<%=p.getPrice()%>&sbno=<%=s.getSbNo()%>&pid=<%=p.getpId()%>&pcount="+count;
       <%}%>
       
      }
   }
   
   function tothelist(){
         
         location.href="<%=request.getContextPath()%>/mainList.sh";
   }
   
   function deleteSale(){
         var flag = confirm('해당 게시글을 삭제하시겠습니까?')
         if(flag){   //삭제의 경우
            location.href="<%=request.getContextPath()%>/deleteSale.sh?sbno="+<%=s.getSbNo()%>;
         }
    }
   
   function nonMem(){
         
         var count= $("#count").val();
         if(count==0){
            alert("수량을 입력해주세요");
         }else{
          <%if(loginMember==null||loginMember!=null){%>
            //비회원 구매처리
            var sellflag = confirm("비회원으로 주문하시겠습니까?");
            if(sellflag){
               //여기 중요
               location.href="<%=request.getContextPath()%>/nonmember.me?product=<%=p.getpTitle()%>&price=<%=p.getPrice()%>&sbno=<%=s.getSbNo()%>&pid=<%=p.getpId()%>&pcount="+count;
            } else{
               <%if(loginMember==null){%>
               location.href="<%=request.getContextPath()%>/member/loginHaemukja.jsp";
               <%}else if(loginMember!=null){%>
               location.href="<%=request. getContextPath()%>/member.me?product=<%=p.getpTitle()%>&price=<%=p.getPrice()%>&sbno=<%=s.getSbNo()%>&pcount="+count;
               <%}%>
            }
            <%}%>
         
         }
   }
  </script>

</body>

</html>