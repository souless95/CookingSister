<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String fileDir = application.getRealPath("/Uploads");
	
	int maxPostSize = 1024 * 1000;   
	
	String encoding = "UTF-8"; 
	
	try{
		MultipartRequest mr = new MultipartRequest(request, fileDir,
	            maxPostSize, encoding);			
		
		String oFile = mr.getFilesystemName("rFile");
		String nFile = "";
		
		if(oFile != null) {
			String ext = oFile.substring(oFile.lastIndexOf("."));
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			nFile = now + ext;
			
			File oldFile = new File(fileDir + File.separator + oFile);
			File newFile = new File(fileDir + File.separator + nFile);
			oldFile.renameTo(newFile);
		}
		
 		String b_flag = mr.getParameter("b_flag");
 		String boardTitle = mr.getParameter("rTitle");
		String boardContent = mr.getParameter("rContent");
		String userName = mr.getParameter("userName");
	
		
		BoardDTO dto = new BoardDTO();
				
		dto.setB_flag(b_flag);
		dto.setBoardTitle(boardTitle);
		dto.setBoardContent(boardContent);		
		dto.setOfile(oFile);
		dto.setNfile(nFile);
		dto.setUserName(userName);
		
		BoardDAO dao = new BoardDAO(application);
		
		dao.insertMBoard(dto);
		dao.close();
		
		response.sendRedirect("List.jsp");
	}
	catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("errorMessage", "게시글 등록 오류");
		request.getRequestDispatcher("Write.jsp").forward(request, response);
		
		
	}
%>