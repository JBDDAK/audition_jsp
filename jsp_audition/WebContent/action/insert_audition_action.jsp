<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
String artist_ID = request.getParameter("artist_ID");
String artist_name = request.getParameter("artist_name");
String artist_birth = String.format("%04d%02d%02d",Integer.parseInt(request.getParameter("date_Y")), Integer.parseInt(request.getParameter("date_M")), Integer.parseInt(request.getParameter("date_D")));
String gender = request.getParameter("gender");
int talent = Integer.parseInt(request.getParameter("talent"));
String agency = request.getParameter("agency");

try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost/xe", "system", "1234");

	Statement stmt = conn.createStatement();

	String query = "INSERT INTO TBL_ARTIST_201905(ARTIST_ID, ARTIST_NAME, ARTIST_BIRTH, ARTIST_GENDER, TALENT, AGENCY) VALUES('%s','%s','%s', '%s', %d,'%s')";

	ResultSet rs = stmt.executeQuery(String.format(query, artist_ID, artist_name, artist_birth, gender, talent, agency));

	conn.commit();
	stmt.close();

	conn.close();
} catch (Exception e) {
	e.printStackTrace();
}

response.sendRedirect("../index.jsp?section=insert_audition");
%>