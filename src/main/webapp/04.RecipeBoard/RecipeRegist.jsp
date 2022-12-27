<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <script>
        function validateForm(form) {
        	if(form.rName.value==""){
        		alert("레시피명을 입력해주세요");
        		form.rName.focus();
        		return false;
        	}
        	if(form.rTitle.value==""){
        		alert("한줄소개를 입력해주세요");
        		form.rTitle.focus();
        		return false;
        	}
        	if(form.rOfile.value==""){
        		alert("이미지를 첨부해주세요");
        		form.rOfile.focus();
        		return false;
        	}
        }
    </script>
<title>Insert title here</title>
</head>
<body>
	<form method="post" name="RegiRecipe" enctype="multipart/form-data"
		action="RegistProccess.jsp" onsubmit="return validateForm(this);">
		*레시피명 : <input type="text" name="rName" /><br />
		*한줄소개 : <input type="text" name="rTitle" /><br />
		*이미지 : <input type="file" name="rOfile" /><br />
		설명 : <textarea rows="" cols="" name="rContent"></textarea><br />
		상세 이미지 : <input type="file" name="rContentOfile" /><br />
		필수재료 : <input type="text" name="rMust" /><br />
		양념 : <input type="text" name="rSeason" /><br />
		<input type="submit" value="전송" />
	</form>
</body>
</html>