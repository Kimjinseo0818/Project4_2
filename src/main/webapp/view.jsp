<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.BoardDAO, com.crud.bean.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>회원정보</title>
    <style>
        #edit {
            border-collapse: collapse;
        }
        #edit td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        #edit td:nth-child(odd){
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            color: white;
            background-color: #006bb3;
        }
    </style>
</head>
<body>
<h1>회원 정보 보기</h1>
<%
    BoardDAO boardDAO = new BoardDAO();
    String id=request.getParameter("id");
    BoardVO u=boardDAO.getMember(Integer.parseInt(id));
    request.setAttribute("vo",u);
%>
<table id="edit">
    <tr>
        <td>이름</td><td>${vo.getName()}</td>
    </tr>
    <tr>
        <td>사진</td><td><c:if test="${u.getPhoto()ne''}"><br />
        <img width="150px" height="200px" src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" class="photo"></c:if></td>
    </tr>
    <tr>
        <td>생년월일</td><td>${vo.getFromdate()}</td>
    </tr>
    <tr>
        <td>전화번호</td><td>${vo.getPhone()}</td>
    </tr>
    <tr>
        <td>이메일</td><td>${vo.getEmail()}</td>
    </tr>
    <tr>
        <td>성별</td><td>${vo.getGender()}</td>
    </tr>
</table>
<button type="button" onclick="history.back()">Back to List</button>
<button type="button" onclick="location.href='editform.jsp?id=${vo.getSeq()}'">Edit</button>
</body>
</html>