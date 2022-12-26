<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file ="../Common/style.jsp" %>
</head>
<body>
<%@ include file ="../Common/Top.jsp" %>
<div class="recipe_contian">
<div class="contain">
    <div class="title_area clr">
        <h2 class="fl def_title">밥요리</h2>
    </div>

    <div class="rec_list">
        <ul class="clr"> 
          	<li class="">
				<a href="/recipe.php?id=view&amp;eTheme=1&amp;idx=1754">
				    <div class="img_wrap"><img src="data/recipe/20211102195815-PWMSX.jpg" alt="" style="width:100%"></div>
				    <div class="text_box">
				        <p class="s_title">느끼함 제로</p>
				        <p class="b_title">마늘종장아찌 볶음밥</p>
				    </div>
				</a>
             </li>
         </ul>
        <div class="paging">
            <p class="paging_btn"><img src="/skin/nodskin_argio/images/paging_prev.jpg" class="direction"></p><p class="paging_num"><strong>1</strong><a href="?id=list&amp;fKeyList=&amp;fKeyValue=&amp;eTheme=1&amp;OrderCondition=&amp;OrderBy=&amp;page=2">2</a><a href="?id=list&amp;fKeyList=&amp;fKeyValue=&amp;eTheme=1&amp;OrderCondition=&amp;OrderBy=&amp;page=3">3</a><a href="?id=list&amp;fKeyList=&amp;fKeyValue=&amp;eTheme=1&amp;OrderCondition=&amp;OrderBy=&amp;page=4">4</a><a href="?id=list&amp;fKeyList=&amp;fKeyValue=&amp;eTheme=1&amp;OrderCondition=&amp;OrderBy=&amp;page=5">5</a></p><p class="paging_btn"><a href="?id=list&amp;fKeyList=&amp;fKeyValue=&amp;eTheme=1&amp;OrderCondition=&amp;OrderBy=&amp;page=2"><img src="/skin/nodskin_argio/images/paging_next.jpg" alt="다음으로"></a></p><p class="paging_btn"><a href="?id=list&amp;fKeyList=&amp;fKeyValue=&amp;eTheme=1&amp;OrderCondition=&amp;OrderBy=&amp;page=6"><img src="/skin/nodskin_argio/images/paging_d_next.jpg" alt="마지막으로"></a></p></div>
    </div>

</div>
<script>
    function listOrder(listOrder){
        var url = "/recipe.php?id=list&eTheme=1&OrderCondition="+listOrder;
        window.location.href=url
    }
</script></div>
<%@ include file ="../Common/Bottom.jsp" %>
</body>
</html>