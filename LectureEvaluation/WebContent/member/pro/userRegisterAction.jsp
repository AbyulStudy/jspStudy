<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassword = null;
	String userEmail = null;
	
	// Parameter 받아오기
	if(request.getParameter("userID") != null) {
		userID = request.getParameter("userID");
	}
	if(request.getParameter("userPassword") != null) {
		userPassword = request.getParameter("userPassword");
	}
	if(request.getParameter("userEmail") != null) {
		userEmail = request.getParameter("userEmail");
	}
	
	// 입력 확인 
	if(userID == null || userID == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('ID가 입력이 안됬습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	} 
	if(userPassword == null || userPassword == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Password가 입력이 안됬습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	} 
	if(userEmail == null || userEmail == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Email이 입력이 안됬습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	} 
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(new UserDTO(userID, userPassword, userEmail, SHA256.getSHA256(userEmail), false));
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	} else {
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'emailSendAction.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>