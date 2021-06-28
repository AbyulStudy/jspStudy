package evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class EvaluationDAO {
	
	// 글 작성
	public int wirte(EvaluationDTO evaluationDTO) {
		String SQL = "INSERT INTO EVALUATION VALUES (NULL,?,?,?,?,?,?,?,?,?,?,?,?,0)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			// 유저 아이디
			pstmt.setString(1, evaluationDTO.getUserID());
			// 강의명
			pstmt.setString(2, evaluationDTO.getLectureName());
			// 교수명
			pstmt.setString(3, evaluationDTO.getProfessorName());
			// 수강연도
			pstmt.setInt(4, evaluationDTO.getLectureYear());
			// 수강학기
			pstmt.setString(5, evaluationDTO.getSemesterDivide());
			// 강의 구분
			pstmt.setString(6, evaluationDTO.getLectureDivide());
			// 제목
			pstmt.setString(7, evaluationDTO.getEvaluationTitle());
			// 내용
			pstmt.setString(8, evaluationDTO.getEvaluationContent());
			// 종합 점수
			pstmt.setString(9, evaluationDTO.getTotalScore());
			// 성적 점수
			pstmt.setString(10, evaluationDTO.getCreditScore());
			// 널널 점수
			pstmt.setString(11, evaluationDTO.getComfortableScore());
			// 강의 점수
			pstmt.setString(12, evaluationDTO.getLectureScore());
			// 성공 반환(1) 
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return -1; // DB Error
	}
}
