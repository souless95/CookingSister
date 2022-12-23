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
			alert("��й�ȣ�� �Է��ϼ���");
			form.nPass.focus();
			return false;
		}
		if(form.nPassChk.value==""){
			alert("��й�ȣ ��Ȯ�� ���ּ���");
			form.nPassChk.focus();
			return false;
		}
		if(form.nPass.value!=form.nPassChk.value){
	        alert('�н����尡 ��ġ���� �ʽ��ϴ�.')
	        form.nPass.value='';
	        form.nPassChk.value='';
	        form.nPass.focus();
	        return false;
	    }
	}
</script>
<title>ȸ����й�ȣ ã��</title>
</head>
<body leftmargin="0" topmargin="0" cz-shortcut-listen="true">
	<%
	if (result==1){
	%>
	
	<div class="find_pop">
		<h1>���ο� ��й�ȣ ����</h1>
		<div>
			
			<form action="updatePass.jsp" method="post" onsubmit="return WriteCheck(this);">
				<input type="hidden" name="cID" value="<%= uId %>">
				<div class="text">���ο� ��й�ȣ�� �������ּ���.</div>
				<div class="Line"> </div>
				<dl class="clr">
					<dt class="optionTitle">�� ��й�ȣ</dt>
					<dd class="optionText"><input type="text" class="input" align="absmiddle" name="nPass"></dd>
				</dl>
				<dl class="clr">
					<dt class="optionTitle">�� ��й�ȣ Ȯ��</dt>
					<dd class="optionText"><input type="text" class="input" align="absmiddle" name="nPassChk"></dd>
				</dl>
				<input type="image" src="../Images/btn_find_submit.jpg" class="find_btn">
			</form>
		</div>
	</div>
	
	<%	
	}
	else{
		JSFunction.alertBack("��ġ�ϴ� ȸ�������� �����ϴ�.", out);
	}
	%>
</body>
</html>