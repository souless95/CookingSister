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
				alert("�̸��� �Է����ּ���");
				d.cName.focus();
				return false;
			}
			if(d.cEmail.value==""){
				alert("�̸����� �Է����ּ���");
				d.cEmail.focus();
				return false;
			}
	}
</script>

<title>Insert title here</title>
</head>
<body leftmargin="0" topmargin="0" cz-shortcut-listen="true">
	<div class="find_pop">
		<h1>���̵�ã��</h1>
		<div>
			
			<form action="idFindProccess.jsp" method="post" onsubmit="return WriteCheck();">
				<input type="hidden" name="cFind" value="id">
				<div class="text">���̵� �ؾ�����̳���?ȸ������ ����� �̸����� �Է��Ͽ� �ּ���.</div>
				<div class="Line"> </div>
				<dl class="clr">
					<dt class="optionTitle">�̸�</dt>
					<dd class="optionText"><input type="text" class="input" align="absmiddle" name="cName"><!--�̸�---></dd>
				</dl>
				<dl class="clr">
					<dt class="optionTitle">�̸���</dt>
					<dd class="optionText"><input type="text" class="input" align="absmiddle" name="cEmail"></dd>
				</dl>
				<input type="image" src="../Images/btn_find_submit.jpg" class="find_btn">
			</form>
		</div>
	</div>

</body>
</html>