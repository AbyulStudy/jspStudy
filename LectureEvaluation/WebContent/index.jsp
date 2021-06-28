<%@page import="user.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID =(String) session.getAttribute("userID");
	}
/***************************************************************************/
/**************************** 예외처리 발생 부분 *********************************/
/***************************************************************************/
/*
SEVERE: 경로 []의 컨텍스트 내의 서블릿 [jsp]을(를) 위한 Servlet.service() 호출이, 근본 원인(root cause)과 함께, 예외 [java.lang.IllegalStateException: 데이터를 배출하는 중 예외가 발생했습니다.]을(를) 발생시켰습니다.
java.io.IOException: 스트림이 닫혔습니다.
try{} catch{ IllegalStateException e } 문을 사용하여 예외처리 적용
*/
	try{
	  	if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
			script.println("location.href = 'http://localhost:8080/member/view/userLogin.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
		
	 	boolean emailChecked = new UserDAO().getUserEmailChecked(userID);
		if(emailChecked == false){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('메일을 인증해주세요.')");
			script.println("location.href = 'http://localhost:8080/member/pro/emailSendConfirm.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
	} catch( IllegalStateException e) {
		e.printStackTrace();
	}
/***************************************************************************/
%>


	<div class="container">
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<select name="letureDivide" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="전공">전공</option>
				<option value="교양">교양</option>
				<option value="기타">기타</option>
			</select>
			<input type="text" id="search" class="form-control mx-1 mt-2" placeholder="내용을입력하세요" />
			<button class="btn btn-primary mx-1 mt-2" type="submit">검색</button>
			<a href="#registerModal" class="btn btn-primary mx-1 mt-2" data-toggle="modal">등록하기</a>
			<a href="#reportModal" class="btn btn-danger mx-1 mt-2" data-toggle="modal">신고</a>
		</form>
	
	
		<!-- custom card -->
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">컴퓨터개론&nbsp;<small>나동빈</small></div>
					<div class="col-4 text-right">종합<span style="color: red;">A</span></div>
				</div>
			</div><!-- end_card-header -->
			<div class="card-body">
				<h5 class="card-title">
					정말 좋은 강의에요.&nbsp;<small>(2017년 가을학기)</small>
				</h5>
				<p class="card-text">강의가 많이 널널해서, 솔직히 많이 배운 건 없는 것 같지만 학점도 잘 나오고 너무 좋은것 같습니다.</p>
				<div class="row">
					<div class="col-9 text-left">
						성적 <span style="color:red;">A</span>
						널널 <span style="color:red;">B</span>
						강의 <span style="color:red;">A</span>
						<span style="color:green;">(추천: 15★)</span>
					</div>
					<div class="col-3 text-right">
						<a onclick="return confirm('추천하시겠습니까?')" href="./likeAction.jsp?evaluationID=">추천</a>
						<a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?evaluationID=">삭제</a>
					</div>
				</div>
			</div><!-- end_card-body -->
		</div><!-- end_card -->
	</div><!-- end_container -->
	<!-- prev next -->
	<ul class="pagination justify-content-center mt-3">
		<li class="page-item">
			<a href="#" class="page-link">이전</a>
		</li>
		<li class="page-item">
			<a href="#" class="page-link">다음</a>
		</li>
	</ul>

	<!-- Add Modal -->
	<!-- registerModal -->
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">평가 등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div><!-- end_modal-header -->
				<div class="modal-body">
					<form action="http://localhost:8080/pro/evaluationResgisterAction.jsp" method="post">
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>강의명</label>
								<input type="text" class="form-control" name="lectureName" maxlength="20" />							
							</div>
							<div class="form-group col-sm-6">
								<label>교수명</label>
								<input type="text" class="form-control" name="professorName" maxlength="20" />					
							</div>
						</div><!-- end_form-row -->
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>수강연도</label>
								<select name="lectureYear" class="form-control">
									<option value="2011">2011</option>
									<option value="2012">2012</option>
									<option value="2013">2013</option>
									<option value="2014">2014</option>
									<option value="2015">2015</option>
									<option value="2016">2016</option>
									<option value="2017">2017</option>
									<option value="2018">2018</option>
									<option value="2019">2019</option>
									<option value="2020">2020</option>
									<option value="2021" selected>2021</option>
									<option value="2022">2022</option>
									<option value="2023">2023</option>
									<option value="2024">2024</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>수강학기</label>
								<select name="semesterDivide" class="form-control">
									<option value="1학기" selected>1학기</option>
									<option value="여름학기">여름학기</option>
									<option value="2학기">2학기</option>
									<option value="겨울학기">겨울학기</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>강의구분</label>
								<select name="lectureDivide" class="form-control">
									<option value="전공" selected>전공</option>
									<option value="교양">교양</option>
									<option value="기타">기타</option>
								</select>
							</div>
						</div><!-- end_form-row -->		
										
						<div class="form-group">
							<label>제목</label>
							<input type="text" name="evaluationTitle" class="form-control" maxlength="20" />
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea name="evaluationContent" class="form-control" maxlength="2048" style="height:180px; resize: none;"></textarea>
						</div>
						
						<div class="form-row">
							<div class="form-group col-sm-3">
								<label>종합</label>
								<select name="totalScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>성적</label>
								<select name="creditScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>널널</label>
								<select name="comfortableScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>강의</label>
								<select name="lectureScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
						</div><!-- end_form-row -->					
						<div class="modal-footer">
							<button class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button class="btn btn-primary" type="submit">등록하기</button>
						</div><!-- end_modal-footer -->						
					</form>
				</div><!-- end_modal-body -->
			</div><!-- end_modal-content -->
		</div><!-- end_modal-dialog -->
	</div><!-- end_registerModal -->
	<!-- reportModal -->
	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">신고하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div><!-- end_modal-header -->
				<div class="modal-body">
					<form method="post" action="./reportAction.jsp">
						<div class="form-group">
							<label>신고 제목</label>
							<input type="text" class="form-control"	id="reportTitle" maxlength="20" />
						</div>
						<div class="form-group">
							<label>신고 내용</label>
							<textarea name="reportContent" class="form-control" maxlength="2048" style="height: 180px; resize: none;"></textarea>
						</div>
												<div class="modal-footer">
							<button class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button class="btn btn-danger" type="submit">신고하기</button>
						</div><!-- end_modal-footer -->		
					</form>
				</div><!-- end_modal-body -->
			</div><!-- end_modal-content -->
		</div><!-- end_modal-dialog -->
	</div><!-- end_registerModal -->
	
<jsp:include page="footer.jsp"></jsp:include>
