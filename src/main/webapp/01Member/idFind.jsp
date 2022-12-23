<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="../Design/style.css">
<script language="javascript">
	function WriteCheck(){
		var d = document.all;
			if(d.cName.value==""){
				alert("이름을 입력해주세요");
				d.cName.focus();
				return false;
			}
			if(d.cEmail.value==""){
				alert("이메일을 입력해주세요");
				d.cEmail.focus();
				return false;
			}
	}
</script>

<title>Insert title here</title>
</head>
<body leftmargin="0" topmargin="0" cz-shortcut-listen="true">
	<div class="find_pop">
		<h1>아이디찾기</h1>
		<div>
			
			<form action="idFindProccess.jsp" method="post" onsubmit="return WriteCheck();">
				<input type="hidden" name="cFind" value="id">
				<div class="text">아이디를 잊어버리셨나요?회원님의 성명과 이메일을 입력하여 주세요.</div>
				<div class="Line"> </div>
				<dl class="clr">
					<dt class="optionTitle">이름</dt>
					<dd class="optionText"><input type="text" class="input" align="absmiddle" name="cName"><!--이름---></dd>
				</dl>
				<dl class="clr">
					<dt class="optionTitle">이메일</dt>
					<dd class="optionText"><input type="text" class="input" align="absmiddle" name="cEmail"></dd>
				</dl>
				<input type="image" src="../Images/btn_find_submit.jpg" class="find_btn">
			</form>
		</div>
	</div>

</body>
</html>