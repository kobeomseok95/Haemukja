<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*,mypage.model.vo.*,java.util.ArrayList,common.Attachment" %>
<%
   Member loginMember = (Member)session.getAttribute("loginMember");
   Seller loginSeller = (Seller)session.getAttribute("loginSeller");
   
   ArrayList<MyOrder> list = (ArrayList<MyOrder>)request.getAttribute("list");
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   ArrayList<Attachment> flist = (ArrayList<Attachment>)request.getAttribute("flist");
   int listCount = pi.getListCount();
   int currentPage = pi.getCurrentPage();
   int maxPage = pi.getMaxPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>교환/환불</title>

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
            <h3>교환/환불</h3>
            <hr>
            <table class="table">
              <thead>
                <th style="width: 100px;"></th>
                <th style="width: 300px;">제품명</th>
                <th style="width: 100px;">구매일자</th>
                <th style="width: 100px;">신청일자</th>
                <th style="width: 100px;">처리여부</th>
              </thead>
              <%if(!list.isEmpty()){ %>
              <tbody>
              
                 <%for(MyOrder mo : list){ %>
                <tr>
                  <td style="width: 100px;">
                  <%for(int i =0; i<flist.size();i++){ %>
                   <%Attachment a = flist.get(i); %>
                     <%if(mo.getSbno()== a.getSbNo()){ %>
                     <img src="<%=request.getContextPath()%>/uploadFiles/<%=a.getFileName()%>" style="width:100px; height:80px;" >
                     <%} %>
                  <%} %>
                  </td>
                  <td style="width: 300px;"><%=mo.getPtitle() %></td>
                  <td style="width: 100px;"><span><%=mo.getOdate() %></span></td>
                  <td style="width: 100px;"><span><%=mo.getRefdate() %></span></td>
                  <td style="width: 100px;"><span><%=mo.getOname() %></span></td>
                </tr>
                <%} %>
                
              </tbody>
              <%}else{ %>
                 <tbody>
                  <tr>
                  <td style="width: 100px;"></td>
                  <td style="width: 300px;"></td>
                  <td style="width: 100px;"><span></span></td>
                  <td style="width: 100px;"><span></span></td>
                  <td style="width: 100px;"><span></span></td>
                </tr>
                 
                 </tbody>
                 
              <%} %>
            </table> <!-- table -->
          </div>
        </div>
     <br><br>
     <div class="row">
      <div class="col-sm-12" style="text-align: center; font-size: 25px;">
         <!-- 맨 처음으로(<<) -->
         <button class="paging" onclick="location.href='<%=request.getContextPath() %>/refund.my?currentPage=1'"> << </button>
         
         <!-- 이전 페이지로(<) -->
         <%if(currentPage == 1){ %>
         <button class="paging" disabled> < </button>
         <%}else{ %>
         <button class="paging" onclick="location.href='<%=request.getContextPath() %>/refund.my?currentPage=<%=currentPage - 1 %>'"> < </button>
         <%} %>
         
         <!-- 10개의 페이지 목록 -->
         <%for(int p = startPage ; p<=endPage ; p++){ %>
            <%if(currentPage == p){ %>
               <button class="paging" disabled><%=p %></button>
            <%} else {%>
               <button class="paging" onclick="location.href='<%=request.getContextPath() %>/refund.my?currentPage=<%=p %>'"><%=p %></button>
            <%} %>
         <%} %>
         <!-- 다음 페이지로(>) -->
         <%if(currentPage == maxPage){ %>
         <button class="paging" disabled> > </button>
         <%}else{ %>
         <button class="paging" onclick="location.href='<%=request.getContextPath() %>/refund.my?currentPage=<%=currentPage + 1 %>'"> > </button>
         <%} %>
         
         <!-- 맨 끝으로(>>) -->
         <button class="paging" onclick="location.href='<%=request.getContextPath() %>/refund.my?currentPage=<%=maxPage%>'"> >> </button>
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
    <!-- /.row -->
  </div>
  <!-- /.container -->
  <br><br>
  <!-- Footer -->
   <%@ include file="../static/bottom.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   
   <script>
     
        function logout(){
           location.href="<%=request.getContextPath()%>/logout.me";
        }

   </script>
</body>

</html>