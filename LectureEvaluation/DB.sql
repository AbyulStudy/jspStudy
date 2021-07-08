	CREATE DATABASE LectureEvaluation; #데이터베이스 생성
	USE LectureEvaluation; #생성한 데이터베이스에 접속

	#평가테이블 Evaluation Table	
	CREATE TABLE EVALUATION (	
	  evaluationID int PRIMARY KEY AUTO_INCREMENT, #평가 번호	
	  userID varchar(50), #작성자 아이디	
	  lectureName varchar(50), #강의명	
	  professorName varchar(50), #교수명
	  lectureYear int, #수강 연도
	  semesterDivide varchar(20), #수강 학기
	  lectureDivide varchar(10), #강의 구분
	  evaluationTitle varchar(50), #평가 제목
	  evaluationContent varchar(2048), #평가 내용
	  totalScore varchar(10), #종합 점수
	  creditScore varchar(10), #성적 점수
	  comfortableScore varchar(10), #널널 점수
	  lectureScore varchar(10), #강의 점수
	  likeCount int #추천갯수
	);

	#회원테이블 User Table
	CREATE TABLE USER (
	  userID varchar(50) PRIMARY KEY, #작성자 아이디
	  userPassword varchar(50), #작성자 비밀번호
	  userEmail varchar(50), #작성자 이메일
	  userEmailHash varchar(64), #이메일 확인 해시값
	  userEmailChecked boolean #이메일 확인 여부
	);

	#추천테이블(Like Table)
	CREATE TABLE LIKEY (
	  userID varchar(50), #작성자 아이디
	  evaluationID int, #평가 번호
	  userIP varchar(50) #작성자 아이피
	);
	
	ALTER TABLE LIKEY ADD PRIMARY KEY (userID, evaluationID);
	
	# java.sql.SQLException: Incorrect string value: '\xE3\x85\x81\xE3\x84\xB4...' for column 'lectureName' at row 1 같은 오류 발생시 다음과 같이 처리
	# mysql utf8 설정
		1) my.ini 추가 
			# Set Character UTF-8
			[client]
			default-character-set = utf8
			
			[mysqld]
			character-set-client-handshake = FALSE
			init_connect = "SET collation_connection = utf8_general_ci"
			init_connect = "SET NAMES utf8"
			character-set-server = utf8
			
			[mysql]
			default-character-set = utf8
			
			[mysqldump]
			default-character-set = utf8
		
		2) database, table character set 설정		
			ALTER TABLE table_name convert to charset utf8;
		3) mysql 재시작
			



