package evaluation;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class EvaluationDTO {	
	
	 int evaluationID;
	 String userID;                                             
	 String lectureName;                                   
	 String professorName;                                      
	 int lectureYear;                                            
	 String semesterDivide;                                     
	 String lectureDivide;                                      
	 String evaluationTitle;                                    
	 String evaluationContent;                               
	 String totalScore;                                         
	 String creditScore;                                        
	 String comfortableScore;                                   
	 String lectureScore;                                       
	 int likeCount;
	 
}
