<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
  
<link rel="apple-touch-icon" href="img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">

<!-- <link rel="stylesheet" href="css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="css/templatemo.css">
<link rel="stylesheet" href="css/custom.css"> -->

<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->
<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="css/fontawesome.min.css">
<link rel="stylesheet" href="css/main.css" />
<script type="text/javascript" src="member/member.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).on("change", "input[name='id']", function(){
		var id = $('#id').val();
		
		$.ajax({
			// 요청 url
			url : "idCheck",
			type : "post",
			dataType: "JSON",
			// 좌항-변수, 우항- 입력된 데이터
			data : {id:id},
			// return 받을 시 실행되는 메소드
			success : function(data) {
/* 				console.log("1번째줄 데이터->"+data);
				console.log("2번째줄 데이터->"+$.trim(data)); */
				
				if(id == "") {
					$("#text").css("color", "gray");
					$("#text").text("아이디를 입력해주세요.");
				} else if(data == 0) {
 					$("#text").css("color", "blue");
					$("#text").text(id+"는 사용 가능한 아이디 입니다.");
				} else if(data == 1) {
 					$("#text").css("color", "red");
					$("#text").text(id+"는 이미 사용중인 아이디 입니다."); 
				} 
			},
			//에러시 실행되는 메소드
			error : function(error) {
				alert("error : "+error);
			}
		});
	});

</script>
<style>
	
	fieldset > #row_row {
		padding-top : 0;
		margin-top : 0;
	}
	
	div > label {
       text-align : right;
       margin-top : 0.5em;
       padding-top : 0;
    }
    
    fieldset > legend {
    	font-size : 25px;
    	font-weight : bold;
    	margin : 10px 0 0 8em;
    }
    
</style>
</head>
<body>
<p></p>
<div class="container">
	<div class="row aln-center">
		<form id="join" method="post" action="join" name="formm" class="col-10 aln-center">
		<fieldset class="row aln-left">
			<legend>회원가입 &nbsp;&nbsp;<span style="font-size: 13px; color: red;">  * 필수항목을 작성해주세요.</span></legend>
				<div class="col-11 row" id="row_row">
					<label class="col-3" for="id">아이디*</label>
					<div class="col-8">
					<input type="text" name="id" id="id" class="form-control input-md" required="" style="margin-bottom:0.5em;"> 
					<div>
					<span id="text" style="font-weight:bold; font-size:1em;"></span>
					</div>
					</div>
				</div>
				<div class="col-11 row" id="row_row" style="margin-top:-2em;">
				<label class="col-3" for="name">이름*</label>
					<div class="col-8">
					<input type="text" name="name" id="name"  class="form-control input-md" required="">
					</div>
				</div>
				<div class="col-11 row" id="row_row" style="margin-top:-2em;">
				<label class="col-3" for="nick_name">닉네임*</label>
					<div class="col-8">
					<input type="text" name="nick_name" id="nick_name" class="form-control input-md" required=""> 
					</div>
				</div>
				<div class="col-11 row" id="row_row" style="margin-top:-2em;">
				<label class="col-3" for="pwd">비밀번호*</label>
					<div class="col-8">
					<input type="password" name="pwd" id="pwd" class="form-control input-md" required="">
					</div>
				</div>
				<div class="col-11 row" id="row_row" style="margin-top:-2em;">
				<label class="col-3" for="pwdCheck">비밀번호 확인*</label>
					<div class="col-8">
					<input type="password" name="pwdCheck" id="pwdCheck" class="form-control input-md" required="">
					</div>
				</div>
				<div class="col-11 row" id="row_row" style="margin-top:-2em;">
				<label class="col-3" for="phone">전화번호*</label> 
					<div class="col-8">
					<input type="text" name="phone" id="phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" 
							placeholder="'-'를 포함하여 입력해주세요." class="form-control input-md" required="">
					</div>
				</div>
				<div class="col-11 row" id="row_row" style="margin-top:-2em;">
				<label class="col-3" for="email">E-Mail*</label> 
					<div class="col-8">
					<input type="email" name="email" class="form-control input-md" required="">
					</div>
				</div>
				<div class="col-11 row aln-left" id="row_row" style="margin-top:-2em; padding-left: 5.2em;">
				<label class="col-3">주소*</label> 
        			<div class="col-4" >
        			<input style="margin-left: 0.3em;" type="text" name="zip_num" id="zip_num" size="4" placeholder="우편번호" readonly>
        			</div>
        			<div class="col-1">      
        			<input type="button" value="주소 찾기" class="dup" onclick="post_zip()">
        			</div>
        			<div class="col-8" style="margin-top:-2em; margin-left: 12.7em;">
        		    <input type="text" name="addr1" class="form-control input-md" placeholder="주소" readonly style="margin-bottom: 0.5em;"> 
        		    <input type="text" name="addr2" class="form-control input-md" placeholder="상세주소">
			    	</div>
				</div>
				<div class="col-11 row" id="row_row" style="margin-top:-2em; margin-bottom: 20px;">
				<label class="col-3">관심물품</label>
				<div class="col-8">
					<select name="inter_kind" style="">
			    		<option value="1">패션의류/잡화</option>
			    		<option value="2">뷰티</option>
			    		<option value="3">출산/유아동</option>
			    		<option value="4">식품</option>
			    		<option value="5">주방/생활용품</option>
			    		<option value="7">인테리어</option>
			    		<option value="8">가전디지털</option>
			    		<option value="9">스포츠/레저</option>
			    		<option value="10">자동차 용품</option>
			    		<option value="11">도서/음반</option>
			    		<option value="12">완구/문구/취미</option>
			    		<option value="13">반려동물</option>
			    		<option value="14">헬스/건강식품</option>
			    	</select>
					</div>
			    </div>
			    <div class="row">
			    <div id="buttons" class="aln-center" style="margin-left:15.5em; padding: 0 0 70px 40px;">
			        <button type="button" class="submit" onclick="go_save()">회원가입</button>
			        <button type="reset" class="cancel">취소</button>
      			</div>
      			</div>
      			</fieldset>
			</form>
		</div>
	</div>

</body>
</html>
<%@ include file="../footer.jsp"%>
