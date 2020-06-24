<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="member.model.vo.*,mypage.model.vo.*,java.util.ArrayList,common.Attachment,product.model.vo.*"%>
<% 
	Member loginMember = (Member)session.getAttribute("loginMember");
    Seller loginSeller = (Seller)session.getAttribute("loginSeller");
    ArrayList<Attachment> flist = (ArrayList<Attachment>)request.getAttribute("flist");
    String msg = (String)request.getAttribute("msg");
	ArrayList<Review> review = (ArrayList<Review>)request.getAttribute("review");
    
	
%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>주문/배송</title>

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
  
    table {
      text-align: center;
    }
    td>button {
      width: 80px;
      margin: 2px;
    }
    td>img {
      width: 50px;
    }
    .shipInfo {
      display: none;
    }
    
    .paging {
       font-size: 20px;
       background-color: orange;
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
       <div class="list-group">
          <%@ include file="../static/mypageStatic.jsp"%>
        </div>

      </div>
      <!-- /.col-lg-2 -->

      <div class="col-lg-9">
        <!-- panel -->
        <div class="panel panel-default">
          <div class="panel-heading">&nbsp;마이페이지</div>
        </div>
        <!-- /panel -->
        <br>
        <div class="container">
          <div class="row">
            <h3>주문/배송</h3>
            <hr>
            <table class="table">
              <thead>
                <th style="width: 50px;"></th>
                <th style="width: 100px;">번호</th>
                <th style="width: 100px;">작성자</th>
                <th style="width: 300px;">리뷰내용</th>
                <th style="width: 100px;">구매날짜</th>
                <th style="width: 100px;">리뷰수정</th>
              </thead>
              <%if(!review.isEmpty()){ %>
              <tbody>
              
              <%int z=0; %>
              <%for(Review r : review){ %>
  				<%z++; %>
              <tr>
                  <td style="width: 50px;">
                  <%for(int i =0; i<flist.size();i++){ %>
                  <%Attachment a = flist.get(i); %>
                  <%if(r.getSbno()== a.getSbNo()){ %>
                     <img src="<%=request.getContextPath()%>/uploadFiles/<%=a.getFileName()%>" style="width:100px; height:80px;" >
                  <%} %>
                  <%} %>
                 
                  </td>
                  <td style="width: 100px;"><%=z %></td>
                  <%-- <input type="hidden" name="oid" value=<%=mo.getOid()%>>
                  <input type="hidden" name="pid" value=<%=mo.getPid()%>> --%>
                  <td style="width: 100px;"><%=r.getName() %></td>
                  <td style="width: 300px;"><%=r.getContent() %></td>
                  <td style="width: 100px;"><%=r.getOdate() %></td>
                  <td style="width: 100px;"><button type="button" class="reviewBtn">리뷰수정</button><br>
              	  <button type="button" id="reBuy" onclick="location.href='<%=request.getContextPath()%>/detail.sh?pid=<%=r.getPid()%>&sbno=<%=r.getSbno()%>'">재구매</button></td>
              </tr>
              <tr class="reviewBox" style="display: none">
                <form action = "<%=request.getContextPath()%>/updateReview.sh" method="post" id="reviewForm">
                <input type="hidden" name="odate" value="<%=r.getOdate()%>">
                <input type="hidden" name="sbno" value="<%=r.getSbno()%>">
                <input type="hidden" name="oid" value="<%=r.getOid() %>">
                <input type="hidden" name="pid" value="<%=r.getPid() %>">
          		 <td colspan="5"><textarea cols="80" rows="5" name="review" style="resize: none"><%=r.getContent() %></textarea></td>
                 <td colspan="5"><button type="submit">수정하기</button></td>
                </form>
              </tr>
              
           	  <%} %>
              </tbody>
              <%}else{ %>
              <tbody>
              
              </tbody>
              
              
              <%} %>
              
            </table> <!--/table-->
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
             <%=loginMember.getMnickname() %><br>반갑습니다!<br>
          <a href="#" style="color: white; margin-bottom: 10px;" 
          onclick="location.href='<%=request.getContextPath() %>/mypage/mypageUpdate.jsp'">마이페이지</a>
          <br>
          <button type="button" id="loginBtn" onclick="logout();">로그아웃</button>
        </div>
        <%} else if (loginMember == null && loginSeller != null){ %>
          <div id="login">
          <br>
          <i class="fas fa-user" style="font-size: 30px;"></i>
          <br><br>
             <%=loginSeller.getCompany() %><br>반갑습니다!<br>
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
  
  </div>
  <!-- /.container -->
  <br><br><br><br>
  <!-- Footer -->
  <%@ include file="../static/bottom.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <script>
     <%if(msg!=null){%>
        alert("리뷰 수정이 완료 되었습니다");
     <%}%>
  
    $(function(){
      $(".reviewBtn").click(function(){
        console.log($(this).parent().parent().next().toggle());
      });
    });
    
  
    
    
    function logout(){
       location.href="<%=request.getContextPath()%>/logout.me";
     }
  </script>

</body>

</html>