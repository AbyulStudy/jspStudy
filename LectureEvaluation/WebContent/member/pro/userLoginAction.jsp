<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassword = null;
		
	// Parameter 받아오기
	if(request.getParameter("userID") != null) {
		userID = request.getParameter("userID");
	}
	if(request.getParameter("userPassword") != null) {
		userPassword = request.getParameter("userPassword");
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

	// userDAO.login 메소드를 이용하여 int 값을 반환
	// 1 = 정상 || 0 = pw 오류 || -1 = 존재하지 않는 아이디 || -2 = dB 오류
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(userID, userPassword);
	if (result == 1) {
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'http://localhost:8080/index.jsp'");
		script.println("</script>");
		script.close();
		return;
	} else if (result == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else if (result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else if (result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
%>