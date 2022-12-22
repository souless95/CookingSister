<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <!--
    JSP연동 이후 실행가능한 코드. 파라미터로 전달된 id를 받아온다.
    -->  

    <h3>부모창에서 입력한 아이디 : <%=request.getParameter("id")%></h3>

    <h3>아이디가 중복되었을때 재입력한 아이디</h3>
    <form name="overlapFrm">
        <input type="text" name="retype_id" size="20">
        <input type="button" value="아이디사용하기" onclick="idUse();">
    </form>
</body>
</html>