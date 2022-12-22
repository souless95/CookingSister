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
		<h1><a href="./" class="h_logo"><img src="../Images/logo.JPG" style="width:90px;"></a></h1>
				<div class="fl">
			<ul class="clr menu">
				<li class=""><a href="xxx">레시피</a></li>
				<li class=""><a href="xxx">밥못누 TV</a></li>
				<li class=""><a href="xxx">요리공유</a></li>
			</ul>
		</div>
		<div class="fr">
			<ul class="clr gnb">
				<li><a href="../01Member/LoginForm.jsp">로그인</a></li>
				<li><a href="../01Member/Regist.jsp">회원가입</a></li>
				<li><a href="xxx">고객센터</a></li>
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
<div class="navi_wrap">
	<div class="contain">
		<a href="javascript:navi_close();" class="navi_close"><img src="/skin/nodskin_argio/images/btn_navi_close.jpg" alt=""></a>
		<div class="w_bg">
			<table cellspacing="0" class="navi_al">
				<tbody><tr>
					<th><img src="/skin/nodskin_argio/images/icon_navi_1.jpg" alt="">레시피</th>
					<th><img src="/skin/nodskin_argio/images/icon_navi_2.jpg" alt="">이밥차 TV</th>
					<th><img src="/skin/nodskin_argio/images/icon_navi_3.jpg" alt="">맛있는 생활</th>
					<th class="lt0"><img src="/skin/nodskin_argio/images/icon_navi_4.jpg" alt="">SHOP</th>
					<th><img src="/skin/nodskin_argio/images/icon_navi_5.jpg" alt="">이밥차</th>
					<th><img src="/skin/nodskin_argio/images/icon_navi_6.jpg" alt="">마이페이지</th>
				</tr>
				<tr>
					<td>
						<ul class="navi_list">
							<li><a href="tv.php?id=list">이밥차 TV</a></li>
						</ul>
					</td>
					<td>
						<ul class="navi_list">
							<li><a href="bbs.php?id=timeLine">맛있는 생활</a></li>
						</ul>
					</td>
					<td>
						<ul class="navi_list">
							<li><a href="https://2bob.co.kr/shop_login.php">로그인</a></li>
							<li><a href="https://2bob.co.kr/login.php?a=choice">회원가입</a></li>
							<li><a href="mypage.php?a=info">나의 정보 수정</a></li>
						</ul>
					</td>
				</tr>
			</tbody></table>
		</div>
	</div>
	h2
</div>