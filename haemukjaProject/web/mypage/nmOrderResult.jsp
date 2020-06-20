<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="mypage.model.vo.*,java.util.*"%>
<% 
	ArrayList<NMOrder> no = (ArrayList<NMOrder>)request.getAttribute("no");
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>주문정보 확인</title>

 <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
  <script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
  <script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
  <script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>

  <!-- Custom styles for this template -->
  <!-- <link href="../css/idpw.css" rel="stylesheet"> -->
  <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
   <script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
   <script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
   <script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
   <style>
   @import url(https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap);*{font-family:'Nanum Gothic',sans-serif;font-size:15px}body{margin:0;font-size:.9rem;font-weight:400;line-height:1.6;color:#212529;text-align:left;background-color:#f5f8fa}.my-form{padding-top:1.5rem;padding-bottom:1.5rem}.my-form .row{margin-left:0;margin-right:0}.login-form{padding-top:1.5rem;padding-bottom:1.5rem}.login-form .row{margin-left:0;margin-right:0}button{width:100px}#id,#idFind-email,#idFind-name,#join-email,#join-id,#join-name,#join-nickname,#join-pwd1,#join-pwd2,#join-residenceDetail,#password,#pwdFind-email{width:250px}
   </style>
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
    integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
    crossorigin="anonymous"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
    integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
    crossorigin="anonymous"></script>
    
  <style>
  @import url(https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap);*{font-family:'Nanum Gothic',sans-serif;font-size:15px}body{margin:0;font-size:.9rem;font-weight:400;line-height:1.6;color:#212529;text-align:left;background-color:#f5f8fa}.my-form{padding-top:1.5rem;padding-bottom:1.5rem}.my-form .row{margin-left:0;margin-right:0}.login-form{padding-top:1.5rem;padding-bottom:1.5rem}.login-form .row{margin-left:0;margin-right:0}button{width:100px}#id,#idFind-email,#idFind-name,#join-email,#join-id,#join-name,#join-nickname,#join-pwd1,#join-pwd2,#join-residenceDetail,#password,#pwdFind-email{width:250px}
  </style>
</head>

<body>

  <main class="login-form">
    <div class="cotainer">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <div class="card">

            <div class="card-header" align="center">
              <img src="<%=request.getContextPath()%>/images/haemukjalogo.png" width="400px">
            </div>

            <div class="card-body" >
             
              	<div class="form-group row">
                
                  <% if(msg==null && no!=null){ %>
                  <div class="col-md-12" >
                    <table class="table">
              			<thead>
			                <th style="width: 50px;"></th>
			                <th style="width: 300px;">제품명</th>
			              <th style="width: 100px;">가격</th>
			              <th style="width: 100px;">구매수량</th>
			                <th style="width: 100px;">구매일자</th>
			                <th style="width: 100px;">주문상태</th>
			                <th style="width: 100px;"></th>
            		   </thead>
            		      <%for(NMOrder n : no){ %>
            		   <tbody>
            		    <td style="width: 100px;"></td>
            		    <td style="width: 300px;"><%=n.getPtitle() %></td>
            		    <td style="width: 100px;"><%=n.getPrice() %></td>
            		    <td style="width: 100px;"><%=n.getPcount() %></td>
            		    <td style="width: 100px;"><%=n.getOdate() %></td>
            		    <td style="width: 100px;"><%=n.getOname() %></td>
            		    <td style="width: 100px;"></td>
            		   </tbody>
            		      <%} %>
            		      </table>
                  </div>
                  
                   <%}else if(msg!=null && no==null){ %>
                   		<div class="col-md-12" style="text-align: center; padding-top: 35px;">
                   			<%=msg %>
                   		</div>
                   		
                    <%} %>
                </div> <!-- form-group row -->
                <div class="col-md-12" align="center">
                <% if(msg==null && no!=null){ %>
                  <button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/mainList.sh'" style="background-color: orange; border: none; width:150px">
                  메인으로
                  </button>&nbsp;&nbsp;
         <%}else if(msg!=null && no==null){ %>
        
            <button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/mypage/nmOrderSearch.jsp'" style="background-color: orange; border: none; width:100px">
                 다시검색
                  </button>&nbsp;&nbsp;
                       <button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/mainList.sh'" style="background-color: orange; border: none; width:100px">
                  메인으로
                  </button>&nbsp;&nbsp;
                  
         <%} %>
                  <br><br>
          
                </div> <!-- col-md-6 offset-md-4 -->
              
            </div> <!-- card-body -->
          </div> <!-- card -->
        </div> <!-- col-md-8 -->
      </div> <!-- row justify-content-center -->
    </div>  <!-- container -->
  </main>

  <!-- Bootstrap core JavaScript -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>