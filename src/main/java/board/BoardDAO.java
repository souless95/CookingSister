package board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {

	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	public int insertMBoard (BoardDTO dto) {
		
		int result = 0;
		
		try {
			String query = "INSERT board (b_flag, boardTitle, boardContent, ofile, nfile, userName, visitCount) "
					+ "VALUES (?, ?, ?, ?, ?, ?, 0) ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getB_flag());
			psmt.setString(2, dto.getBoardTitle());
			psmt.setString(3, dto.getBoardContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getNfile());
			psmt.setString(6, dto.getUserName());  
			
			result = psmt.executeUpdate();		
			
		} 
		catch (Exception e) {
			System.out.println("게시글 등록 중 오류 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public List<BoardDTO> selectList(String b_flag) {
		
		//List계열의 컬렉션을 생성한다. 이때 타입 매개변수는
		//BoardDTO객체로 설정한다.
		//게시판 목록은 출력 순서가 보장되야 하므로 Set컬렉션은
		//사용할 수 없고 List컬렉션을 사용해야한다.
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		//레코드 추출을 위한 select쿼리문 작성
		String query = "SELECT * FROM board WHERE b_flag=? ORDER BY idx DESC ";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, b_flag);
			rs = psmt.executeQuery();
			while(rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setIdx(rs.getInt("idx"));
				dto.setB_flag(rs.getString("b_flag"));
				dto.setBoardTitle(rs.getString("boardTitle"));
				dto.setBoardContent(rs.getString("boardContent"));
				dto.setUserName(rs.getString("userName"));
				dto.setRegidate(rs.getDate("regidate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setNfile(rs.getString("nfile"));
				
				bbs.add(dto);
			}

		} 
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	
	public BoardDTO selectView(String b_flag, int idx) {
		
		BoardDTO dto = new BoardDTO();
		
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
				dto.setIdx(rs.getInt("idx"));
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
		
	public void updateVisitCount(int idx) {
		
		String query = "UPDATE board SET "
				+ " visitCount=visitCount+1 "
				+ " WHERE idx=? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
		} 
		catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		
		try {
			//특정 일련번호에 해당하는 게시물을 수정한다. 
			String query = "UPDATE board SET "
						+ " title=?, content=?, ofile=?, nfile=? "
						+ " WHERE idx=? ";
			
			psmt = con.prepareStatement(query);
			//인파라미터 설정하기
			psmt.setString(1, dto.getBoardTitle());
			psmt.setString(2, dto.getBoardContent());
			psmt.setString(3, dto.getOfile());
			psmt.setString(4, dto.getNfile());
			psmt.setInt(5, dto.getIdx());
			//수정된 레코드의 갯수가 반환된다.
			result = psmt.executeUpdate();
		} 
		catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	//게시물 삭제하기
	public int deletePost(BoardDTO dto) {
		int result = 0;
		
		try {
			//인파라미터가 있는 delete쿼리문 작성
			String query = "DELETE FROM board WHERE idx=?";
			
			psmt = con.prepareStatement(query);
			psmt.setInt(1, dto.getIdx());
			
			result = psmt.executeUpdate();
		} 
		catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
}
