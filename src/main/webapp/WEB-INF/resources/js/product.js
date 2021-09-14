/**
 * 
 */
function go_wrt() {
	$("#prod_form").attr("action", "admin_product_write_form").submit();
}

/*
 *상품 등록하기 
 */
function go_save() {
	var $price = $("#price");
//	var $price2 = $("#price2");
//	var $price3 = $("#price3");
//	
//	if ($("#kind").val()=="") {
//		alert("상품종류를 입력하세요!");
//		$("#kind").focus();
//	}else if ($("#name").val()=="") {
//		alert("상품명을 입력하세요!");
//		$("#name").focus();
//	}else if ($price1.val()=="") {
//		alert("원가를 입력하세요!");
//		$("#price1").focus();
//	}else if ($price2.val()=="") {
//		alert("판매가를 입력하세요!");
//		$("#price2").focus();
//	}else if ($("#content").val()=="") {
//		alert("상품상세를 입력하세요!");
//		$("#content").focus();
//	}else if ($("#product_image").val()=="") {
//		alert("사진을 입력하세요!");
//		$("#product_image").focus();
//	}else {
		$price.val(remove_comma($price.val()));
//		$price2.val(remove_comma($price2.val()));
//		$price3.val(remove_comma($price3.val()));
		
		$("#write_form").attr("encoding", "multipart/form-data");
		$("#write_form").attr("action", "admin_product_write").submit();
}

/*	입력된 금액을 받아 세자리마다 , 를 추가하여 반환
 *  t-화면에 입력된 금액 
 */
function NumFormat(t) {
	num = t.value;
	num = num.replace(/\D/g, '');	// \D - 정규표현식으로 숫자가 아닌 문자 의미. 숫자가 아닌 문자는 모두 제거 
	len = num.length - 3;
	while(len > 0) {
		num = num.substr(0,len) + "," + num.substr(len);	//문자열 인덱스는 0부터 시작
		len -= 3;
	}
	t.value = num;
	console.log(t.value);
	return t;
}

function go_mov() {
	$("#write_form").attr("action", "cancel").submit();
}

function go_cancel(){

	$("#formm").attr("action", "cancel").submit();
}

function go_delete() {
	if($('#soldyn').val() == "n"){
		document.formm.action = "product_delete";
		document.formm.submit();
	}else {
		alert("판매 완료된 상품은 삭제하실 수 없습니다.");
	}
	
}

function movePayForm() {
	if($('#soldyn').val() == "y"){
		alert("이미 판매 완료된 상품입니다.");
		return false;
	}else {
		document.formm.action = "move_pay_form";
		document.formm.submit();
	}
	
}

function DontmovePayForm() {
	alert("본인이 올린 상품은 구매하실 수 없습니다.");
}

function callIamport() {
	
	
	document.formm.action = "call_iamport";
	document.formm.submit();
}

function remove_comma(input) {
	return input.replace(/,/gi, "");		// ,가 있으면 빈 문자열로 해라. gi는 뭐지??
}

// jjim 관련 내용

function login_empty_check() {
	
	alert("로그인 후 가능한 서비스 입니다.");
	location.href="login_form";
	
}

function login_jjim_check() {
	alert("본인이 등록한 상품은 불가능한 서비스입니다.");
}

function jjim_check_form(pseq) {
	
	var check = confirm("찜 목록에 상품을 추가 후 목록으로 이동하시겠습니까?"); 
	
	if (check) {
		location.href="jjim_insert_list?pseq="+pseq;
	} else {
		location.href="jjim_list_cancel?pseq="+pseq;
	}
	
}

function go_update() {
	$("#theform").attr("action", "update_form").submit();
}

function go_mod_save(pseq) {
	var $price = $("#price");
//	var $price2 = $("#price2");
//	var $price3 = $("#price3");
//	
//	if ($("#kind").val()=="") {
//		alert("상품종류를 입력하세요!");
//		$("#kind").focus();
//	}else if ($("#name").val()=="") {
//		alert("상품명을 입력하세요!");
//		$("#name").focus();
//	}else if ($price1.val()=="") {
//		alert("원가를 입력하세요!");
//		$("#price1").focus();
//	}else if ($price2.val()=="") {
//		alert("판매가를 입력하세요!");
//		$("#price2").focus();
//	}else if ($("#content").val()=="") {
//		alert("상품상세를 입력하세요!");
//		$("#content").focus();
//	}else {
//		if (confirm("수정하시겠습니까?")) {
		
			/*
			if($("#bestyn").is(":checked")) {
				$("#bestyn").val("y");
			}else {
				$("#bestyn").val("n");
			}
			if($("#useyn").is(":checked")) {
				$("#useyn").val("y");
			}else {
				$("#useyn").val("n");
			}
			*/			
			
			$price.val(remove_comma($price.val()));
//			$price2.val(remove_comma($price2.val()));
//			$price3.val(remove_comma($price3.val()));
			
			$("#update_form").attr("encoding", "multipart/form-data");
			$("#update_form").attr("action", "product_update").submit();
//		}
//		
//	}
}

