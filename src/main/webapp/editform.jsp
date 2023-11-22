<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.BoardDAO, com.crud.bean.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit Form</title>
	<style>
		#list {
			border-collapse: collapse;
		}
		#list td {
			border: 1px solid #ddd;
			padding: 8px;
		}
		#list td:nth-child(odd){
			padding-top: 12px;
			padding-bottom: 12px;
			text-align: center;
			color: white;
			background-color: #006bb3;
		}
	</style>
</head>
<body>

<%
	BoardDAO boardDAO = new BoardDAO();
	String id=request.getParameter("id");
	BoardVO u=boardDAO.getMember(Integer.parseInt(id));
	request.setAttribute("vo",u);
%>

<h1>Edit Form</h1>
<form action="editpost.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="seq" value="${vo.getSeq()}"/>
	<table id="list">
		<tr><td>이름:</td><td><input type="text" name="name" value="${vo.getName()}"/></td></tr>
		<tr>
			<td>사진:</td>:<td><input type="file" name="photo" value="${vo.getPhoto()}"/>
			<c:if test="${u.getPhoto()ne''}"><br /><img width="150px" height="200px" src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" class="photo"></c:if></td>
		</tr>
		<tr><td>생년월일:</td><td><input type="text" name="fromdate" placeholder="YYYY-MM-DD" value="${vo.getFromdate()}"/></td></tr>
		<tr><td>전화번호:</td><td><input type="tel" name="phone" placeholder="010-XXXX-XXXX" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" value="${vo.getPhone()}" /></td></tr>
		<tr><td>이메일:</td><td><input type="email" name="email" value="${vo.getEmail()}"/></td></tr>
		<tr><td>MBTI:</td><td><input type="text" name="mbti" value="${vo.getMbti()}" /></td></tr>
		<tr><td>성별</td><td>
			<input type="checkbox" name="gender" value="남자" onclick="checkOnlyOne(this)" checked> 남자 <br>
			<input type="checkbox" name="gender" value="여자" onclick="checkOnlyOne(this)"> 여자
		</td></tr>
	</table>
	<br>
	<input type="submit" value="Edit"/>
	<input type="button" value="Cancel" onclick="history.back()"/>
</form>
<script>
	function checkOnlyOne(element) {

		const checkboxes
				= document.getElementsByName("gender");

		checkboxes.forEach((cb) => {
			cb.checked = false;
		})

		element.checked = true;
	}

</script>
</body>
</html>