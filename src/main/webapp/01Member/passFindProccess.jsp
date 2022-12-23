<%@page import="membership.MemberDTO"%>
<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String uId = request.getParameter("cID");
String uName = request.getParameter("cName");
String uEmail = request.getParameter("cEmail1")
				+"@"
				+ request.getParameter("cEmail2");

MemberDAO dao = new MemberDAO(application);

int result = dao.passFind(uId, uName, uEmail);

dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="../Design/style.css">
<script type="text/javascript">
	function WriteCheck(form) {
		if(form.nPass.value==""){
			alert("비밀번호를 입력하세요");
			form.nPass.focus();
			return false;
		}
		if(form.nPassChk.value==""){
			alert("비밀번호 재확인 해주세요");
			form.nPassChk.focus();
			return false;
		}
		if(form.nPass.value!=form.nPassChk.value){
	        alert('패스워드가 일치하지 않습니다.')
	        form.nPass.value='';
	        form.nPassChk.value='';
	        form.nPass.focus();
	        return false;
	    }
	}
</script>
<title>회원비밀번호 찾기</title>
</head>
<body leftmargin="0" topmargin="0" cz-shortcut-listen="true">
	<%
	if (result==1){
	%>
	
	<div class="find_pop">
		<h1>새로운 비밀번호 설정</h1>
		<div>
			
			<form action="updatePass.jsp" method="post" onsubmit="return WriteCheck(this);">
				<input type="hidden" name="cID" value="<%= uId %>">
				<div class="text">새로운 비밀번호를 설정해주세요.</div>
				<div class="Line"> </div>
				<dl class="clr">
					<dt class="optionTitle">새 비밀번호</dt>
					<dd class="optionText"><input type="text" class="input" align="absmiddle" name="nPass"></dd>
				</dl>
				<dl class="clr">
					<dt class="optionTitle">새 비밀번호 확인</dt>
					<dd class="optionText"><input type="text" class="input" align="absmiddle" name="nPassChk"></dd>
				</dl>
				<input type="image" src="../Images/btn_find_submit.jpg" class="find_btn">
			</form>
		</div>
	</div>
	
	<%	
	}
	else{
		JSFunction.alertBack("일치하는 회원정보가 없습니다.", out);
	}
	%>
</body>
</html>