<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html style="" class=" js no-touch csstransitions">
<head>
<%@ include file ="../Common/style.jsp" %>	

<script type="text/javascript">
function inputEmail(frm){
    var domain = frm.email_domain.value;
    if(domain==''){//--선택-- 부분을 선택했을때
        frm.mEmail2.value = '';
    }
    else if(domain=='직접입력'){//'직접입력'을 선택했을때
        frm.mEmail2.readOnly = false;//사용자가 입력해야 하므로 readonly속성을 해제한다. 
        frm.mEmail2.value = '';
        frm.mEmail2.focus();
    }
    else{//도메인을 선택했을때
        frm.mEmail2.value = domain;//선택한 도메인을 입력한다. 
        frm.mEmail2.readOnly = true;//입력된 값을 수정할 수 없도록 readonly속성을 활성화한다. 
    }
}

function validateForm(form) {
	if(form.mID.value==""){
		alert("아이디를 입력하세요");
		form.mID.focus();
		return false;
	}
	if(idch == 0){
		alert("중복체크해주세요.");
		return false;
	}
	if(form.mPass.value==""){
		alert("비밀번호를 입력하세요");
		form.mPass.focus();
		return false;
	}
	if(form.mPassCheck.value==""){
		alert("비밀번호 재확인 해주세요");
		form.mPassCheck.focus();
		return false;
	}
	if(form.mPass.value!=form.mPassCheck.value){
        alert('패스워드가 일치하지 않습니다.')
        form.mPass.value='';
        form.mPassCheck.value='';
        form.mPass.focus();
        return false;
    }
	if(form.mName.value==""){
		alert("이름을 입력하세요");
		form.mName.focus();
		return false;
	}

	if(form.mEmail1.value==""){
		alert("이메일을 입력하세요.");
		form.mEmail1.focus();
		return false;
	}
	if(form.mEmail2.value==""){
		alert("이메일 주소를 입력하세요.");
		form.mEmail2.focus();
		return false;
	}
	if(form.mPhone1.value==""){
		alert("전화번호가 잘못 입력되었습니다.");
		form.mPhone1.focus();
		return false;
	}
	if(form.mPhone2.value==""){
		alert("전화번호가 잘못 입력되었습니다.");
		form.mPhone2.focus();
		return false;
	}
	if(form.mPhone3.value==""){
		alert("전화번호가 잘못 입력되었습니다.");
		form.mPhone3.focus();
		return false;
	}
}

function idCheck(){
    var frm = document.forms[0];

    frm.mID.readOnly = true;

    window.open("id_overapping.jsp?id="+frm.mID.value,"idover","width=400,height=300");
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
				<dt><span class="title">정보입력</span>밥못누 홈페이지에 오신 것을 환영합니다.</dt>
			</dl>
			
			<div class="join join_inner">
			
				<!-- 회원가입 -->
				<form action="RegistProccess.jsp" method="post" name="mJoin" id="mJoin" onsubmit="return validateForm(this);">
				
				<input type="hidden" name="mPhone" id="mPhone">
				<input type="hidden" name="IDChk" id="IDChk" value="0">
				<input type="hidden" name="NickChk" id="NickChk" value="0">
				<input type="hidden" name="rNumChk" id="rNumChk" value="0">
				<input type="hidden" name="mInterest">
				
				<h2 class="join_title mt40">기본정보입력</h2>
				
				<table cellspacing="0" summary="회원가입양식">
					<colgroup>
						<col width="120px">
						<col>
					</colgroup>
					<tbody><tr>
						<th>아이디</th>
						<td>
							<input type="text" name="mID" id="mID" onchange="document.all.IDChk.value=0" class="join_input wd200"> 
							<img src="../Images/btn_check.jpg" alt="중복체크" id="ChkID" style="cursor:pointer;" onclick="idCheck(this.form);">
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="mPass" id="mPassword" class="join_input wd200"></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="mPassCheck" class="join_input wd200"></td>
					</tr>
					<tr>
						<th>성명</th>
						<td><input type="text" name="mName" class="join_input wd200"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
						<input type="text" name="mEmail1" id="mEmail1" onchange="document.all.EmailChk.value=0" class="join_input wd140"> @
						<input type="text" name="mEmail2" id="mEmail2" class="join_input wd180">
						<select name="email_domain" onchange="inputEmail(this.form);" class="join_input wd180">
	                        <option value="" checked> -- 선택 --</option>
	                        <option value="naver.com">naver.com</option>
	                        <option value="nate.com">nate.com</option>
	                        <option value="gmail.com">gmail.com</option>
	                        <option value="daum.net">daum.net</option>
	                        <option value="hanmail.net">hanmail.net</option>
	                        <option value="직접입력">직접입력</option>
                    	</select>
						</td>
					</tr>
					<tr class="phone">
						<th>휴대전화</th>
						<td>
							<select name="mPhone1" id="Phone1" onchange="document.getElementById('mCellPhone2').focus();" class="join_select wd60">
								<option value="">선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select> -
							<input type="text" name="Phone2" id="mPhone2" value="" class="join_input wd60" maxlength="4" onkeyup="NextInput(this,document.getElementById('mPhone3'),'4');"> - <input type="text" name="mPhone3" id="mPhone3" value="" class="join_input wd60" maxlength="4">
						</td>
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