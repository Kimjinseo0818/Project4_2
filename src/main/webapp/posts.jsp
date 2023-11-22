<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.BoardDAO, com.crud.bean.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>free board</title>
	<style>
		#list {
			font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
			border-collapse: collapse;
			width: 100%;
		}
		#list td, #list th {
			border: 1px solid #ddd;
			padding: 8px;
			text-align:center;
		}
		#list tr:nth-child(even){background-color: #f2f2f2;}
		#list tr:hover {background-color: #ddd;}
		#list th {
			padding-top: 12px;
			padding-bottom: 12px;
			text-align: center;
			background-color: #006bb3;
			color: white;
		}
	</style>
	<script>
		function delete_ok(id){
			var a = confirm("정말로 삭제하겠습니까?");
			if(a) location.href='deletepost.jsp?id=' + id;
		}
	</script>
</head>
<body>
<h1>회원 정보</h1>
<%
	BoardDAO boardDAO = new BoardDAO();
	List<BoardVO> list = boardDAO.getMemberList();
	request.setAttribute("list",list);
%>
<table id="list" width="90%">
	<tr>
		<th>Id</th>
		<th>이름</th>
		<th>사진</th>
		<th>생년월일</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>MBTI</th>
		<th>성별</th>
		<th>등록일</th>
		<th>View</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	<c:forEach items="${list}" var="u">
		<tr>
			<td>${u.getSeq()}</td>
			<td>${u.getName()}</td>
			<td><c:if test="${u.getPhoto()ne''}"><br /><img width="150px" height="200px" src="${pageContext.request.contextPath}/upload/${u.getPhoto()}" class="photo"></c:if><br>${u.getPhoto()}</td>
			<td>${u.getFromdate()}</td>
			<td>${u.getPhone()}</td>
			<td>${u.getEmail()}</td>
			<td>${u.getMbti()}</td>
			<td>${u.getGender()}</td>
			<td>${u.getRegdate()}</td>
			<td><a href="view.jsp?id=${u.getSeq()}">View</a></td>
			<td><a href="editform.jsp?id=${u.getSeq()}">Edit</a></td>
			<td><a href="javascript:delete_ok('${u.getSeq()}')">Delete</a></td>
		</tr>
	</c:forEach>
</table>
<br/><a href="addpostform.jsp">회원 정보 추가하기</a>
</body>
</html>