package recipe;

import java.util.List;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class RecipeDAO extends JDBConnect {

	public RecipeDAO(ServletContext application) {
		super(application);
	}
	
	public List<RecipeDTO> selectList() {
		
		//List계열의 컬렉션을 생성한다. 이때 타입 매개변수는
		//BoardDTO객체로 설정한다.
		//게시판 목록은 출력 순서가 보장되야 하므로 Set컬렉션은
		//사용할 수 없고 List컬렉션을 사용해야한다.
		List<RecipeDTO> bbs = new Vector<RecipeDTO>();
		
		//레코드 추출을 위한 select쿼리문 작성
		String query = "SELECT * FROM recipe WHERE b_flag=? ORDER BY idx DESC ";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, b_flag);
			rs = psmt.executeQuery();
			while(rs.next()) {
				
				RecipeDTO dto = new RecipeDTO();
				
				dto.setIdx(rs.getInt("idx"));
				dto.setB_flag(rs.getString("b_flag"));
				dto.setBoardTitle(rs.getString("boardTitle"));
				dto.setBoardContent(rs.getString("boardContent"));
				dto.setUserName(rs.getString("userName"));
				dto.setRegidate(rs.getDate("regidate"));
				dto.setOfile("ofile");
				dto.setNfile("nfile");
				
				bbs.add(dto);
			}

		} 
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	
	public RecipeDTO selectView(String b_flag, int idx) {
		
		RecipeDTO dto = new RecipeDTO();
		
		String query = "SELECT B.*, M.id "
				+ " FROM board B INNER JOIN member M "
				+ " ON B.userName=M.userName "
				+ " WHERE b_flag=? AND idx=?";
		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, b_flag);
			psmt.setInt(2, idx);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setB_flag(rs.getString("b_flag"));
				dto.setIdx(rs.getInt(idx));
				dto.setCategory(rs.getString("category"));
				dto.setBoardTitle(rs.getString("boardTitle"));
				dto.setBoardContent(rs.getString("boardContent"));
				dto.setOfile(rs.getString("ofile"));
				dto.setNfile(rs.getString("nfile"));
				dto.setUserName(rs.getString("userName"));
				dto.setVisitCount(rs.getInt("visitCount"));
				dto.setRegidate(rs.getDate("regidate"));
				dto.setId(rs.getString("id"));
			}
		} 
		catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
}
