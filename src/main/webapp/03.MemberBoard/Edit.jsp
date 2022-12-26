<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="./IsLoggedIn.jsp"%>  
<%
int idx = Integer.parseInt(request.getParameter("idx"));
String b_flag = request.getParameter("b_flag");

BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.selectView(b_flag,idx);

String sessionId = session.getAttribute("UserId").toString();

if(!sessionId.equals(dto.getId())){
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
	return;
}

dao.close();
%>
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
				<dt><span class="title">글 수정</span>
			</dl>			
			<div class="join join_inner">				
				<form action="EditProccess.jsp" method="post" enctype="multipart/form-data" id="rBoardFrm">
					<input type="hidden" name="b_flag" value="<%= dto.getB_flag() %>">
					<input type="hidden" name="userName" value="<%= session.getAttribute("UserName")%>">
					<input type="hidden" name="idx" value="<%= dto.getIdx() %>" />
					<table cellspacing="0" summary="게시글 수정양식">
						<colgroup>
							<col width="120px">
							<col>
						</colgroup>
						<tbody>
						<tr>
							<th>제목</th>
							<td><input type="text" id="rTitle" name="rTitle" class="join_input wd200" style="width:100%;" value="<%=dto.getBoardTitle() %>"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea id="rContent" name="rContent" rows="6" placeholder="레시피를 공유해주세요." class="join_input wd200" style="width:100%; height:50%">
								<%=dto.getBoardContent() %></textarea>
							</td>
						</tr>
						<tr>
							<th>첨부</th>
							<td><input type="file" name="rFile" id="rFile" value=<%= dto.getOfile() %> ></td>
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