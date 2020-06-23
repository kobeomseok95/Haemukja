<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, 
    member.model.vo.*, 
    recipe.model.vo.*, 
    common.Attachment,qna.model.vo.QComment"%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	Seller loginSeller = (Seller)session.getAttribute("loginSeller");
	Recipe recipe = (Recipe)request.getAttribute("recipe");
	ArrayList<String> contents = (ArrayList<String>)request.getAttribute("contents");
	ArrayList<Attachment> files = (ArrayList<Attachment>)request.getAttribute("files");
	ArrayList<Tag> tags = (ArrayList<Tag>)request.getAttribute("tags");
	ArrayList<Tag> upgradeTags = (ArrayList<Tag>)request.getAttribute("upgradeTags");
	ArrayList<RComment> replys = (ArrayList<RComment>)request.getAttribute("comments");
	
	int bNo = recipe.getbNo();
	String nickname = (String)request.getAttribute("nickname");
	
	String loginId = "";
	if(loginMember != null) {
		loginId = loginMember.getMid();	
	}
	
	String nCode = recipe.getnCode();
	String panelName = "";
	if(nCode != null && nCode.equals("AS")) {
		panelName = "아시아";
	} else if(nCode != null && nCode.equals("ASK")) {
		panelName = "한국";
	} else if(nCode != null && nCode.equals("ASC")) {
		panelName = "중국";
	} else if(nCode != null && nCode.equals("ASJ")) {
		panelName = "일본";
	} else if(nCode != null && nCode.equals("ASE")) {
		panelName = "기타 아시아";
	} else if(nCode != null && nCode.equals("EU")) {
		panelName = "유럽";
	} else if(nCode != null && nCode.equals("EUI")) {
		panelName = "이탈리아";
	} else if(nCode != null && nCode.equals("EUF")) {
		panelName = "프랑스";
	} else if(nCode != null && nCode.equals("EUS")) {
		panelName = "스페인";
	} else if(nCode != null && nCode.equals("EUE")) {
		panelName = "기타 유럽";
	} else if(nCode != null && nCode.equals("AM")) {
		panelName = "아메리카";
	} else if(nCode != null && nCode.equals("AMU")) {
		panelName = "미국";
	} else if(nCode != null && nCode.equals("AME")) {
		panelName = "기타 아메리카";
	} else if(nCode != null && nCode.equals("AF")) {
		panelName = "아프리카";
	} else if(nCode != null && nCode.equals("OC")) {
		panelName = "그 밖의 국가";
	} else {
		panelName = "검색 결과";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>레시피게시판</title>

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
  
    .tag {
      display: none;
    }
    .imageArea {
	     width: 525px;
	     height: 300px;
    }
    .image {
      width: 100%;
      max-width: 525px;
      max-height: 300px;
      vertical-align: middle;
      cursor: pointer;
    }
    .no {
      color: green;
      font-size: 30px;
      font-weight: bold;
    }
    #ad {
      width: 100%;
      max-width: 800px;
      max-height: 200px;
      vertical-align: middle;
    }
  </style>
  
</head>

