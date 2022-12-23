<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
//로그인 폼에서 입력한 아이디, 패스워드를 받는다.
String userId = request.getParameter("mId");
String userPwd = request.getParameter("mPw");


MemberDAO dao = new MemberDAO(application);

MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);

dao.close();

if (memberDTO.getId() != null) {
	//로그인에 성공한 경우라면...
	//세션영역에 회원아이디와 이름을 저장한다. 
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getUserName());
	//그리고 로그인 페이지로 '이동'한다.
	response.sendRedirect("LoginForm.jsp");
}
else{
	//로그인에 실패한 경우라면...
	//리퀘스트 영역에 에러메세지를 저장한다.
	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	//그리고 로그인 페이지로 '포워드'한다.
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
}
%>