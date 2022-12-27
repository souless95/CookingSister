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
	<div class="contain clr pt-1">
		<h1><a href="../02Main/Main.jsp" class="h_logo"><img src="../Images/logo.JPG" style="width:90px;"></a></h1>
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
				<li><a href="xxx">고객센터</a></li>
				<%
				} else {
				%>
				<li><%=session.getAttribute("UserName") %> 회원님</li>
				<li><a href="../01Member/Edit.jsp">회원정보수정</a></li>				
				<li><a href="../01Member/Logout.jsp">로그아웃</a></li>				
				<%
				}
				%>
				<li><a href="javascript:void(0);" class="search_btn"><img src="../Images/icon_h_search.jpg" alt="검색"></a></li>
			</ul>
		</div>
	</div>
</div>
<div class="search_wrap">
	<div class="contain">
		<a href="javascript:search_off();" class="search_close"><img src="/skin/nodskin_argio/images/icon_search_close.jpg" alt="닫기"></a>
		<div class="search_box">
			<input type="text" id="fKeyValue1" name="fKeyValue" value="" maxlength="20">
			<a href="javascript:go_popSearch();"><img src="/skin/nodskin_argio/images/icon_search_btn.jpg" alt="검색"></a>
		</div>
		<div class="search_tag">
			<img src="/skin/nodskin_argio/images/icon_search_tag.jpg" alt="인기검색어">
			<div class="tag_box">
							<a href="javascript:go_popSearch('볶음밥');">볶음밥,</a>
							<a href="javascript:go_popSearch('삼치');">삼치,</a>
							<a href="javascript:go_popSearch('닭');">닭,</a>
							<a href="javascript:go_popSearch('유자');">유자,</a>
							<a href="javascript:go_popSearch('김장');">김장,</a>
							<a href="javascript:go_popSearch('파티');">파티</a>
						</div>
		</div>
	</div>
</div>