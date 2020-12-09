<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<table border="1">
  <tr>
    <th>참가번호</th>
    <th>참가자명</th>
    <th>총점</th>
    <th>평균</th>
    <th>등수</th>
  </tr>

<%
	int rank = 1;
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
		String query = "SELECT artist.artist_id, artist.artist_name, SUM(POINT.POINT) AS sumpoint, avg(point.point) FROM tbl_artist_201905 artist, tbl_point_201905 POINT, tbl_mento_201905 mento "+
				"WHERE artist.artist_id = POINT.artist_id "+
				"AND mento.mento_id = POINT.mento_id "+
				"GROUP BY artist.artist_id, artist.artist_name "+
				"ORDER BY sumpoint desc";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
				out.print("<tr>");
				out.print("<td>"+ rs.getString(1) + "</td>");
				out.print("<td>"+ rs.getString(2) + "</td>");
				out.print("<td>"+ rs.getString(3) + "</td>");
				out.print("<td>"+ String.format("%.2f", rs.getFloat(4)) + "</td>");
				out.print("<td>"+ rank++ + "</td>");
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