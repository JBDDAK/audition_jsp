<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost/xe", "system", "1234");
%>

<script>
	var valueCk = true
	function chake(inputBox, errorMsg) {
		if ((inputBox.value === "" || inputBox.value <= 0) && valueCk == true) {
			if(!inputBox === document.input_form.gender){
				inputBox.focus();
			}
			alert(errorMsg);
			valueCk = fasle;
			return;
		} else {
			return;
		}
		valueCk = true;
	}
	function submit_form() {

		chake(document.input_form.artist_ID, "참가번호를 입력해주세요");
		chake(document.input_form.artist_name, "참가자명를 입력해주세요");
		chake(document.input_form.date_Y, "생년월일(년)를 입력해주세요");
		chake(document.input_form.date_M, "생년월일(월)를 입력해주세요");
		chake(document.input_form.date_D, "생년월일(일)를 입력해주세요");
		chake(document.input_form.gender, "성별을 선택해주세요");
		chake(document.input_form.talent, "특기를 선택해주세요");
		chake(document.input_form.agency, "소속사를 입력해주세요");

		if (valueCk) {
			alert("정상적으로 처리되었습니다.")
			document.input_form.submit();
		}

	}

	function reset_form() {
		document.input_form.reset();
	}
</script>
<form action="action/insert_audition_action.jsp" method="post" name="input_form">
	<table border="1">
		<tr>
			<td>참가번호</td>
			<td><input type="text" name="artist_ID"></td>
		</tr>
		<tr>
			<td>참가자명</td>
			<td><input type="text" name="artist_name"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="text" name="date_Y"></td>
			<td>년</td>
			<td><input type="text" name="date_M"></td>
			<td>월</td>
			<td><input type="text" name="date_D"></td>
			<td>일</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<input type="radio" name="gender" value="M">남자
				<input type="radio" name="gender" value="F">여자
			</td>
		</tr>
		<tr>
			<td>특기</td>
			<td>
				<select name="talent">
					<option value="0">특기선택</option>
					<option value="1">보컬</option>
					<option value="2">댄스</option>
					<option value="3">랩</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>소속사</td>
			<td><input type="text" name="agency"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="등록하기" onclick="submit_form()">
				<input type="button" value="다시쓰기" onclick="reset_form()">
			</td>
		</tr>
	</table>
</form>
<%
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>