<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<table border="1">
  <tr>
    <th>채점번호</th>
    <th>참가번호</th>
    <th>참가자명</th>
    <th>생년월일</th>
    <th>점수</th>
    <th>평점</th>
    <th>멘토</th>
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
		String query = "SELECT point.serial_no, point.artist_id, artist.artist_name, artist.artist_birth, POINT.POINT, mento.mento_name "+
				"FROM tbl_artist_201905 ARTIST, tbl_point_201905 POINT, tbl_mento_201905 MENTO "+
				"WHERE point.artist_id = ARTIST.ARTIST_id "+
				"AND mento.mento_id = point.mento_id "+
				"order by point.artist_id, artist_name, point.point desc";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
				out.print("<tr>");
				out.print("<td>"+ rs.getString(1) + "</td>");
				out.print("<td>"+ rs.getString(2) + "</td>");
				out.print("<td>"+ rs.getString(3) + "</td>");
				out.print("<td>"+ rs.getString(4) + "</td>");
				out.print("<td>"+ rs.getInt(5) + "</td>");
				switch(rs.getInt(5)/10){
				case 10:
				case 9:
					out.print("<td>"+ "A" + "</td>");
					break;
				case 8:
					out.print("<td>"+ "B" + "</td>");
					break;
				case 7:
					out.print("<td>"+ "C" + "</td>");
					break;
				case 6:
					out.print("<td>"+ "D" + "</td>");
					break;
				default:
					out.print("<td>"+ "F" + "</td>");
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