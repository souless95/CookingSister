<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script language="javascript">
	var availableTags = [];

	function navi_on(){
		$('.navi_wrap').show();
		$('#blind').show();
	}

	function navi_close(){
		$('.navi_wrap').hide();
		$('#blind').hide();
	}
</script>

<div id="header">
	<div class="contain clr mt-2">
		<h1><a href="../02Main/Main.jsp" class="h_logo"><img src="../Images/top_logo.png" style="width:140px;"></a></h1>
				<div class="fl">
			<ul class="clr menu">
				<li class=""><a href="../04.RecipeBoard/List.jsp">레시피</a></li>
				<li class=""><a href="../03.MemberBoard/List.jsp">요리 공유</a></li>
			</ul>
		</div>
		<div class="fr">
			<ul class="clr gnb">
				<% 
				if(session.getAttribute("UserId")==null){
				%>
				<li><a href="../01Member/LoginForm.jsp">로그인</a></li>
				<li><a href="../01Member/Regist.jsp">회원가입</a></li>
				<li><a href="../05.CustomerCenter/List.jsp">고객센터</a></li>
				<%
				} else {
				%>
				<li><%=session.getAttribute("UserName") %> 회원님</li>
				<li><a href="../01Member/Edit.jsp">회원정보수정</a></li>				
				<li><a href="../01Member/Logout.jsp">로그아웃</a></li>				
				<%
				}
				%>	
			</ul>
		</div> 
	</div>
</div>

