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
	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 되어있습니다..')");
		script.println("location.href = 'http://localhost:8080/index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}	
%>
<div class="container mt-3" style="max-width:560px;">
	<form action="http://localhost:8080/member/pro/userLoginAction.jsp" method="post">
		<div class="form-group">
			<label>아이디</label>
			<input type="text" class="form-control" name="userID" />
		</div>
		<div class="form-group">
			<label>비밀번호</label>
			<input type="password" class="form-control" name="userPassword" />
		</div>
		<button type="submit" class="btn btn-primary">로그인</button>
	</form>
	
</div><!-- end_container -->

<jsp:include page="../footer.jsp"></jsp:include>
