<%@page import="recipe.RecipeDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="recipe.RecipeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
RecipeDAO dao = new RecipeDAO(application);

String searchWord = request.getParameter("searchWord");

int totalCount = dao.selectCount(searchWord);

List<RecipeDTO> recipeLists = dao.selectList(searchWord);

dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../Common/style.jsp"%>
<!-- <script type="text/javascript">
	function searchView(){
		var sResult = document.getElementById("sResult");
		
		sResult.style.display = "";
	}
</script> -->
</head>
<body>
	<%@ include file="../Common/Top.jsp"%>
	<div class="contain">
		<!-- 검색창 -->
		<div class="search_top">
			<form method="get">
				<div class="search_box">
					<input type="text" id="searchWord" name="searchWord" maxlength="20" style="float:;">
					<input type="image" src="../Design/icon_search_btn.jpg"  alt="검색" style="width:45px; margin-left:-10px;">
				</div>
			</form>
					<%
						if (session.getAttribute("UserId") != null && session.getAttribute("UserId").equals("admin")) {		
					%>
					<a href="Regist.jsp"><input type="image"
						src="../Images/btn_bbs_comp.jpg" alt="" align="right"></a>
					<%
						}
					%>
			
			<!-- form 전송되면 안보이는데 어케 할지 생각 필요 -->
			<div class="text_box" id="sResult" style="display:none;">
				검색결과가<span class="text_o"><%=totalCount%></span>개 있습니다.
			</div>
		</div>

		<!-- 검색결과 -->
		<div class="rec_list">
			<ul class="clr">
				<%
				if (recipeLists.isEmpty()) {
				%>
				<li>
					<span align="center">이럴수가 게시물이 없습니다</span>
				</li>
				<%
				} 
				else {
				for (RecipeDTO dto : recipeLists) {
				%>
				<li style="width:19%" ><a href="View.jsp?idx=<%=dto.getIdx()%>">
						<div class="img_wrap">
							<img src="../Images/Recipes/<%=dto.getrNfile()%>" alt=""
								style="width: 100%">
						</div>
						<div class="text_box">
							<p class="rTitle"><%=dto.getrTitle()%></p>
							<p class="rName"><%=dto.getrName()%></p>
						</div>
				</a></li>
				<%
					}
				}
				%>
			</ul>
			<!-- 
	        페이징 처리 나중에
	        <div class="paging">
	            <p class="paging_btn"><img src="/skin/nodskin_argio/images/paging_prev.jpg" class="direction"></p><p class="paging_num"><strong>1</strong><a href="?id=list&amp;fKeyList=&amp;fKeyValue=&amp;eTheme=1&amp;OrderCondition=&amp;OrderBy=&amp;page=2">2</a><a href="?id=list&amp;fKeyList=&amp;fKeyValue=&amp;eTheme=1&amp;OrderCondition=&amp;OrderBy=&amp;page=3">3</a><a href="?id=list&amp;fKeyList=&amp;fKeyValue=&amp;eTheme=1&amp;OrderCondition=&amp;OrderBy=&amp;page=4">4</a><a href="?id=list&amp;fKeyList=&amp;fKeyValue=&amp;eTheme=1&amp;OrderCondition=&amp;OrderBy=&amp;page=5">5</a></p><p class="paging_btn"><a href="?id=list&amp;fKeyList=&amp;fKeyValue=&amp;eTheme=1&amp;OrderCondition=&amp;OrderBy=&amp;page=2"><img src="/skin/nodskin_argio/images/paging_next.jpg" alt="다음으로"></a></p><p class="paging_btn"><a href="?id=list&amp;fKeyList=&amp;fKeyValue=&amp;eTheme=1&amp;OrderCondition=&amp;OrderBy=&amp;page=6"><img src="/skin/nodskin_argio/images/paging_d_next.jpg" alt="마지막으로"></a></p></div>
	    	-->
		</div>
		<script>
			function listOrder(listOrder) {
				var url = "/recipe.php?id=list&eTheme=1&OrderCondition="
						+ listOrder;
				window.location.href = url
			}
		</script>
	</div>
	<%@ include file="../Common/Bottom.jsp"%>
</body>
</html>