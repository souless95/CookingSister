<%@page import="recipe.RecipeDTO"%>
<%@page import="java.util.List"%>
<%@page import="recipe.RecipeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
RecipeDAO dao = new RecipeDAO(application);

List<RecipeDTO> newestLists = dao.selectNewest();
List<RecipeDTO> visitLists = dao.selecVisitList();
//자원해제
dao.close();
%>
<!DOCTYPE html>
<html style="" class=" js no-touch csstransitions">
<head>
<%@ include file="../Common/style.jsp"%>
</head>
<body cz-shortcut-listen="true">

	<%@ include file="../Common/Top.jsp"%>

	<div id="con_wrapper">

		<!-- Start Container -->
		<div class="main_wrap">
			<!-- S: 메인 베너 -->
			<div class="main_top">
				<div class="main_top_slide">
					<ul class="mt_slide">
						<li style="background-color: #fff">
							<div class="contain">
								<a href="http://www.yes24.com/Product/Goods/114635008"
									class="clr">
									<div class="text_box fl">
										<p class="s_title"></p>
										<p class="b_title" title=""></p>
									</div> <img src="../Design/1666861163_phpzeLauY.jpg" alt="">
								</a>
							</div>
						</li>
						<li style="background-color: #fff">
							<div class="contain">
								<a href="https://link.inpock.co.kr/2babcha" class="clr">
									<div class="text_box fl">
										<p class="s_title"></p>
										<p class="b_title" title=""></p>
									</div> <img src="../Design/1659662005_php71bfwZ.png" alt="">
								</a>
							</div>
						</li>
						<li style="background-color: #fff">
							<div class="contain">
								<a href="https://youtu.be/dBzZig8Mmig" class="clr">
									<div class="text_box fl">
										<p class="s_title"></p>
										<p class="b_title" title=""></p>
									</div> <img src="../Design/1660013775_phphQEQHO.png" alt="">
								</a>
							</div>
						</li>
						<li style="background-color: #fff">
							<div class="contain">
								<a href="https://2bc.co.kr/" class="clr">
									<div class="text_box fl">
										<p class="s_title"></p>
										<p class="b_title" title=""></p>
									</div> <img src="../Design/1568082517_php1ZeBZD.jpg" alt="">
								</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<!-- E: 메인 베너 -->


			<!-- S: 최신 레시피 -->
			<div class="contain">

				<div class="main_box main_new">
					<h2 class="def_title">최신 레시피</h2>
					<div class="rec_list">
						<ul class="clr">
							<%
							for (RecipeDTO dto : newestLists) {
							%>
							<li style="width:19%"><a
								href="../04.RecipeBoard/View.jsp?idx=<%= dto.getIdx() %>">
									<div class="img_wrap" style="margin-bottom:10px;">
										<img
											src="../Images/Recipes/<%=dto.getrNfile()%>"
											alt="" style="width: 100%">
									</div>
									<div class="text_box">
										<p class="s_title"><%=dto.getrTitle()%></p>
										<p class="b_title" title="<%=dto.getrName()%>"><%=dto.getrName()%></p>
									</div>
							</a></li>
							<%
							}
							%>
						</ul>
					</div>
				</div>
			</div>
			<!-- E: 최신 레시피 -->
			
						<!-- S: 최신 레시피 -->
			<div class="contain">

				<div class="main_box main_new">
					<h2 class="def_title">조회수 많은 레시피</h2>
					<div class="rec_list">
						<ul class="clr">
							<%
							for (RecipeDTO dto : visitLists) {
							%>
							<li style="width:19%"><a
								href="../04.RecipeBoard/View.jsp?idx=<%= dto.getIdx() %>">
									<div class="img_wrap" style="margin-bottom:10px;">
										<img
											src="../Images/Recipes/<%=dto.getrNfile()%>"
											alt="" style="width: 100%">
									</div>
									<div class="text_box">
										<p class="s_title"><%=dto.getrTitle()%></p>
										<p class="b_title" title="<%=dto.getrName()%>"><%=dto.getrName()%></p>
									</div>
							</a></li>
							<%
							}
							%>
						</ul>
					</div>
				</div>
			</div>
			<!-- E: 최신 레시피 -->
				
			<%@ include file="../Common/Bottom.jsp"%>
</body>
</html>