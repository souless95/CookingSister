<%@page import="recipe.RecipeDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="recipe.RecipeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../Common/style.jsp"%>
</head>
<body>
	<%@ include file="../Common/Top.jsp"%>
	<div class="recipe_contian">
		<div class="contain" style="height: auto !important;">
			<div class="rec_view_top clr">
				<div class="fl rec_view_img"></div>
				<div class="fr rec_info">
					<div class="rec_exp">
						<h2 class="prod_title">반숙명란덮밥</h2>
						<p class="s_title">불 없이 만든 한 그릇</p>
						<div class="text_box">
							혼자 점심 먹는 주부나 싱글들을 위한 <br> 실용적인 1인분 레시피
						</div>
					</div>
					<div class="rec_mate">
						<div class="mate_title clr">재료</div>
						<div class="text_box">
							<h3 class="s_title">필수재료</h3>
							<p class="mate_list">대파(9cm), 명란젓(1개), 밥(1공기), 달걀(1개)</p>
						</div>
						<div class="text_box">
							<h3 class="s_title">양념</h3>
							<p class="mate_list">
								버터(0.5), 간장(0.5)<br> Tip_마가린이나 참기름을 넣어도 좋아요.
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="rec_content"></div>
		</div>
	</div>
	<%@ include file="../Common/Bottom.jsp"%>
</body>
</html>