<%@page import="recipe.RecipeDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="recipe.RecipeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
RecipeDAO dao = new RecipeDAO(application);

/*
검색어가 있는경우 클라이언트가 선택한 필드명과 검색어를 저장할
Map컬렉션을 생성한다. 
*/

/* 검색폼에서 입력한 검색어와 필드명을 파라미터로 받아온다.
해당 <form>의 전송방식은 get, action속성은 없는 상태이므로 현재
페이지로 폼값이 전송된다. */
String searchWord = request.getParameter("searchWord");
-
int totalCount = dao.selectCount(searchWord);
//목록에 출력할 게시물을 추출하여 반환받는다. 
List<RecipeDTO> recipeLists = dao.selectList(searchWord);
//자원해제
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file ="../Common/style.jsp" %>
</head>
<body>
<%@ include file ="../Common/Top.jsp" %>
<div class="recipe_contian">
	<div class="contain">
	
		<!-- 검색창 -->
		<div class="search_top">
		<div class="search_box">
			<input type="text" id="searchWord" name="searchWord" maxlength="20">
			<a href="javascript:go_search();"><img src="../Design/icon_search_btn.jpg" alt="검색"></a>
		</div>
			<div class="text_box">검색결과가<span class="text_o"><%= totalCount %></span>개 있습니다.</div>
		</div>
	    
		<!-- 검색결과 -->
	    <div class="rec_list">
	        <ul class="clr"> 
	        <%
			//컬렉션에 입력된 데이터가 없는지 확인한다.
			if (recipeLists.isEmpty()) {
			%>
			        <tr>
			            <td colspan="5" align="center">
			                게시물이 없습니다
			            </td>
			        </tr>
			<%
			}
			else {
				//출력할 게시물이 있는 경우에는 확장 for문으로 List컬렉션에
				//저장된 데이터의 갯수만큼 반복하여 출력한다.
			    int virtualNum = 0; 
			    for (RecipeDTO dto : recipeLists)
			    {
			    	//현재 출력할 게시물의 갯수에 따라 출력번호는 달라지므로
			    	//totalCount를 사용하여 가상번호를 부여한다.
			        virtualNum = totalCount--;   
			%>
	             <li>
					<a href="View.jsp?idx=<%= dto.getIdx() %>">
					    <div class="img_wrap"><img src="../Images/Recipes/<%= dto.getrNfile() %>" alt="" style="width:100%"></div>
					    <div class="text_box">
					        <p class="rTitle"><%= dto.getrTitle() %></p>
					        <p class="rName"><%= dto.getrName() %></p>
					    </div>
					</a>
	             </li>
	        <%
			    }
			}
			%>
	         </ul>
	        <!-- 
	        페이징 처리 나중에
	        <div class="paging">
	            <p class="paging_btn"><img src="/skin/nodskin_argio/images/paging_prev.jpg" class="direction"></p><p class="paging_num"><strong>1</strong><a href="?id=list&amp;fKeyList=&amp;fKeyValue=&amp;eTheme=1&amp;OrderCondition=&amp;OrderBy=&amp;page=2">2</a><a href="?id=list&amp;fKeyList=&amp;fKeyValue=&amp;eTheme=1&amp;OrderCondition=&amp;OrderBy=&amp;page=3">3</a><a href="?id=list&amp;fKeyList=&amp;fKeyValue=&amp;eTheme=1&amp;OrderCondition=&amp;OrderBy=&amp;page=4">4</a><a href="?id=list&amp;fKeyList=&amp;fKeyValue=&amp;eTheme=1&amp;OrderCondition=&amp;OrderBy=&amp;page=5">5</a></p><p class="paging_btn"><a href="?id=list&amp;fKeyList=&amp;fKeyValue=&amp;eTheme=1&amp;OrderCondition=&amp;OrderBy=&amp;page=2"><img src="/skin/nodskin_argio/images/paging_next.jpg" alt="다음으로"></a></p><p class="paging_btn"><a href="?id=list&amp;fKeyList=&amp;fKeyValue=&amp;eTheme=1&amp;OrderCondition=&amp;OrderBy=&amp;page=6"><img src="/skin/nodskin_argio/images/paging_d_next.jpg" alt="마지막으로"></a></p></div>
	    	</div> -->
		</div>
	<script>
	    function listOrder(listOrder){
	        var url = "/recipe.php?id=list&eTheme=1&OrderCondition="+listOrder;
	        window.location.href=url
	    }
	</script>
</div>
<%@ include file ="../Common/Bottom.jsp" %>
</body>
</html>