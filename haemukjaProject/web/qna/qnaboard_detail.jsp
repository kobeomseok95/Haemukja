<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="qna.model.vo.*,
	member.model.vo.*,
	java.sql.Date,
	java.util.*"
%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	Qna qna = (Qna)request.getAttribute("qna");
	ArrayList<Comment> replys = (ArrayList<Comment>)request.getAttribute("comment");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>문의게시글</title>
  <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
   <script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
   <script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
   <script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
   <style>
   @import url(https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap);*{font-family:'Nanum Gothic',sans-serif;font-size:15px}.logo{height:80px}.list-group a{font-size:18px;font-weight:700}.list-group-item{border-style:none}.panel-heading{background-color:orange;text-align:center;line-height:50px;vertical-align:middle;color:#fff;font-size:20px;font-weight:700}#login{background-color:orange;text-align:center;width:150px;height:200px;border-radius:15px;position:fixed}#loginBtn{background-color:#323232;text-align:center;border:none;border-radius:3px;color:#fff}a{color:#000;text-decoration:none}a:hover{color:orange;text-decoration:none}button{background-color:#323232;text-align:center;border:none;border-radius:3px;color:#fff}footer{background-color:#e6e6e6;height:200px}.notice{background-color:#ffbfdd}#write{text-align:right}.btn{float:right;background-color:#323232;color:#fff}.shipInfoBox{display:none}.form-control{display:inline}.result{border-style:none}
	td:nth-child(2) {
		width: 300px;
	}
   </style>
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
    integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
    crossorigin="anonymous"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
    integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
    crossorigin="anonymous"></script>
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
          <div class="panel-heading">문의게시판</div>
        </div>
        <!-- /panel -->
          
          <!-- table -->
          <table class="table">
            <thead>
              <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일자</th>
              </tr>
            </thead>
            <tbody>
              <%if (qna != null) {%>
              <tr>
                <td><%=qna.getQid() %></td>
                <td><%=qna.getQtitle() %></td>
                <td><%=qna.getMnickname() %></td>
                <td><%=qna.getQdate() %></td>
              </tr>
              <tr>
                <td colspan='4' align="left">
                  <%=qna.getQcontent() %>
                </td>
              </tr>
              <%} %>
            </tbody>
          </table>
          <br><br>
          <div class="row">
          	<div class="col-md-6" align="left">
          		<button onclick="location.href='qna.qn'">목록으로</button>
            </div>
            <div class="col-md-6" align="right">
              <!-- 업데이트 하기 전에 먼저 불러오기 로그인 확인하기-->
				<%if(loginMember != null && loginMember.getMnickname().equals(qna.getMnickname())) {%>
	              <button onclick="location.href='<%=request.getContextPath()%>/upload.qn?qid='+qid">수정하기</button>
    	          <button onclick="deleteQna();">삭제하기</button>
            	<%} else if(loginMember != null && loginMember.getMid().equals("admin")) {%>
            		<button onclick="deleteQna();">삭제하기</button>
            	<%} %>
            </div>
          </div>
          <br><br><br><br><br>
          <!-- /table -->
          <!-- comment -->
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
                <%if(replys.isEmpty()) {%>
	                <tr>
		                <td colspan='5'>
		                	댓글이 없습니다.
		                </td>
		            </tr>
                <%} else { %>
                	<%for(Comment c : replys) {%>
                		<%if(c.getDepth() == 0) {%>	<!-- 댓글 -->
                	<tr>
                		<td class="groupNo">
	                		<p style="display:none;"><%=c.getQcno()%></p>		
	                		<p><%=c.getGroupNo() %></p>
                		</td>
                		<td class="commentArea">
                			<p><%=c.getqComment() %></p>
                			<textarea class="updateContent" style="display:none;" cols="50px"><%=c.getqComment() %></textarea>
                		</td>
                		<td><%=c.getmNickname() %></td>
                		<td><%=c.getqDate() %></td>
                		<td><button class="lookReplys group<%=c.getGroupNo() %>">답글</button>&nbsp;
                		<%if(loginMember != null && loginMember.getMnickname().equals(c.getmNickname())) { %>	
                		<button class="changeTextarea">수정</button>&nbsp;
                		<button class="changeReply deleteComment">삭제</button></td>
                		<%} %>
                	</tr>
                	<tr class="hideReplys group<%=c.getGroupNo() %>" style="display:none;">
						<td colspan="4">
							<textarea class="replyContent" cols="77px"></textarea>
						</td>
						<td>
							<button class="changeReply addReply">답글작성</button>
						</td>
					</tr>
                		<%} else{ %>	<!-- 답글 -->
					<tr class="hideReplys group<%=c.getGroupNo() %>" style="display:none;">
						<td>
	                		<p style="display:none;"><%=c.getQcno()%></p>		
	                		<p style="display:none;"><%=c.getParentNo() %></p>
						</td>
                		<td class="commentArea">
                			<p><%=c.getqComment() %></p>
                			<textarea class="updateContent" style="display:none;" cols="50px"><%=c.getqComment() %></textarea>
                		</td>
                		<td><%=c.getmNickname() %></td>
                		<td><%=c.getqDate() %></td>
                		<td>
                		<%if(loginMember != null && loginMember.getMnickname().equals(c.getmNickname())) { %>	
                		<button class="changeTextarea">수정</button>&nbsp;
                		<button class="changeReply deleteReply">삭제</button>
                		<%} %>
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
          <!-- comment -->
      </div>
      <!-- /.col-lg-9 -->
      <div class="col-lg-1">
			<%if(loginMember != null) { %>
        <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
          	<%=loginMember.getMnickname() %><br>반갑습니다!<br><br>
          <a href="sellerpage_register.html" style="color: white; margin-bottom: 10px;">마이페이지</a>
          <br>
          <button type="button" id="loginBtn" onclick="logout();">로그아웃</button>
        </div>
		<%} else { %>
        <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
          	<button onclick="login();">로그인</button>
        </div>	
        <%}%>
      </div>
    </div>
    <!-- /.row -->
    <br>
  </div>
  <!-- /.container -->
  <br><br>
  <!-- Footer -->
  <%@ include file="../static/bottom.jsp"%>

  <script>
  	var qid = <%=qna.getQid()%>;
  	function login(){
		location.href="<%=request.getContextPath()%>/member/loginHaemukja.jsp";
	}
	function logout(){
		location.href="<%=request.getContextPath()%>/logout.me";
	}
	function deleteQna(){
		location.href="<%=request.getContextPath()%>/del.qn?qid=" + qid;
	}
	
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
			<%if(loginMember.getMnickname().equals(qna.getMnickname()) || loginMember.getMid().equals("admin")){ %>
				var qcno = 0;
				var actionType= $(this).attr("class").split(" ")[1];
				var writer = "<%=loginMember.getMid()%>";
				var qid = <%=qna.getQid()%>;
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
					var flag = confirm("해당 댓글을 삭제하시겠습니까?");
					if(flag){
						var y = $(this).parent().siblings()[0].children[0];
						qcno = y.textContent;
					}
					else{return;}
				}
				else if(actionType === "update"){
					var y = $(this).parent().siblings()[0].children[0];
					qcno = y.textContent;
					content = $(this).parent().siblings(".commentArea").children('textarea').val();
				}
				$.ajax({
					url:"changeComment.qn",
					type:"post",
					data:{qcno:qcno,
							qid:qid,
							qComment:content, 
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
									var $p1 = $("<p>").css("display", "none").text(data[i].qcno);
									var $p2 = $("<p>").text(data[i].groupNo);
									$firstTd.append($p1);
									$firstTd.append($p2);
									
									var $secondTd = $("<td>");
									var $p = $("<p>");
									$p.text(data[i].qComment);
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
									$fourthTd.text(data[i].qDate);
									
									var $fifthTd = $("<td>");
									$fifthTd.html("<button class='lookReplys group" + data[i].groupNo + "'>답글</button>&nbsp;<button class='changeTextarea'>수정</button>&nbsp;<button class='changeReply deleteComment'>삭제</button>");
									
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
									var $p1 = $("<p>").css("display", "none").text(data[i].qcno);
									var $p2 = $("<p>").css("display", "none").text(data[i].parentNo);
									$firstTd.append($p1);
									$firstTd.append($p2);
									
									var $secondTd = $("<td>");
									var $p = $("<p>");
									$p.text(data[i].qComment);
									var $textarea = $("<textarea>");
									$textarea.addClass('updateContent');
									$textarea.css("display", "none");
									$textarea.attr("cols", "50px");
									$textarea.val($p.text());
									$secondTd.addClass("commentArea");
									$secondTd.append($p);
									$secondTd.append($textarea);
									
									var $thirdTd = $("<td>").text(data[i].mNickname);
									
									var $fourthTd = $("<td>").text(data[i].qDate);
									
									var $fifthTd = $("<td>");
									$fifthTd.html("<button class='changeTextarea'>수정</button>&nbsp;<button class='changeReply deleteReply'>삭제</button>");
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
				//그렇지 않을때
				alert('해당 게시글의 글쓴이, 관리자만 작성할 수 있습니다.');
			<%} %>
		});
	});
  </script>
</body>

</html>