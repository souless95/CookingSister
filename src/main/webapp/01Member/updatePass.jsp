<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String uId = request.getParameter("cID");
String uPass = request.getParameter("nPass");

MemberDAO dao = new MemberDAO(application);

int result = dao.updatePass(uId, uPass);

dao.close();

if(result==1){
	out.print("��й�ȣ ������ �Ϸ�Ǿ����ϴ�.");
}
else{
	JSFunction.alertBack("��й�ȣ ���濡 �����߽��ϴ�.", out);
}
%>