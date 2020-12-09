<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/css.css">
<title>이정훈</title>
</head>
<%
String section = request.getParameter("section") != null ? request.getParameter("section") : "";
%>
<body>
	<%@ include file="static/header.jsp" %>
	<%@ include file="static/nav.jsp" %>
	
	<%
	switch(section){
	case "insert_audition":
		%><%@include file="page/insert_audition.jsp" %><%
		break;
	case "select_list":
		%><%@include file="page/select_list.jsp" %><%
		break;
	case "select_mento_score":
		%><%@include file="page/select_mento_score.jsp" %><%
		break;
	case "select_score":
		%><%@include file="page/select_score.jsp" %><%
		break;
	default:
		%><%@include file="static/index.jsp" %><%
	}
	%>
	
	<%@ include file="static/footer.jsp" %>
</body>
</html>