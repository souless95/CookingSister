<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ȸ����й�ȣ ã��</title>
<link rel="stylesheet" type="text/css" href="../Design/style.css">
<script type="text/javascript">
	function WriteCheck(){
		var d = document.all;
	
			if(d.cID.value==""){
				alert("���̵� �Է����ּ���");
				d.cID.focus();
				return false;
			}
			if(d.cName.value==""){
				alert("�̸��� �Է����ּ���");
				d.cName.focus();
				return false;
			}
			if(d.cEmail1.value==""){
				alert("�̸����� �Է����ּ���");
				d.cEmail1.focus();
				return false;
			}
			if(d.cEmail2.value==""){
				alert(d.cEmail1.value);
				console.log(d.cEmail1);
				console.log(d.cEmail1.value);
				alert("�̸����� �Է����ּ���");
				d.cEmail2.focus();
				return false;
			}
			var e = d.cEmail1.value + '@' + d.cEmail2.value;
			d.cEmail.value = e;
	}
</script>
</head>
<body leftmargin="0" topmargin="0" cz-shortcut-listen="true">
	<div class="find_pop">
		<h1>��й�ȣ ã��</h1>
		<div>
			<form action="passFindProccess.jsp" method="post" onsubmit="return WriteCheck();">
					<input type="hidden" name="cFind" value="pw2">
					<input type="hidden" id="cEmail" name="cEmail">
					<div class="text">��й�ȣ�� �ؾ�����̳���? ȸ������ ����, ���̵�, �̸����� �Է��Ͽ� �ּ���.</div>
					<dl class="clr">
						<dt class="optionTitle">���̵�</dt>
						<dd class="optionText"><input type="text" class="input" align="absmiddle" name="cID"><!--���̵�---></dd>
					</dl>
					<dl class="clr">
						<dt class="optionTitle">�̸�</dt>
						<dd class="optionText"><input type="text" class="input" align="absmiddle" name="cName"><!--�̸�---></dd>
					</dl>
					<dl class="clr">
						<dt class="optionTitle">�̸���</dt>
						<dd class="optionText"><input type="text" class="input wd128" align="absmiddle" name="cEmail1">@<input type="text" class="input wd215" align="absmiddle" name="cEmail2"></dd>
					</dl>
					<input type="image" src="../Images/btn_find_submit.jpg" class="find_btn">
			</form>
		</div>
	</div>
</body>
</html>