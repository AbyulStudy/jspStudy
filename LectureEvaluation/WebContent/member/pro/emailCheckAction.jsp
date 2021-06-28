<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String code = null;
	UserDAO userDAO = new UserDAO();
	String userID = null;
	// 이메일 인증 할 경우 userEmail 을 SHA256 해시값으로 변환 값을 다시 보낸다.
	// 이 해시값을 code 변수에 대입
	if(request.getParameter("code") != null) {
		code = request.getParameter("code");
	}
	// session 에 userID 가 존재 할 경우 userID 에 값을 대입
	// session 값은 기본적으로 Object 값을 반환 하기 때문에 String으로 캐스팅
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("console.log(userID)");
		script.println("</script>");
	}
	// session 값에 userID 가 로그인 되었는지 확인 
	if(userID == null || userID == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href = 'http://localhost:8080/member/view/userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	} 
	
	// DB에 저장되어 있는 userEmailHash 값과 이메일 인증 할때 보낸 Hash 값이 일치하는지 확인
	String userEmail = userDAO.getUserEmail(userID);
	boolean isRight = false;
	isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
	
	// Hash 값이 일치 할 경우 UserEmailChecked 값을 변환 해준다.
	if(isRight == true) {
		userDAO.setUserEmailChecked(userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 성공 했습니다.')");
		script.println("location.href = 'http://localhost:8080/index.jsp'");
		script.println("</script>");
		script.close();
		return;
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 코드입니다.')");
		script.println("location.href = 'http://localhost:8080/index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
%>