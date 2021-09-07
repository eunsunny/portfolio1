<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">  
<!-- 
<meta name="viewport" content="maximum-scale=1.0, minimum-scale=1.0, width=device-width, initial-scale=1.0, user-scalable=no"/>	
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>

window.Kakao.init('63bd730b2fea7a587228bb810016be21');  // 발급받은 자바스크립트 키
/* console.log(Kakao.isInitialized()); */

function kakaoLogin() {
	
	window.Kakao.Auth.login({
		scope: 'profile_nickname, account_email, gender',
		success: function(authObj) {
			console.log(authObj);
			window.Kakao.API.request({
				url: '/v2/user/me',
				success: res => {
					const kakao_account = res.kakao_account;
					console.log(kakao_account);
				}
			})
		}
	});
}

function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  

</script> -->
</head>
<body>
   <div class="container py-5">
	<div class="row aln-center">
		<div class="col-lg-3">
	<div>
		<h1 style="margin-top:2.7em; margin-bottom:1em; font-size:35px;">LOGIN</h1>
	</div>
			<form id="login" method="post" action="login">
				<div>
					<input name="id" id="id" placeholder="아이디" type="text" size="40" autofocus/>
				</div>
				<div style="margin-top:0.6em;">
					<input name="pwd" id="pwd" placeholder="비밀번호" type="password" size="40"/>
				</div>
				<div align="center" style="margin-top:1em;">
					<button type="button" class="submit" onclick="loginCheck()">LOGIN</button>
				</div>
				<div class="row aln-center">
					<div class="div" style="margin-top:1em; margin-bottom:5em;">
						<a href="find_id_form">아이디 찾기</a> <!-- 컨트롤러에서 넘기기(확인필요) -->
					<span> | </span>
						<a href="find_pwd_form">비밀번호 찾기</a><!-- 컨트롤러에서 넘기기(확인필요) --> 
					<span> | </span>
						<a href="contract">회원가입</a><!-- 컨트롤러에서 넘기기 -->
					</div>
				</div>
				<!-- <div class="row aln-center">
					<a href="javascript:kakaoLogin();"><img src="grade_images/kakaologin.png" style="width:auto; height: 65px;  margin-bottom:5em;"/></a>
				</div> -->
			</form>
		</div>
	</div>
	</div>
	
</body>
</html>
<%@ include file="../footer.jsp"%>