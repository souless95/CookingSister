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
	JSFunction.alertBack("��ġ�ϴ� ȸ�� ������ �����ϴ�.", out);
}
else{
	out.print("ȸ������ ���̵�� "+dto.getId()+"�Դϴ�.");
}
%>