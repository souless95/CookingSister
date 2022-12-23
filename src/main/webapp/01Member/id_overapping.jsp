<%@page import="java.util.List"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String uId = request.getParameter("id");

MemberDAO dao = new MemberDAO(application);

MemberDTO dto = dao.idCheck(uId);

dao.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 중복확인</title>
    <script type="text/javascript">
	    function idClose(id){
	    	
	    	opener.document.mJoin.mID.readOnly = false;
	    	opener.document.mJoin.mID.value = id;	 
	    	self.close();
	    }
	    function idCheck(frm){
	    	
	    	if(frm.id.value=='') {
	    		alert('아이디를 입력해주세요.');
	    		return;
	    	}	
	    }
    </script>
</head>
<body>
<% if(dto.getId()==null){
	out.print("사용가능한 아이디입니다.");
%>
    <input type="button" value="아이디사용하기" onclick="idClose('<%= uId %>');">
<%
	}
	else {
		out.print("중복된 아이디입니다.");	
		out.print("아이디를 다시 입력해주세요.");	
%>
    <form name="overlapFrm">
    	<input type="text" name="id" size="20">
    	<input type="submit" value="아이디중복확인" onclick="idCheck(this);">
    </form>
<% 
}
%>
</body>
</html>