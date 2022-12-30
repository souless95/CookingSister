<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./IsLoggedIn.jsp" %>

<%
	String fileDir = application.getRealPath("/Uploads");
	
	int maxPostSize = 1024 * 1000;   
	
	String encoding = "UTF-8"; 

	MultipartRequest mr = new MultipartRequest(request, fileDir,
            maxPostSize, encoding);			
	
	String oFile = mr.getFilesystemName("rFile");
	String ext = oFile.substring(oFile.lastIndexOf("."));
	String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	String nFile = now + ext;
	
	File oldFile = new File(fileDir + File.separator + oFile);
	File newFile = new File(fileDir + File.separator + nFile);
	oldFile.renameTo(newFile);
	
	
	int idx = Integer.parseInt(mr.getParameter("idx"));
	String boardTitle = mr.getParameter("rTitle");
	String boardContent = mr.getParameter("rContent");
	String b_flag = mr.getParameter("b_flag");

	
	BoardDTO dto = new BoardDTO();
			
	dto.setIdx(idx);
	dto.setBoardTitle(boardTitle);
	dto.setBoardContent(boardContent);
	dto.setOfile(oFile);
	dto.setNfile(nFile);
	
	BoardDAO dao = new BoardDAO(application);
	
	int affected = dao.updateEdit(dto);
	
	dao.close();

	if (affected == 1){
		/*
		수정이 완료되었으면 수정된 내용을 확인하기 위해 주로 내용보기
		페이지로 이동한다.
		*/
		response.sendRedirect("View.jsp?b_flag="+ b_flag + "&idx=" + idx);
	}
	else {
		//수정에 실패하면 뒤로 이동한다.
		JSFunction.alertBack("수정하기에 실패하였습니다.", out);
	}
%>