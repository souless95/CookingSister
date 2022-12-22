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
	    function idUse(){
	        self.close();
	    }
    </script>
</head>
<body>
<% if(dto.getId()==null){
	out.print("사용가능한 아이디입니다.");
}
else{
	out.print("중복된 아이디입니다.");	
} %>
    <h3>아이디가 중복되었을때 재입력한 아이디</h3>
    <form name="overlapFrm">
        <input type="text" name="retype_id" size="20">
        <input type="button" value="아이디사용하기" onclick="idUse();">
    </form>
</body>
</html>