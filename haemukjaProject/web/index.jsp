<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   *{
      background-color: orange;
   }
   a {
      text-decoration: none;
      color: black;
   }
   a:hover {
      color: white;
   }
</style>
</head>
<body>
   <div align="center">
      <br><br><br><br>
      <a href="<%=request.getContextPath() %>/main.re">
         <img class="logo" src="<%=request.getContextPath() %>/images/haemukjalogo.png" />
      </a>
      <a href="<%=request.getContextPath() %>/main.re">
         <h1>입장하시겠습니까?</h1>
      </a>
   </div>
</body>
</html>