<body>

  <!-- Navigation -->
  <%@ include file="../static/top.jsp"%>

  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-2">
        <%@ include file="../static/sideMenu.jsp"%>
      </div>
      <!-- /.col-lg-2 -->

      <div class="col-lg-9">
        <!-- panel -->
        <div class="panel panel-default">
          <div class="panel-heading">&nbsp;<%=panelName%></div>
        </div>
        <br>
        <!-- /panel -->
        <!-- table -->
        <table class="table" style="text-align: center;">
          <thead>
            <tr>
              <th style="width: 100px;">번호</th>
              <th style="width: 300px;">제목</th>
              <th style="width: 100px;">작성자</th>
              <th style="width: 100px;">작성일자</th>
              <th style="width: 70px;">조회수</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td style="width: 100px;"><%=recipe.getbNo()%></td>
              <td style="width: 300px;"><%=recipe.getbTitle()%></td>
              <td style="width: 100px;"><%=nickname%></td>
              <td style="width: 100px;"><%=recipe.getbDate()%></td>
              <td style="width: 70px;"><%=recipe.getbViews()%></td>
            </tr>
            <tr>
              <td colspan='5' align="center">
              <%
              	for(int i = 0; i < files.size(); i++) {
              %>
              	<i class="no"><%=i+1%></i>
              	<div class="imageArea">
              		<img src="<%=request.getContextPath()%>/uploadFiles/<%=files.get(i).getFileName()%>" class="image">
              	</div>
              	<div class="tag">
	              	<%
	              		for(int j = 0; j < tags.size(); j++) {
	              	%>
	              		<%
	              			if(tags.get(j).getaId() == files.get(i).getaId()) {
	              		%>
	              			<a href="<%=request.getContextPath()%>/detail.sh?sbno=<%=tags.get(j).getTag()%>"><%=upgradeTags.get(j).getpTitle()%></a><br>
	              	 	<%
	              	 		}
	              	 	%>
	              	<%
	              		}
	              	%>
	            </div>
	            <br>
	              <div class="content">
	              	<%=contents.get(i)%>
	              </div>
	              <br><br>
              <%
              	}
              %>
                <br>
              </td>
            </tr>
          </tbody>
        </table>
        <br><br>
        <div class="row">
          <div class="col-md-12" align="right">
          	<%
          		if(loginMember != null && loginId.equals(recipe.getmId())) {
          	%>
		      <button type="button" onclick="updateRecipe()">수정</button>
		      <button type="button" onclick="deleteRecipe()">삭제</button>
          	<%
          		}
          	%>
          </div>
        </div>
        <br><br>
        <div class="row">
          <div class="col-md-12" align="center">
          	<input type="hidden" value="<%=recipe.getbNo()%>">
          	<span style="font-weight: bold;"><%=recipe.getbUp()%></span>&nbsp;
            <button type="button" id="up" style="width: 100px; background-color: white; color: blue; border: 1px solid black;">추천</button>
            <button type="button" id="down" style="width: 100px; background-color: white; color: red; border: 1px solid black;">비추천</button>
          	&nbsp;<span style="font-weight: bold;"><%=recipe.getbDown()%></span>
          </div>
        </div>
        <br><br>
        <div class="row">
          <div class="col-md-12" align="left">
            <button type="button" onclick="goBack();">목록으로</button>
          </div>
        </div>
        <br><br>
        <div class="full-right" align="center">
          <div id="advertisement" style="width: 800px; height: 200px;">
            <img src="<%=request.getContextPath()%>/images/ad.jpg" id="ad">
          </div>
        </div>
        <br>

        <div class="container">
          <hr>
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
                		for(RComment c : replys) {
                	%>
                		<%if(c.getDepth() == 0) {%>	<!-- 댓글 -->
                	<tr>
                		<td class="groupNo">
	                		<p style="display:none;"><%=c.getRcno()%></p>		
	                		<p><%=c.getGroupNo() %></p>
                		</td>
                		<td class="commentArea">
                			<p><%=c.getrComment() %></p>
                			<textarea class="updateContent" style="display:none;" cols="50px"><%=c.getrComment() %></textarea>
                		</td>
                		<td><%=c.getmNickname() %></td>
                		<td><%=c.getrDate() %></td>
                		<td><button class="lookReplys group<%=c.getGroupNo() %>">답글</button>&nbsp;
                		<%if( loginMember != null ) { %>
                			<%if( loginMember.getMnickname().equals("관리자") || loginMember.getMnickname().equals(c.getmNickname()) ) {%>
                		<button class="changeTextarea">수정</button>&nbsp;
                		<button class="changeReply deleteComment">삭제</button></td>
                			<%} %>
                		<%} else { 
                			//로그인하지 않았을 경우 스킵
                		}%>
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
	                		<p style="display:none;"><%=c.getRcno()%></p>		
	                		<p style="display:none;"><%=c.getParentNo() %></p>
						</td>
                		<td class="commentArea">
                			<p><%=c.getrComment() %></p>
                			<textarea class="updateContent" style="display:none;" cols="50px"><%=c.getrComment() %></textarea>
                		</td>
                		<td><%=c.getmNickname() %></td>
                		<td><%=c.getrDate() %></td>
                		<td>
                		<%if( loginMember != null ) { %>
                			<%if( loginMember.getMnickname().equals("관리자") || loginMember.getMnickname().equals(c.getmNickname()) ) {%>
                		<button class="changeTextarea">수정</button>&nbsp;
                		<button class="changeReply deleteReply">삭제</button>
                			<%} %>
                		<%} else { 
                			//로그인하지 않았을 경우 스킵
                		}%>
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
      </div>
      <!-- /.col-lg-9 -->
      <div class="col-lg-1">
         <%if(loginMember != null && loginSeller == null) { %>
         <input type="hidden" id="loginStatus" value="1">
        <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
             <%=loginMember.getMnickname() %><br>반갑습니다!<br><br>
          <a href="#" style="color: white; margin-bottom: 10px;"
          	onclick="location.href='<%=request.getContextPath()%>/mypage/mypageUpdate.jsp'">마이페이지</a>
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
             <button onclick="login();">로그인</button><br><br>
             <a href="#" style="color: white; margin-bottom: 10px;"
          	onclick="location.href='<%=request.getContextPath()%>/mypage/nmOrderSearch.jsp'">비회원 주문정보</a>
        </div>
        <%} else { %>
        <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
             <button onclick="login();">로그인</button><br><br>
                <a href="#" style="color: white; margin-bottom: 10px;"
          	onclick="location.href='<%=request.getContextPath()%>/mypage/nmOrderSearch.jsp'">비회원 주문정보</a>
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
  <!-- footer -->
  <%@ include file="../static/bottom.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath() %>/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath() %>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script>
    var bno = <%=recipe.getbNo()%>;
    $(function(){
      
      $(".image").click(function(){
    	 $(this).parent().next().toggle(); 
      });
      
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
			<%if(loginMember != null){ %>
				var actionType= $(this).attr("class").split(" ")[1];
				var rcno = 0;
				var writer = "<%=loginMember.getMid()%>";
				var bno = <%=recipe.getbNo()%>;
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
						rcno = y.textContent;
					}
					else{
						return false;
					}
				}
				else if(actionType === "update"){
					var y = $(this).parent().siblings()[0].children[0];
					rcno = y.textContent;
					content = $(this).parent().siblings(".commentArea").children('textarea').val();
				}
				
				if(content == "" && (actionType.indexOf("add") >= 0)){
					alert("내용을 입력해주세요.");
					return;
				}
				
				$.ajax({
					url:"changeComment.re",
					type:"post",
					data:{rcno:rcno,
							bno:bno,
							rComment:content, 
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
									var $p1 = $("<p>").css("display", "none").text(data[i].rcno);
									var $p2 = $("<p>").text(data[i].groupNo);
									$firstTd.append($p1);
									$firstTd.append($p2);
									
									var $secondTd = $("<td>");
									var $p = $("<p>");
									$p.text(data[i].rComment);
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
									$fourthTd.text(data[i].rDate);
									
									var $fifthTd = $("<td>");
									var loginMember = "${loginMember.mnickname}";
									if( (loginMember != null && data[i].mNickname == loginMember) || loginMember == "관리자" ){
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
									var $p1 = $("<p>").css("display", "none").text(data[i].rcno);
									var $p2 = $("<p>").css("display", "none").text(data[i].parentNo);
									$firstTd.append($p1);
									$firstTd.append($p2);
									
									var $secondTd = $("<td>");
									var $p = $("<p>");
									$p.text(data[i].rComment);
									var $textarea = $("<textarea>");
									$textarea.addClass('updateContent');
									$textarea.css("display", "none");
									$textarea.attr("cols", "50px");
									$textarea.val($p.text());
									$secondTd.addClass("commentArea");
									$secondTd.append($p);
									$secondTd.append($textarea);
									
									var $thirdTd = $("<td>").text(data[i].mNickname);
									
									var $fourthTd = $("<td>").text(data[i].rDate);
									
									var $fifthTd = $("<td>");
									var loginMember = "${loginMember.mnickname}";
									if( (loginMember != null && data[i].mNickname == loginMember) || loginMember == "관리자" ){
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
					    console.log("error qnaboard_detail.jsp Comment ajax");
					}
				}); 
				
				
			<%}else { %>
				if(confirm("해먹자 회원 로그인이 필요합니다. 로그인 하시겠어요?")){
					login();
				}
				else{
					return false;
				}
			<%} %>
		});
    });
    
    function login(){
  		location.href="<%=request.getContextPath()%>/member/loginHaemukja.jsp";
  	}
    
  	function logout(){
  		location.href="<%=request.getContextPath()%>/logout.me";
  	}
  	
  	function updateRecipe() {
  		location.href="<%=request.getContextPath()%>/select.re?bNo=<%=recipe.getbNo()%>&nCode=<%=recipe.getnCode()%>";
  	}
  	
  	function deleteRecipe() {
  		location.href="<%=request.getContextPath()%>/delete.re?bNo=<%=recipe.getbNo()%>&nCode=<%=recipe.getnCode()%>";
  	}
  	
  	function goBack(){
   	 	history.back();
    }

  	$(function(){
  		$("#up").click(function(){
  			var bNo = $(this).parent().children("input").val();
  			
  			location.href="<%= request.getContextPath() %>/up.re?bNo=" + bNo;
  			
  			alert("추천 +1");
  		});
  		
  		$("#down").click(function(){
  			var bNo = $(this).parent().children("input").val();
  			
  			location.href="<%= request.getContextPath() %>/down.re?bNo=" + bNo;
  			
  			alert("추천 -1");
  		});
  	})
  	
  </script>

</body>
</html>