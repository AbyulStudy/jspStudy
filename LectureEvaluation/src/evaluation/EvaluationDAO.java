package evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
	
	public ArrayList<EvaluationDTO> getList (String lectureDivide, String searchType, String search, int pageNumber){
		if(lectureDivide.equals("전체")) {
			lectureDivide = "";
		}
		ArrayList<EvaluationDTO> evaluationList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			if(searchType.equals("최신순")) {
				SQL = "SELECT * FROM EVALUATION WHERE lectureDivide " + 
						"LIKE ? AND CONCAT(lectureName, ProfessorName, evaluationTitle, evaluationContent) " + 
						"LIKE ? ORDER BY evaluationID DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6; 
			} else if (searchType.equals("추천순")){
				SQL = "SELECT * FROM EVALUATION WHERE lectureDivide " + 
						"LIKE ? AND CONCAT(lectureName, ProfessorName, evaluationTitle, evaluationContent) " + 
						"LIKE ? ORDER BY likeCount DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6; 
			}
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + lectureDivide + "%");
			pstmt.setString(2, "%" + search + "%");
			rs = pstmt.executeQuery();
			evaluationList = new ArrayList<EvaluationDTO>();
			
			while(rs.next()) {
				EvaluationDTO evaluation = new EvaluationDTO(
					rs.getInt(1),
					rs.getString(2),
					rs.getString(3),
					rs.getString(4),
					rs.getInt(5),
					rs.getString(6),
					rs.getString(7),
					rs.getString(8),
					rs.getString(9),
					rs.getString(10),
					rs.getString(11),
					rs.getString(12),
					rs.getString(13),
					rs.getInt(14)
				);
				evaluationList.add(evaluation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return evaluationList; 
	}
}
