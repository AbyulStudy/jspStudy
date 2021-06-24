<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../nav.jsp"></jsp:include>

<div class="container mt-3" style="max-width: 560px;">
	<form method="post" action="http://localhost:8080/member/pro/userRegisterAction.jsp">
		<div class="form-group">
			<label>아이디</label>
			<input type="text" name="userID" class="form-control" />
		</div>
		<div class="form-group">
			<label>비밀번호</label>
			<input type="password" name="userPassword" class="form-control" />
		</div>
		<div class="form-group">
			<label>이메일</label>
			<input type="email" name="userEmail" class="form-control"/>
		</div>
		<button type="submit" class="btn btn-primary">회원가입</button>
	</form>
</div>

<jsp:include page="../footer.jsp"></jsp:include>
