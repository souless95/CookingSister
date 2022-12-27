<%@page import="java.net.URLEncoder"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
String b_flag = request.getParameter("b_flag");

BoardDAO dao = new BoardDAO(application);

dao.updateVisitCount(idx);

BoardDTO dto = dao.selectView(b_flag,idx);

dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file ="../Common/style.jsp" %>
<script>
function deletePost() {
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {
        var form = document.boardFrm;      
        form.method = "post"; 
        form.action = "DeleteProccess.jsp"; 
        form.submit();  
    }
}
</script>
</head>
<body>
<%@ include file ="../Common/Top.jsp" %>

<div id="con_wrapper">
	<hr>
	<!-- Start Container -->

	<div class="contain">
		<div class="join_wrap">	
			<dl class="user_title clr">
				<dt><span class="title">글 상세</span></dt>
				<dt style="float:right;" ><span>조회수<%= dto.getVisitCount() %> &nbsp; &nbsp; <%= dto.getRegidate() %></span></dt>
			</dl>			
			<div class="join join_inner">				
				<form name="boardFrm">
					<input type="hidden" name="b_flag" value="<%= dto.getB_flag() %>">
					<input type="hidden" name="idx" value="<%= dto.getIdx() %>">
					<table cellspacing="0" summary="게시글 보기">
						<colgroup>
							<col width="120px">
							<col>
						</colgroup>
						<tbody>
						<tr>
							<th>제목</th>
							<td><%= dto.getBoardTitle() %></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><%= dto.getUserName() %></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<%= dto.getBoardContent().replace("\r\n", "<br/>") %>
								<%
								if (dto.getOfile()!=null){									
								%>
					            	<p>
					            		<img alt="" src="../Uploads/<%= dto.getNfile() %>">
					            	</p>
								<%								
								}
								%>
							</td>
						</tr>
						<tr>
							<th>첨부</th>
							<td>
							<a href="Download.jsp?oName=<%= URLEncoder.encode(dto.getOfile(),"UTF-8") %>&sName=<%= URLEncoder.encode(dto.getNfile(),"UTF-8") %>">
							<%= dto.getOfile() %></a>
							</td>
						</tr>
					</tbody></table>
					
					<div class="join_btn" style="margin-top:60px;">
						<%
		            	if(session.getAttribute("UserId")!= null &&
		            	dto.getId().equals(session.getAttribute("UserId").toString())){
		            		
		            	%>
		                <a href="Edit.jsp?b_flag=<%= dto.getB_flag() %>&idx=<%= dto.getIdx() %>"><img src="../Images/btn_edit2.jpg" alt=""></a>
		                <a onclick="deletePost();"><img src="../Images/btn_delete.jpg" alt=""></a>
		                <%
		            	}
		            	%>
						<a href="javascript:history.back();"><img src="../Images/btn_board_list.jpg" alt=""></a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file ="../Common/Bottom.jsp" %>
</body>
</html>