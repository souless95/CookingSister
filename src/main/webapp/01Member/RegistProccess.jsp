<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

MemberDAO dao = new MemberDAO(application);

String id = request.getParameter("mID");
String pass = request.getParameter("mPass");
String userName = request.getParameter("mName");
String email = request.getParameter("mEmail1") +"@"
			+ request.getParameter("mEmail2");
String phone = request.getParameter("mPhone1")
			+ request.getParameter("mPhone2")
			+ request.getParameter("mPhone3");


MemberDTO dto = new MemberDTO();

dto.setId(id);
dto.setPass(pass);
dto.setUserName(userName);
dto.setEmail(email);
dto.setPhone(phone);

int iResult = dao.registMember(dto);
dao.close();

if(iResult==1){
	JSFunction.alertLocation(id+"님, 가입을 축하드립니다.", "LoginForm.jsp", out);
}
else{
	request.getRequestDispatcher("Regist.jsp")
	.forward(request, response);
}
%>