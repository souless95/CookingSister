<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String name = request.getParameter("cName");
String email = request.getParameter("cEmail");

MemberDAO dao = new MemberDAO(application);

MemberDTO dto = dao.idFind(name, email);

dao.close();

if (dto.getId()==null){
	JSFunction.alertBack("일치하는 회원 정보가 없습니다.", out);
}
else{
	out.print("회원님의 아이디는 "+dto.getId()+"입니다.");
}
%>