<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>SELECT</h3>
<table border="1">
  <tr>
    <th>참가번호</th>
    <th>참가자명</th>
    <th>생년월일</th>
    <th>성별</th>
    <th>특기</th>
    <th>소속사</th>
  </tr>

<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost/xe", "system", "1234");
		if (conn != null) {
			System.out.println("Database Connected!");
		}
		else {
			System.out.println("Database Connect Fail!");
		}
		Statement stmt = conn.createStatement();
		String query = "SELECT * FROM tbl_artist_201905 ARTIST";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
				out.print("<tr>");
				out.print("<td>"+ rs.getString(1) + "</td>");
				out.print("<td>"+ rs.getString(2) + "</td>");
				out.print("<td>"+ rs.getString(3) + "</td>");
				switch (rs.getString(4)){
				case "M":
					out.print("<td>"+ "M" + "</td>");
					break;
				case "F":
					out.print("<td>"+ "F" + "</td>");
					break;
				}
				switch (rs.getString(5)){
				case "1":
					out.print("<td>"+ "보컬" + "</td>");
					break;
				case "2":
					out.print("<td>"+ "댄스" + "</td>");
					break;
				case "3":
					out.print("<td>"+ "랩" + "</td>");
					break;
				}
				out.print("<td>"+ rs.getString(6) + "</td>");
				out.print("</tr>");
		}
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>