<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.BoardDAO"%>
<%@page import="com.crud.bean.BoardVO"%>
<%@page import="com.crud.common.FileUpload"%>
<% request.setCharacterEncoding("utf-8"); %>

<%--<jsp:useBean id="u" class="com.crud.bean.BoardVO" />
<jsp:setProperty property="*" name="u"/>--%>

<%
	BoardDAO boardDAO = new BoardDAO();
	FileUpload upload = new FileUpload();
	BoardVO u = upload.uploadPhoto(request);
	int i=boardDAO.updateMember(u);
	response.sendRedirect("posts.jsp");
%>