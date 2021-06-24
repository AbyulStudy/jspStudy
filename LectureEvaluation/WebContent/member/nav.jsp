<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!-- set_nav -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="http://localhost:8080/index.jsp">강의평가 웹 사이트</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"	data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbar">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a href="http://localhost:8080/index.jsp" class="nav-link">메인</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">회원관리</a>	
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a href="http://localhost:8080/userLogin.jsp" class="dropdown-item">로그인</a>
						<a href="#" class="dropdown-item">회원가입</a>
						<a href="#" class="dropdown-item">로그아웃</a>
					</div>
				</li><!-- end_nav-item -->
			</ul><!-- end_navbar-nav -->
			
			<form class="form-inline my-2 my-lg-0">
				<input type="text" class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요." aria-label="Search" />
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
		</div><!-- end_navbar-collapse -->
	</nav><!-- end_navbar -->