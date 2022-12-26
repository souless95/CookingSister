<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO(application);

String b_flag="f_member";

List<BoardDTO> boardLists = dao.selectList(b_flag);
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
<div class="contain join_wrap">
	<dl class="user_title clr">
		<dt><span class="title">요리 공유</span>
	</dl>	
	<form method="get">
		<table class="table">
			<%
			if (boardLists.isEmpty()) {
			%>
			        <tr>
			            <td colspan="3" align="center">
			                등록된 게시물이 없습니다.
			            </td>
			        </tr>
			<%
			}
			else {
				
			    for (BoardDTO dto : boardLists)
			    	
			    { 
			%>
					<tr>
						<td rowspan="3" width="20%"><img src="../Uploads/<%= dto.getNfile()%>" width="150" /></td>
						<th width="70%"><a href="View.jsp?b_flag=<%= dto.getB_flag() %>&idx=<%= dto.getIdx() %>"><%= dto.getBoardTitle() %></a></th>
						<td width="10%" align="center"><%= dto.getUserName() %></td>
					</tr>		
					<tr>
						<td colspan="2"><%= dto.getBoardContent() %></td>
					</tr>		
					<tr>
						<td align="right"><%= dto.getRegidate() %></td>
						<td align="center"><%= dto.getVisitCount() %></td>
					</tr>	
			<%
			    }
			}
%>		
		</table>
	</form>
	<a href="Write.jsp"><input type="image" src="../Images/btn_write.jpg" alt="" align="right"></a>
</div>
<br><br>
<%@ include file ="../Common/Bottom.jsp" %>
</body>
</html>