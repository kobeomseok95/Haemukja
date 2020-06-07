<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="qna.model.vo.*,
	member.model.vo.*,
	java.sql.Date,
	java.util.*"
%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	/* Seller loginSeller = (Seller)session.getAttribute("loginSeller"); */
	
	Qna qna = (Qna)request.getAttribute("qna");
	/* int qid = qna.getQid();
	String title = qna.getQtitle();
	String nickname = qna.getMnickname();
	Date qdate = qna.getQdate();
	String content = qna.getQcontent(); */
	
	ArrayList<Comment> replys = (ArrayList<Comment>)request.getAttribute("comment");	//댓글
	
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
                </tr>
              </thead>
              <tbody id="commentTable">
                <%if(replys.isEmpty()) {%>
	                <tr>
		                <td colspan='4'>
		                	댓글이 없습니다.
		                </td>
		            </tr>
                <%} else {%>
                	<%for(int i = 0; i < replys.size(); i++) {%>
                		<tr>
                			<td><%=replys.get(i).getRnum() %></td>
                			<td><%=replys.get(i).getComment() %></td>
                			<td><%=replys.get(i).getWriter() %></td>
                			<td><%=replys.get(i).getCdate() %></td>
                		</tr>
                	<%} %>
                <%} %>
              </tbody>
            </table>
	            <div class="form-horizontal">
	            	<!-- 여기는 댓글 작성하는 곳 -->
	                <div class="writeGroup">
	                  <label>댓글</label>
	                  <textarea class="form-control" rows="2" id="commentContent"></textarea>
	                </div>
	                <div align="right">
	                  <button id="addReply">등록</button>
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
		location.href="<%=request.getContextPath()%>/del.qn?qid="+qid;
	}
	$(function(){
		$("#addReply").click(function(){	//데이터를 집어 넣은 다음, 쿼리문이 실행되어 여기 실행되게 끔 한다.
			<%if(loginMember.getMnickname().equals(qna.getMnickname()) || loginMember.getMid().equals("admin")){ %>
				//로그인 유저와 글쓴이가 일치할때
				var writer = "<%=loginMember.getMid()%>";
				var bid = <%=qna.getQid()%>;
				var content = $("#commentContent").val();
				
				$.ajax({
					url:"writeComment.qn",
					type:"post",
					data:{writer:writer, content:content, bid:bid},
					// InsertReplyServlet 만들러 가자!!!
					
					//다 작성후 여기볼것
					success:function(data){
						$commentTable = $("#commentTable");
						$commentTable.html(""); // 기존 테이블 정보 초기화
						
						for(var key in data){
							//rlistArray > rlistObj(comment 객체의 필드값들)
							
							var $tr = $("<tr>");
							var $noTd = $("<td>").text(data[key].rnum);
							var $contentTd = $("<td>").text(data[key].comment);
							var $writerTd = $("<td>").text(data[key].writer);
							var $dateTd = $("<td>").text(data[key].cdate);
							
							$tr.append($noTd);
							$tr.append($contentTd);
							$tr.append($writerTd);
							$tr.append($dateTd);
							$commentTable.append($tr);
						}
						
						// 댓글 작성 부분 리셋
						$("#commentContent").val("");
					},
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					   }
				});
				
			<%} else { %>
				//그렇지 않을때
				alert('해당 게시글의 글쓴이, 관리자만 작성할 수 있습니다.');
			<%}%>
			
		});
	});
  </script>
</body>

</html>