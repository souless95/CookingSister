<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file ="../Common/style.jsp" %>
<script>
	function _onSubmit(){
		var file = false;
		$.each($('input[type=file]'), function(a,b){
			if($(this).val()) file = true;
		})

		var content = $('#aContent').val();
		var id = 'timeLine';
		var words = '';
		var Chk =0;

		if(content == ""){
			alert("내용을 입력해 주세요.");
			return false;
		}

		if(words!=""){
			$.ajaxSetup({ async:false });
			$.post(
				'process/bFilter.php',
				{id:id, words:words, content:content},
				function(data){
					Chk = data;
				}
			);
			if(Chk != 1){
				alert("사용할 수 없는 단어가 있습니다.");
				return false;
			}
		}

		$("#aBoardFrm").submit();
	}
</script>
</head>
<body>
<%@ include file ="../Common/Top.jsp" %>

<div class="contain clr my_contain">
	<!-- <div class="my_right wide wide"> -->
	<div class="">
		<div id="bbs">
			<!-- <div class="bbstop"><br></div> -->
			<div class="bbscontent">
				<form action="process/aBoard.php?id=timeLine&amp;idx=" method="post" enctype="multipart/form-data" id="aBoardFrm">
	<input type="hidden" name="aUser" value="yj6807">
	<input type="hidden" name="aHomepage" value="">
	<input type="hidden" value="정은솔" name="aName">
<div class="bbs_sub_title">
	<span class="title">맛있는 생활</span>
</div>
<div class="write_box">
	<p><span class="title">내용</span><textarea id="aContent" name="aContent" rows="6" placeholder="맛있는 생활을 작성해주세요."></textarea></p>
	<p>
		<span class="title">첨부 1</span>
		<input type="file" name="aFile1" id="aFile1">
			</p>
	<p>
		<span class="title">첨부 2</span>
		<input type="file" name="aFile2" id="aFile2">
			</p>
</div>

<div class="buttons">
	<div class="cen">
		<a href="?id=timeLine"><img src="../Images/btn_board_list.jpg" alt="목록"></a>
				<a href="javascript:_onSubmit();"><img src="../Images/btn_bbs_comp.jpg" alt="확인"></a>
			</div>
</div>

</form>
			</div>
		</div>
	</div>
</div>

<%@ include file ="../Common/Bottom.jsp" %>
</body>
</html>