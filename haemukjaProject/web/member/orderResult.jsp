<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	String msg = (String)request.getAttribute("msg");
	Integer oid = (Integer)request.getAttribute("oid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><%=msg %></h3>
	<%if(oid!=null){ %>
	<h3>주문번호 : <%=oid %></h3>
	<%} %>
	<button onclick="location.href='<%=request.getContextPath()%>/mainList.sh'">메인으로</button>
	
</body>
</html>