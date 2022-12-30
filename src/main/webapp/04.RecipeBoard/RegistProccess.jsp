<%@page import="recipe.RecipeDAO"%>
<%@page import="recipe.RecipeDTO"%>
<%@page import="utils.JSFunction"%>
<%@page import="org.apache.catalina.manager.DummyProxySession"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String fileDir = application.getRealPath("/Images/Recipes");
	
	int maxPostSize = 5 * 1024 * 1024;   
	
	String encoding = "UTF-8"; 
	
	try{
		MultipartRequest mr = new MultipartRequest(request, fileDir,
	            maxPostSize, encoding);	
		
		/* 	
		if(mr==null) {
			out.print("첨부파일이 제한용량을 초과했습니다.");
			response.`sendRedirect("./HomeMain.jsp");
			return;
		} */
					
		String fileName1 = mr.getFilesystemName("rOfile");
		String newFileName1 ="";

		if(fileName1 != null) {
			String ext1 = fileName1.substring(fileName1.lastIndexOf("."));
			String now1 = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			newFileName1 = now1 + ext1;
			
			File oldFile1 = new File(fileDir + File.separator + fileName1);
			File newFile1 = new File(fileDir + File.separator + newFileName1);
			oldFile1.renameTo(newFile1);
		}
		
		String fileName2 = mr.getFilesystemName("rContentOfile");
		String newFileName2 ="";
		
		if(fileName2 != null) {
			String ext2 = fileName2.substring(fileName2.lastIndexOf("."));
			String now2 = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			newFileName2 = now2 + ext2;
			
			File oldFile2 = new File(fileDir + File.separator + fileName2);
			File newFile2 = new File(fileDir + File.separator + newFileName2);
			oldFile2.renameTo(newFile2);
		}
		
 		String rName = mr.getParameter("rName");
		String rTitle = mr.getParameter("rTitle");
		String rContent = mr.getParameter("rContent");
		String rMust = mr.getParameter("rMust");
		String rSeason = mr.getParameter("rSeason");
			
		RecipeDTO dto = new RecipeDTO();
		dto.setrName(rName);
		dto.setrTitle(rTitle);
		dto.setrOfile(fileName1);
		dto.setrNfile(newFileName1);
		dto.setrContent(rContent);
		dto.setrContentOfile(fileName2);
		dto.setrContentNfile(newFileName2);
		dto.setrMust(rMust);
		dto.setrSeason(rSeason);
		
		RecipeDAO dao = new RecipeDAO(application);
		dao.insertRecipe(dto);
		dao.close();
		
		JSFunction.alertLocation("등록이 완료됐습니다.", "Regist.jsp", out);
	}
	catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("errorMessage", "레시피 등록 오류");
		request.getRequestDispatcher("RecipeRegist.jsp").forward(request, response);		
		
	}
%>