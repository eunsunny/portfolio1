/**
 * 로그인 체크
 * login.jsp
 */
function loginCheck() {
	if($("#id").val()=="" || $("#pwd").val()=="") {
		alert("아이디 또는 비밀번호를 입력해 주세요.");
		$("#id").focus();
		return false;
	}
	else {
		return $("#login").attr('action', 'login').submit();
	}
}

// 로그아웃 알러트
function logout(){
	alert("로그아웃 되었습니다.");
}

/*
* 회원가입 약관 동의
* join.jsp
*/
function go_next(){
	
	if($(".agree1")[1].checked == true) {
		alert("이용약관에 동의해주세요.");
		return false;
	} else if($(".agree2")[1].checked == true) {
		alert("개인정보 수집 및 이용에 동의해주세요.");
		return false;
	} else if($(".agree1")[0].checked == true && $(".agree2")[0].checked == true) {
		$("#join").attr('action', 'join_form').submit();
	} 
	
}


function go_save(){
	
	var idpw_chk = /^[a-zA-Z0-9]{4,12}$/;
	var phone_chk = /[0-9]{3}-[0-9]{4}-[0-9]{4}/;

	if($("#id").val() == ""){
		alert("아이디를 입력해 주세요.");
		$("#id").focus();
	} else if(!idpw_chk.test($("#id").val())) {
		alert("아이디는 4~12자의 영문 대소문자와 숫자로만 입력하셔야 합니다.");
		$("#id").focus();
	} else if($("#name").val() == ""){
		alert("이름을 입력해 주세요.");
		$("#name").focus();
	} else if($("#nick_name").val() == ""){
		alert("닉네임을 입력해 주세요.");
		$("#nick_name").focus();
	} else if($("#nick_name").val().length > 6){
		alert("닉네임은 6글자 이하로 설정해야 합니다.");
		$("#nick_name").focus();
	} else if($("#pwd").val() == ""){
		alert("패스워드를 입력해 주세요.");
		$("#pwd").focus();
	} else if ($("#pwd").val() != $("#pwdCheck").val()) {
		alert("패스워드가 다릅니다. 다시 입력해 주세요.");
		$("#pwdCheck").focus();
	} else if(!idpw_chk.test($("#pwd").val())) {
		alert("비밀번호는 4~12자의 영문 대소문자와 숫자만 가능합니다.");
		$("#pwd").focus();
	} else if($("#phone").val() == ""){
		alert("전화번호를 입력해 주세요.");
		$("#phone").focus();
	} else if(!phone_chk.test($("#phone").val())) {
		alert("전화번호는 - 를 포함하여 입력해주세요.");
		$("#phone").focus();
	} else if($("#email").val() == ""){
		alert("이메일을 입력해 주세요.");
		$("#email").focus();
	} else if($("#zip_num").val() == ""){
		alert("주소를 입력해주세요.");
		$("#zip_num").focus();
	} else {
		alert("회원가입이 완료되었습니다.\n로그인 화면으로 이동합니다.");
		$("#join").attr("action", "join").submit();
	}
	
}

function updateMember(){
	
	var phone_chk = /[0-9]{3}-[0-9]{4}-[0-9]{4}/;
	
	if($("#nick_name").val() == ""){
		alert("닉네임을 입력해 주세요.");
		$("#nick_name").focus();
	} else if($("#nick_name").val().length > 6){
		alert("닉네임은 6글자 이하로 설정해야 합니다.");
		$("#nick_name").focus();
	} else if($("#phone").val() == ""){
		alert("전화번호를 입력해 주세요.");
		$("#phone").focus();
	} else if(!phone_chk.test($("#phone").val())) {
		alert("전화번호는 - 를 포함하여 입력해주세요.");
		$("#phone").focus();
	} else {
		alert("회원 정보가 변경되었습니다.");
		$("#member_update").attr("action", "member_update").submit();
	}
	
}

function findMemberId() {
	/* 이름과 이메일 입력확인*/
	
	var name = $('#name');
	var email = $('#email');
	
	if(name.val() == ""){
		alert("이름을 입력해주세요.");
		name.focus();
		return false;
	} else if(email.val() == ""){
		alert("이메일을 입력해주세요.");
		email.focus();
		return false;
	} else {
		
		var url = "find_id?name="+name.val()+"&email="+email.val();
		
		window.open(url, "_blank_1", 
				"toolbar=no, menubar=no, scrollbars=no, resizable=no, width=400, height=200, "+
					"top=300, left=300");

	}
}


function findMemberPwd() {
	
	var id = $('#id');
	var name = $('#name');
	var email = $('#email');
	
	if(id.val() == "") {
		alert("아이디를 입력해주세요.");
		id.focus();
		return false;
	} else if(name.val() == ""){
		alert("이름을 입력해주세요.");
		$('#name').focus();
		return false;
	} else if(email.val() == ""){
		alert("이메일을 입력해주세요.");
		email.focus();
		return false;
	} else {
		
	var url = "find_pwd?id="+id.val()+"&name="+name.val()+"&email="+email.val();
	
	window.open(url, "_blank_1", 
			"toolbar=no, menubar=no, scrollbars=no, resizable=no, width=500, height=350, "+
				"top=200, left=500");
		
	}
}

function changePassword() {
	
	if ($('#pwd').val() == "") {
		alert("비밀번호를 입력해주세요.");
	} else if($('#pwd').val() != $('#pwdCheck').val()) {
		alert("비밀번호가 일치하지 않습니다.");	
	} else {
		$("#pwd_form").attr("action", "change_pwd").submit();
	}
		
}

// 주소찾기 다음 API 연동
function execPostCode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드 작성부분
			// 도로명 주소의 노출 규칙에 따라 주소 조합
			// 내려오는 변수가 값이 없는 경우 공백('')값을 가지므로 참고하여 분기
			var fullRoadAddr = data.roadAddress;  // 도로명 주소 변수
			var extraRoadAddr = ''; // 도로명 조합형 주소 변수
			
			// 법정동명이 있을 경우 추가(법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝남
			if(data.buildingName !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가
			if(data.buldingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만듬
			if(extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ') ';
			}
			// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			if(fullRoadAddr !== '') {
				fullRoadAddr += extraRoadAddr;
			}
			
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			console.log(data.zonecode);
			console.log(fullRoadAddr);
			
			$("[name=zip_num]").val(data.zonecode);
			$("[name=addr1]").val(fullRoadAddr);
			
			document.getElementById('zip_num').value = data.zonecode;
			document.getElementById('addr1').value = fullRoadAddr;
		}
	}).open();
}