<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String loginId = CookieManager.readCookie(request, "loginId");

String cookieCheck = "";

if(!loginId.equals("")){
	cookieCheck = "checked";
}
%>
<html style="" class=" js no-touch csstransitions"><head>
<%@ include file ="../Common/style.jsp" %>
</head>

<body cz-shortcut-listen="true">

<%@ include file ="../Common/Top.jsp" %>
	<hr>
	<!-- Start Container -->
	<div class="contain">
		<div class="login ">
			<div class="mix_title"><h2 class="title">LOGIN</h2>밥못누 홈페이지에 오신 것을 환영합니다.</div>
			<form action="LoginProccess.jsp" method="POST" id="login_form" onsubmit="validateForm(this);">
			<input type="hidden" name="returl" id="returl" value="http://localhost:8585/">
			<input type="hidden" name="nvState" value="3b9d07953da4803160d46f93e0b198fd">
				<ul class="clr login_wrap">
					<li>
						<div class="login_box" id="login_type1">
							<h3 class="title">로그인</h3>
							<div class="member_loginArea clr">
								<ul>
									<li><span>아이디</span><input type="text" id="mId" name="mId" value="<%=loginId%>" class="login_input"></li>
									<li><span>비밀번호</span><input type="password" id="mPw" name="mPw" class="login_input"></li>
								</ul>
								<p class="btn_login" id="login_btn"><input type="image" src="../Images/btn_login.jpg" alt="로그인"></p>
							</div>
								<input type="checkbox" name="save_check" value="Y" <%=cookieCheck%> style="margin-left:88px;">아이디 저장하기
								   <span style="color:red; font-size:1.2em; float:right;">
								      <%=request.getAttribute("LoginErrMsg")==null?
								            "" : request.getAttribute("LoginErrMsg")%>
								   </span>
							<p class="no_login">
								<a href="#" onclick="window.open('idFind.jsp','','width=560,height=355,top='+(screen.availHeight/2-250)+',left='+(screen.availWidth/2-400)+',status=yes,scrollbars=no')">아이디 찾기</a><span class="line">|</span>
								<a href="#" onclick="window.open('passFind.jsp','','width=560,height=410,top='+(screen.availHeight/2-250)+',left='+(screen.availWidth/2-400)+',status=yes,scrollbars=no')">비밀번호 찾기</a><span class="line">|</span>
								<a href="Regist.jsp">회원가입</a>
							</p>
						</div>
					</li>
					<li>
					<div class="login_social">
						<h3 class="title">소셜로그인</h3>
						<div class="btn_wrap">
							<a href="" id="fbLogin"><img src="../Images/btn_login_face.jpg" alt=""></a>
							<a href="" id="naver_id_login_anchor"><img src="../Images/btn_login_naver.jpg" alt=""></a>
							<a href="" id="kkLogin"><img src="../Images/btn_login_kakao.jpg" alt=""></a>
						</div>
					</div>
				</li>
				</ul>
			</form>
		</div>
	</div>

<div id="fb-root" class=" fb_reset"><div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
<div></div></div></div>

<%@ include file ="../Common/Bottom.jsp" %>
</body>
</html>