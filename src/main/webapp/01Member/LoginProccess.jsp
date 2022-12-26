<%@page import="utils.CookieManager"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
//로그인 폼에서 입력한 아이디, 패스워드를 받는다.
String userId = request.getParameter("mId");
String userPwd = request.getParameter("mPw");
String save_check = request.getParameter("save_check");

MemberDAO dao = new MemberDAO(application);

MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);

dao.close();

if (memberDTO.getId() != null) {

	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getUserName());
	
	if(save_check != null && save_check.equals("Y")){
		CookieManager.makeCookie(response, "loginId", userId, 86400);
	}
	else{
		CookieManager.deleteCookie(response, "loginId");
	}  
	
 	response.sendRedirect("../02Main/Main.jsp");
/* 	response.sendRedirect("../02Main/Main.jsp"); */
}
else{
	//로그인에 실패한 경우라면...
	//리퀘스트 영역에 에러메세지를 저장한다.
	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	//그리고 로그인 페이지로 '포워드'한다.
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
}
%>