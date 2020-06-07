<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	String msg = (String)request.getAttribute("msg");
	Integer nmno = (Integer)request.getAttribute("nmno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><%=msg %></h3>
	<%if(nmno!=null){ %>
	<h3>주문번호 : <%=nmno %></h3>
	<%} %>
	<button onclick="location.href='<%=request.getContextPath()%>/mainList.sh'">메인으로</button>
	
</body>
</html>