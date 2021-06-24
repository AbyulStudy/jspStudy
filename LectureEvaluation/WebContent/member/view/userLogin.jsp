<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../nav.jsp"></jsp:include>

<div class="container mt-3" style="max-width:560px;">
	<form action="./userLoginAction.jsp" method="post">
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
