<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../nav.jsp"></jsp:include>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID =(String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href = 'http://localhost:8080/member/view/userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}	
%>
<div class="container mt-3" style="max-width:560px;">
	<div class="alert alert-warining mt-4">
		이메일 주소 인증을 하셔야 이용 가능합니다.<br>인증 메일을 받지 못하셨나요?
	</div>
	<a class="btn btn-primary" href="http://localhost:8080/member/pro/emailSendAction.jsp">인증 메일 다시 받기</a>
	
</div><!-- end_container -->

<jsp:include page="../footer.jsp"></jsp:include>
