<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, member.model.vo.*, recipe.model.vo.*, common.Attachment"%>
<%

	Member loginMember = (Member)session.getAttribute("loginMember");
	Seller loginSeller = (Seller)session.getAttribute("loginSeller");
	Recipe recipe = (Recipe)request.getAttribute("recipe");
	ArrayList<String> contents = (ArrayList<String>)request.getAttribute("contents");
	ArrayList<Attachment> files = (ArrayList<Attachment>)request.getAttribute("files");
	ArrayList<Tag> tags = (ArrayList<Tag>)request.getAttribute("tags");
	ArrayList<RComment> comments = (ArrayList<RComment>)request.getAttribute("comments");
	
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
          <div class="panel-heading">&nbsp;<%=panelName %></div>
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
              <td style="width: 100px;"><%= recipe.getbNo() %></td>
              <td style="width: 300px;"><%= recipe.getbTitle() %></td>
              <td style="width: 100px;"><%= nickname %></td>
              <td style="width: 100px;"><%= recipe.getbDate() %></td>
              <td style="width: 70px;"><%= recipe.getbViews() %></td>
            </tr>
            <tr>
              <td colspan='5' align="center">
              <% for(int i = 0; i < files.size(); i++) { %>
              	<i class="no"><%= i+1 %></i>
              	<div class="imageArea">
              		<img src="<%= request.getContextPath() %>/uploadFiles/<%= files.get(i).getFileName() %>" class="image">
              	</div>
              	<div class="tag">
	              	<% for(int j = 0; j < tags.size(); j++) { %>
	              		<% if(tags.get(j).getaId() == files.get(i).getaId()) { %>
	              			<a href="<%=request.getContextPath()%>/detail.sh?sbno=<%=tags.get(j).getTag() %>"><%=tags.get(j).getTag() %></a>
	              	 	<% } %>
	              	<% } %>
	            </div>
	              <div class="content">
	              	<%= contents.get(i) %>
	              </div>
	              <br><br>
              <% } %>
                <br>
              </td>
            </tr>
          </tbody>
        </table>
        <br><br>
        <div class="row">
          <div class="col-md-12" align="right">
          	<% if(loginMember != null && loginId.equals(recipe.getmId())) { %>
		      <!-- <button type="button">수정</button> -->
		      <button onclick="deleteRecipe()">삭제</button>
          	<% } %>
          </div>
        </div>
        <br><br>
        <div class="row">
          <div class="col-md-12" align="center">
          	<input type="hidden" value="<%= recipe.getbNo() %>">
          	<span style="font-weight: bold;"><%= recipe.getbUp() %></span>&nbsp;
            <button type="button" id="up" style="width: 100px; background-color: white; color: blue; border: 1px solid black;">추천</button>
            <button type="button" id="down" style="width: 100px; background-color: white; color: red; border: 1px solid black;">비추천</button>
          	&nbsp;<span style="font-weight: bold;"><%= recipe.getbDown() %></span>
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
            <img src="<%=request.getContextPath() %>/images/ad.jpg" id="ad">
          </div>
        </div>
        <br>

        <div class="container">
          <hr>
          <!-- 댓글테이블 -->
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
              	<%if(comments.isEmpty()){ %>
              		<tr>
              			<td colspan='4'>댓글이 없습니다.</td>
              		</tr>
              	<%} else {%>
					<%for(RComment r : comments) {%>
						<tr>  
		                  <td><%=r.getrNo() %></td>
		                  <td><%=r.getCcoment() %></td>
		                  <td><%=r.getNickname() %></td>
		                  <td><%=r.getcDate() %></td>
		                  <td><button class="replyBtn">답글 작성</button></td>
		                </tr>
		                <tr class="replyText">
		                  <form method="get" action="#">
		                    <td colspan="4">
		                      <textarea rows="2" cols="85" name="reply"></textarea>
		                    </td>
		                    <td>
		                      <button type="submit">답글 등록</button>
		                    </td>
		                  </form>
		                </tr> 
					<%} %>
				<%} %>
              </tbody>
            </table>
          <!-- /댓글테이블 -->

            <div class="form-horizontal">
                <div class="form-group">
                  <label>댓글</label>
                  <textarea class="form-control" rows="2" id="commentContent"></textarea>
                  <br>
                  <div align="right">
                    <button id="addReply">등록</button>
                  </div>
                </div>
            </div>
            
          </div>
      </div>
      <!-- /.col-lg-9 -->
      <div class="col-lg-1">
         <%if(loginMember != null && loginSeller == null) { %>
        <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
             <%=loginMember.getMnickname() %><br>반갑습니다!<br><br>
          <a href="sellerpage_register.html" style="color: white; margin-bottom: 10px;">마이페이지</a>
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
             <button onclick="login();">로그인</button>
        </div>
        <%} else { %>
        <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
             <button onclick="login();">로그인</button>
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
    $(function(){
      $(".replyText").hide();
      $(".image").click(function(){
        $(this).next().toggle();
      });
      $(".replyBtn").click(function(){
        $(this).parent().parent().next().toggle();
      });
      $(".image").click(function(){
    	 $(this).parent().next().toggle(); 
      });
      $("#addReply").click(function(){	//데이터를 집어 넣은 다음, 쿼리문이 실행되어 여기 실행되게 끔 한다.
			<%if(loginMember != null){ %>
				var writer = "<%=loginMember.getMid()%>";
				var bid = <%=recipe.getbNo()%>;
				var content = $("#commentContent").val();
				
				$.ajax({
					url:"insertComment.bd",
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
							var $writerTd = $("<td>").text(data[key].nickname);
							var $replyButton = $('<td><button class="replyBtn">답글 작성</button></td>');
							var $dateTd = $("<td>").text(data[key].cdate);
							
							$tr.append($noTd);
							$tr.append($contentTd);
							$tr.append($writerTd);
							$tr.append($dateTd);
							$tr.append($replyButton);
							$commentTable.append($tr);
							
							var $tr2 = $("<tr class='replyText'>");
							$tr2.append("<form method='get' action='#'><td colspan='4'><textarea rows='2' cols='85' name='reply'></textarea></td><td><button type='submit'>답글 등록</button></td></form>");
							$commentTable.append($tr);
							
						}
						$("#commentContent").val("");
					},
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					   }
				});
				
			<%} else { %>
				//그렇지 않을때
				alert('로그인 후 작성하실 수 있습니다.');
			<%}%>
			
		});
    });
    
    function login(){
  		location.href="<%=request.getContextPath()%>/member/loginHaemukja.jsp";
  	}
    
  	function logout(){
  		location.href="<%=request.getContextPath()%>/logout.me";
  	}
  	
  	function deleteRecipe() {
  		location.href="<%=request.getContextPath()%>/delete.re?bNo=<%=recipe.getbNo()%>&nCode=<%=recipe.getnCode()%>";
  	}
  	function goBack(){
   	 	history.back();
    }
  	function pleaseLogin(){
  		<%if(loginMember == null){%>
  			alert("일반회원에게만 권한이 있습니다.");
  			//그리고 비회원일 경우 작성 불가하게끔
  		<%}%>
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