<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*,mypage.model.vo.*,java.util.ArrayList,common.Attachment"%>
<%
   Member loginMember = (Member)session.getAttribute("loginMember");
   Seller loginSeller = (Seller)session.getAttribute("loginSeller");
   ArrayList<MCart> list = (ArrayList<MCart>)request.getAttribute("list");
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

  <title>장바구니</title>

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
            <h3>장바구니</h3>
            <hr>
            <form class="table" id="productRegisterForm" action="<%=request.getContextPath()%>/member.me" method="post">
              <table class="table">
                <thead>
                  <tr align="center">
                   <!--  <th>
                      <input type="checkbox" name="checkbox" class="check" id="checkAll">
                    </th> -->
                    <th style="width: 150px"><span></span></th>
                    <th style="width: 500px;"><span>상품명</span></th>
                    <th>수량</th>
                    <th style="width: 100px">선택</th>
                  </tr>
                </thead>
               <%if(!list.isEmpty()){ %>
                <tbody>
             
                <%for(int i =0; i<list.size(); i++){ 
                MCart m = list.get(i);%>
                <input type="hidden" name="price" value="<%=list.get(i).getPprice() %>">
                <input type="hidden" name="product" value=" <%=list.get(i).getPtitle() %>" >
                <input type="hidden" name="cid" value="<%=list.get(i).getCid()%>">
                <input type="hidden" name="sbno" value="<%=list.get(i).getSbno()%>">
                  <tr style="height: 90px;">
                
                    <td style="border-left: none; border-right: none;">
                       <%for(int j = 0; j < flist.size(); j++){%>
                       <% Attachment a = flist.get(j); %>
                       <%if(a.getSbNo() == m.getSbno()){ %>
                       <img src="<%= request.getContextPath()%>/uploadFiles/<%=a.getFileName() %>" width="100px" height="70px">
                        <%} %>
                        <%} %>
                    </td>
                    <td style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">
                       <%=list.get(i).getPtitle() %>
                    </td>
                    <td style="width: 80px;">
                      <input type="number" name="pcount" style="text-align: right; width: 43px; margin-bottom: 5px;" min="1" max="99" step="1" value="<%=list.get(i).getCamount()%>">
                    </td>
                    <td>
                      <button type="button" onclick="location.href='<%=request.getContextPath()%>/member.me?product=<%=list.get(i).getPtitle()%>&pcount=<%=list.get(i).getCamount()%>&price=<%=list.get(i).getPprice()%>&cid=<%=list.get(i).getCid()%>&sbno=<%=list.get(i).getSbno()%>'">주문</button>
                      
                    </td>
                  </tr>
                
                   
                  <%} %>
                  
                  
                </tbody>
                <%}else{ %>
                <tbody>
             
              
                
                  <tr style="height: 90px;">
                      <td style="border-left: none; border-right: none;"></td>
                     <td style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;"></td>
                     <td style="width: 80px;"></td>
                     <td></td>
                  </tr>
                </tbody>
                
                 <%} %>
              </table> <!-- table -->
              <%if(!list.isEmpty()){%>
              <div class="row-full" align="right">
              	<button type="submit" id="countPost">수량 적용</button>
                <button type="submit" >전체 주문</button>
              </div>
              <% } %>
              
            </form>
          </div>
        </div>

        <br>
        
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

    <div class="row">
      <div class="col-sm-12" style="text-align: center; font-size: 25px;">
         <!-- 맨 처음으로(<<) -->
         <button class="paging" onclick="location.href='<%=request.getContextPath() %>/cart.my?currentPage=1'"> << </button>
         
         <!-- 이전 페이지로(<) -->
         <%if(currentPage == 1){ %>
         <button class="paging" disabled> < </button>
         <%}else{ %>
         <button class="paging" onclick="location.href='<%=request.getContextPath() %>/cart.my?currentPage=<%=currentPage - 1 %>'"> < </button>
         <%} %>
         
         <!-- 10개의 페이지 목록 -->
         <%for(int p = startPage ; p<=endPage ; p++){ %>
            <%if(currentPage == p){ %>
               <button class="paging" disabled><%=p %></button>
            <%} else {%>
               <button class="paging" onclick="location.href='<%=request.getContextPath() %>/cart.my?currentPage=<%=p %>'"><%=p %></button>
            <%} %>
         <%} %>
         <!-- 다음 페이지로(>) -->
         <%if(currentPage == maxPage){ %>
         <button class="paging" disabled> > </button>
         <%}else{ %>
         <button class="paging" onclick="location.href='<%=request.getContextPath() %>/cart.my?currentPage=<%=currentPage + 1 %>'"> > </button>
         <%} %>
         
         <!-- 맨 끝으로(>>) -->
         <button class="paging" onclick="location.href='<%=request.getContextPath() %>/cart.my?currentPage=<%=maxPage%>'"> >> </button>
      </div>
    </div>
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
     
     $("#countPost").click(function(){
         $("form").attr("action", "<%=request.getContextPath()%>/count.me");
      })
     
   /* $(function(){ //전체선택 체크박스 클릭 
        $("#checkAll").click(function(){
        //만약 전체 선택 체크박스가 체크된상태일경우 
        if($("#checkAll").prop("checked")) {
        //해당화면에 전체 checkbox들을 체크해준다 
        $("input[type=checkbox]").prop("checked",true); 
        // 전체선택 체크박스가 해제된 경우 
        } else { 
        //해당화면에 모든 checkbox들의 체크를해제시킨다. 
        $("input[type=checkbox]").prop("checked",false);
           } 
           }) 
        })  */
     
  </script>
</body>

</html>