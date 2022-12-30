<%@page import="utils.BoardPage"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO(application);

String b_flag = "f_member";

int totalCount = dao.selectCount(b_flag);

int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

int totalPage = (int) Math.ceil((double) totalCount / pageSize);

int pageNum = 1;
String pageTemp = request.getParameter("pageNum");
if (pageTemp != null && !pageTemp.equals(""))
	pageNum = Integer.parseInt(pageTemp);

int start = (pageNum - 1) * pageSize + 1;
int end = pageNum * pageSize;

List<BoardDTO> boardLists = dao.selectList(b_flag, start, end);
//자원해제
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../Common/style.jsp"%>
</head>
<body>
	<%@ include file="../Common/Top.jsp"%>
	<div class="contain join_wrap">
		<dl class="user_title clr">
			<dt>
				<span class="title">요리 공유</span>
		</dl>
		<form method="get">
			<table class="table" style="border: 1px solid white;">
				<%
				if (boardLists.isEmpty()) {
				%>
				<tr style="border: none;">
					<td colspan="3" align="center">등록된 게시물이 없습니다.</td>
				</tr>
				<%
				} else {

				int virtualNum = 0;

				int countNum = 0;

				for (BoardDTO dto : boardLists)

				{
					virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
				%>
				<tr>
					<td rowspan="3" width="30%"
						style="border-bottom: solid 1px #f2f2f2;"><img
						src="../Uploads/<%=dto.getNfile()%>" width="200" /></td>
					<th width="60%"><a
						href="View.jsp?b_flag=<%=dto.getB_flag()%>&idx=<%=dto.getIdx()%>"><%=dto.getBoardTitle()%></a></th>
					<td width="10%" align="center"><%=dto.getUserName()%></td>
				</tr>
				<tr>
					<td colspan="2"><%=dto.getBoardContent()%></td>
				</tr>
				<tr style="border-bottom: solid 1px #f2f2f2;">
					<td align="right"><%=dto.getRegidate()%></td>
					<td align="center">조회수 &nbsp; <%=dto.getVisitCount()%></td>
				</tr>
				<%
				}
				}
				%>
			</table>
		</form>

		<div>
			<%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI())%>
		</div>
		<a href="Write.jsp"><input type="image"
			src="../Images/btn_write.jpg" alt="" align="right"></a>
	</div>
	<br>
	<br>
	<%@ include file="../Common/Bottom.jsp"%>
</body>
</html>