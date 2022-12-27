<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file ="../Common/style.jsp" %>
</head>
<body>
<%@ include file ="../Common/Top.jsp" %>

<div id="con_wrapper">
	<hr>
	<!-- Start Container -->
	<div class="contain">
		<div class="join_wrap">	
			<dl class="user_title clr">
				<dt><span class="title">공지 작성</span>
			</dl>			
			<div class="join join_inner">				
				<form action="WriteProccess.jsp" method="post" enctype="multipart/form-data" id="rBoardFrm">
					<input type="hidden" name="b_flag" value="f_customer">
					<input type="hidden" name="userName" value="<%= session.getAttribute("UserName")%>">
					<table cellspacing="0" summary="게시글 작성양식">
						<colgroup>
							<col width="120px">
							<col>
						</colgroup>
						<tbody>
						<tr>
							<th>제목</th>
							<td><input type="text" id="rTitle" name="rTitle" class="join_input wd200" style="width:100%;"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea id="rContent" name="rContent" rows="6" class="join_input wd200" style="width:100%; height:50%"></textarea>
							</td>
						</tr>
						<tr>
							<th>첨부</th>
							<td><input type="file" name="rFile" id="rFile" ></td>
						</tr>
					</tbody></table>
					<div class="join_btn" style="margin-top:60px;">
						<a href="javascript:history.back();"><img src="../Images/btn_board_list.jpg" alt=""></a>
						<a><input type="image" src="../Images/btn_bbs_comp.jpg" alt=""></a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file ="../Common/Bottom.jsp" %>
</body>
</html>