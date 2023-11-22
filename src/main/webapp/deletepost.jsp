<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.crud.dao.BoardDAO, com.crud.bean.BoardVO"%>
<%@ page import="com.crud.common.FileUpload"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>

<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);

		BoardDAO boardDAO = new BoardDAO();
		String filename = boardDAO.getPhotoFilename(id);
		if(filename != null)
			FileUpload.deleteFile(request, filename);
		boardDAO.deleteMember(id);
	}
	response.sendRedirect("posts.jsp");
%>