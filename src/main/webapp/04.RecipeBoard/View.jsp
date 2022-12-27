<%@page import="recipe.RecipeDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="recipe.RecipeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int idx = Integer.parseInt(request.getParameter("idx"));

RecipeDAO dao = new RecipeDAO(application);

dao.updateVisitCount(idx);

RecipeDTO dto = dao.selectView(idx);

dao.close();
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
				<div class="fl rec_view_img">
					<img alt="" src="../Images/Recipes/<%= dto.getrNfile() %>">
				</div>
				<div class="fr rec_info">
					<div class="rec_exp">
						<h2 class="prod_title"><%= dto.getrName() %></h2>
						<p class="s_title"><%= dto.getrTitle() %></p>
						<div class="text_box">
							<%= dto.getrContent().replace("\r\n", "<br/>") %>
						</div>
					</div>
					<div class="rec_mate">
						<div class="mate_title clr">재료</div>
						<div class="text_box">
							<h3 class="s_title">필수재료</h3>
							<p class="mate_list"><%= dto.getrMust() %></p>
						</div>
						<div class="text_box">
							<h3 class="s_title">양념</h3>
							<p class="mate_list">
								<%= dto.getrSeason() %><br>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="rec_content">
			<%
			if (dto.getrContentOfile()!=null){									
			%>
            	<img alt="" src="../Images/Recipes/<%= dto.getrContentNfile() %>">
			<%								
			}
			%>
			</div>
		</div>
	</div>
	<%@ include file="../Common/Bottom.jsp"%>
</body>
</html>