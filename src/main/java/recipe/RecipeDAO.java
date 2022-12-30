package recipe;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class RecipeDAO extends JDBConnect {

	public RecipeDAO(ServletContext application) {
		super(application);
	}
	
	public int insertRecipe(RecipeDTO dto) {
		int result = 0;
		try {
			String query = "INSERT INTO recipe ( "
					+ " rName, rOfile, rNfile, rTitle, rContent, rContentOfile"
					+ ", rContentNfile, rMust, rSeason) "
					+ " VALUES ( "
					+ " ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getrName());
			psmt.setString(2, dto.getrOfile());
			psmt.setString(3, dto.getrNfile());
			psmt.setString(4, dto.getrTitle());
			psmt.setString(5, dto.getrContent());
			psmt.setString(6, dto.getrContentOfile());
			psmt.setString(7, dto.getrContentNfile());
			psmt.setString(8, dto.getrMust());
			psmt.setString(9, dto.getrSeason());
			
			result = psmt.executeUpdate();		
		}
		catch (Exception e) {
			System.out.println("레시피 INSERT 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int selectCount(String searchWord) {
		
		//결과(게시물 수)를 담을 변수
		int totalCount = 0;
		
		//게시물 수를 얻어오는 쿼리문 작성
		String query = "SELECT COUNT(*) FROM recipe ";
		//검색어가 있는 경우 where절을 추가하여 조건에 맞는 게시물만
		//추출한다.
		
		 if (searchWord != null) {
			 query += " WHERE rName LIKE '%?%' ";
		 }
		
		try {
			//정적쿼리문 실행을 위한 Statement객체 생성
			psmt = con.prepareStatement(query);
			psmt.setString(1, searchWord);
			rs = psmt.executeQuery();
			
			//커서를 첫번째 행으로 이동하여 레코드를 읽는다.
			rs.next();
			//첫번째 컬럼의 값을 가져와서 변수에 저장한다. 
			totalCount = rs.getInt(1);
		} 
		catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	//작성한 게시물을 반환한다. 특히 반환값은 여러개의 레코드를
	//반환할 수 있으므로 List컬렉션을 반환타입으로 정의한다. 
	public List<RecipeDTO> selectList(String searchWord) {
		
		//List계열의 컬렉션을 생성한다. 이때 타입 매개변수는
		//BoardDTO객체로 설정한다.
		//게시판 목록은 출력 순서가 보장되야 하므로 Set컬렉션은
		//사용할 수 없고 List컬렉션을 사용해야한다.
		List<RecipeDTO> bbs = new Vector<RecipeDTO>();
		
		//레코드 추출을 위한 select쿼리문 작성
		String query = "SELECT * FROM recipe ";
		//검색어가 있는 경우 where절을 추가하여 조건에 맞는 게시물만
		//추출한다.
		
		 if (searchWord != null) {
			 //query += " WHERE rName LIKE '%'||?||'%' ";
			 query += " WHERE rName LIKE '%"+searchWord+"%' ";
		 }
		//최근게시물을 상단에 노출하기 위해 내림차순으로 정렬한다.
		query += "ORDER BY idx DESC ";
		
		System.out.println(query);
		
		try {
			//쿼리실행 및 결과값 반환
			psmt = con.prepareStatement(query);
			psmt.setString(1, searchWord);
			rs = psmt.executeQuery();
			//2개 이상의 레코드가 반환될수 있으므로 while문을 사용
			//갯수만큼 반복하게 된다.
			while(rs.next()) {
				//하나의 레코드를 저장할 수 있는 DTO객체를 생성
				RecipeDTO dto = new RecipeDTO();
				
				//setter()를 이용해서 각 컬럼의 값을 저장
				dto.setIdx(rs.getInt("idx"));
				dto.setrTitle(rs.getString("rTitle"));
				dto.setrName(rs.getString("rName"));
				dto.setrOfile(rs.getString("rOfile"));
				dto.setrNfile(rs.getString("rNfile"));
				
				//List컬렉션에 DTO객체를 추가한다. 
				bbs.add(dto);
			}
			
			for (RecipeDTO rDto : bbs) {
				
				System.out.println(rDto.getrName());
			
			}

		} 
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	
	public RecipeDTO selectView(int idx) {
		
		RecipeDTO dto = new RecipeDTO();
		
		String query = "SELECT * FROM recipe "
				+ " WHERE idx=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setIdx(rs.getInt("idx"));
				dto.setrName(rs.getString("rName"));
				dto.setrOfile(rs.getString("rOfile"));
				dto.setrNfile(rs.getString("rNfile"));
				dto.setrTitle(rs.getString("rTitle"));
				dto.setrContent(rs.getString("rContent"));
				dto.setrContentOfile(rs.getString("rContentOfile"));
				dto.setrContentNfile(rs.getString("rContentNfile"));
				dto.setrMust(rs.getString("rMust"));
				dto.setrSeason(rs.getString("rSeason"));
				dto.setrVisitCount(rs.getInt("rVisitCount"));
				dto.setRegidate(rs.getDate("regidate"));
			}
		} 
		catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public void updateVisitCount(int idx) {
		
		String query = "UPDATE recipe SET "
				+ " rVisitCount=rVisitCount+1 "
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
	
	public List<RecipeDTO> selectNewest() {
		
		List<RecipeDTO> bbs = new Vector<RecipeDTO>();
		
		String query = "SELECT * FROM recipe "
				+ " ORDER BY regidate DESC "
				+ " LIMIT 5";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				RecipeDTO dto = new RecipeDTO();
				
				dto.setIdx(rs.getInt("idx"));
				dto.setrTitle(rs.getString("rTitle"));
				dto.setrName(rs.getString("rName"));
				dto.setrOfile(rs.getString("rOfile"));
				dto.setrNfile(rs.getString("rNfile"));
				
				bbs.add(dto);
			}

		} 
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return bbs;
	}

public List<RecipeDTO> selecVisitList() {
		
		List<RecipeDTO> bbs = new Vector<RecipeDTO>();
		
		String query = "SELECT * FROM recipe "
				+ " ORDER BY rVisitCount DESC "
				+ " LIMIT 5";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				RecipeDTO dto = new RecipeDTO();
				
				dto.setIdx(rs.getInt("idx"));
				dto.setrTitle(rs.getString("rTitle"));
				dto.setrName(rs.getString("rName"));
				dto.setrOfile(rs.getString("rOfile"));
				dto.setrNfile(rs.getString("rNfile"));
				
				bbs.add(dto);
			}

		} 
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
}
