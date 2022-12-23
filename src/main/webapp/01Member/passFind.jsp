<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="../Design/style.css">
<script type="text/javascript">
	function WriteCheck(){
		var d = document.all;
	
			if(d.cID.value==""){
				alert("아이디를 입력해주세요");
				d.cID.focus();
				return false;
			}
			if(d.cName.value==""){
				alert("이름을 입력해주세요");
				d.cName.focus();
				return false;
			}
			if(d.cEmail1.value==""){
				alert("이메일을 입력해주세요");
				d.cEmail1.focus();
				return false;
			}
			if(d.cEmail2.value==""){
				alert(d.cEmail1.value);
				console.log(d.cEmail1);
				console.log(d.cEmail1.value);
				alert("이메일을 입력해주세요");
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
		<h1>비밀번호 찾기</h1>
		<div>
			<form action="passFindProccess.jsp" method="post" onsubmit="return WriteCheck();">
					<input type="hidden" name="cFind" value="pw2">
					<input type="hidden" id="cEmail" name="cEmail">
					<div class="text">비밀번호를 잊어버리셨나요? 회원님의 성명, 아이디, 이메일을 입력하여 주세요.</div>
					<dl class="clr">
						<dt class="optionTitle">아이디</dt>
						<dd class="optionText"><input type="text" class="input" align="absmiddle" name="cID"><!--아이디---></dd>
					</dl>
					<dl class="clr">
						<dt class="optionTitle">이름</dt>
						<dd class="optionText"><input type="text" class="input" align="absmiddle" name="cName"><!--이름---></dd>
					</dl>
					<dl class="clr">
						<dt class="optionTitle">이메일</dt>
						<dd class="optionText"><input type="text" class="input wd128" align="absmiddle" name="cEmail1">@<input type="text" class="input wd215" align="absmiddle" name="cEmail2"></dd>
					</dl>
					<input type="image" src="../Images/btn_find_submit.jpg" class="find_btn">
			</form>
		</div>
	</div>
</body>
</html>