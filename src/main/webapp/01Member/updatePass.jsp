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
	out.print("비밀번호 변경이 완료되었습니다.");
}
else{
	JSFunction.alertBack("비밀번호 변경에 실패했습니다.", out);
}
%>