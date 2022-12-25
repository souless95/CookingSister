<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

MemberDAO dao = new MemberDAO(application);

String id = session.getAttribute("UserId").toString();
String pass = request.getParameter("mPass");
String email = request.getParameter("mEmail1") +"@"
			+ request.getParameter("mEmail2");
String phone = request.getParameter("mPhone1")
			+ request.getParameter("mPhone2")
			+ request.getParameter("mPhone3");


MemberDTO dto = new MemberDTO();

dto.setId(id);
dto.setPass(pass);
dto.setEmail(email);
dto.setPhone(phone);

int iResult = dao.editMember(dto);

dao.close();

if(iResult==1){
	JSFunction.alertBack(id+"님, 회원정보가 수정되었습니다.", out);
}
else{
	request.getRequestDispatcher("Edit.jsp")
	.forward(request, response);
}
%>