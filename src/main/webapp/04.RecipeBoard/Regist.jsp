<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html style="" class=" js no-touch csstransitions">
<head>
<%@ include file ="../Common/style.jsp" %>	

    <script>
        function validateForm(form) {
        	if(form.rName.value==""){
        		alert("레시피명을 입력해주세요");
        		form.rName.focus();
        		return false;
        	}
        	if(form.rTitle.value==""){
        		alert("한줄소개를 입력해주세요");
        		form.rTitle.focus();
        		return false;
        	}
        	if(form.rOfile.value==""){
        		alert("이미지를 첨부해주세요");
        		form.rOfile.focus();
        		return false;
        	}
        }
    </script>
</head>	

<body cz-shortcut-listen="true">

<%@ include file ="../Common/Top.jsp" %>

<div id="con_wrapper">
	<hr>
	<!-- Start Container -->

	<div class="contain">
		<div class="join_wrap">
		
			<dl class="user_title clr">
				<dt><span class="title">레시피 등록</span>
			</dl>
			
			<div class="join join_inner">
			
				
				<form action="RegistProccess.jsp" method="post" enctype="multipart/form-data"
				name="recipeRegi" id="recipeRegi" onsubmit="return validateForm(this);">
				
				<h2 class="join_title mt40">레시피 정보</h2>
				
				<table cellspacing="0" summary="레시피 등록 양식">
					<colgroup>
						<col width="120px">
						<col>
					</colgroup>
					<tbody><tr>
						<th>* 레시피명</th>
						<td>
							<input type="text" name="rName" class="join_input wd200"/> 
						</td>
					</tr>
					<tr>
						<th>* 한줄소개</th>
						<td><input type="text" name="rTitle" class="join_input wd200" /></td>
					</tr>
					<tr>
						<th>* 이미지</th>
						<td><input type="file" name="rOfile" /></td>
					</tr>
					<tr>
						<th>설명</th>
						<td><textarea rows="20" cols="50" name="rContent" class="join_input" style="height:200px;"></textarea></td>
					</tr>
					<tr>
						<th>상세 이미지</th>
						<td><input type="file" name="rContentOfile" /></td>
					</tr>
					<tr>
						<th>필수재료</th>
						<td><input type="text" name="rMust" class="join_input"/></td>
					</tr>
					<tr>
						<th>양념</th>
						<td><input type="text" name="rSeason" class="join_input"/></td>
					</tr>
				</tbody></table>
				<div class="join_btn" style="margin-top:60px;">
					<a href="javascript:history.back();"><img src="../Images/btn_member_back.jpg" alt=""></a>
					<a><input type="image" src="../Images/btn_member_join2.jpg" alt=""></a>
				</div>
				</form>
			</div>
		</div>
	</div>

</div>

<div id="fb-root" class=" fb_reset"><div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
<div></div></div></div>

<%@ include file ="../Common/Bottom.jsp" %>
</body>
</html>