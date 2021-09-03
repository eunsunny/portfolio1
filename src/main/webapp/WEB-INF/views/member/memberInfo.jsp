<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>

<style>
	
	th, td {
		text-align:left;
	}
	
</style>

</head>
<body>
<%@ include file="sub_menu.jsp"%>
<div class="col-lg-9">
	<h2 style="letter-spacing: 0;">회원 정보</h2>
	<form id="member_update_form" method="get" action="member_update_form">
		<div class="container py-5">
			<table id="infotable">
				<tr style="text-align:left; border-top: solid 1px black;">
					<th>아이디</th>
					<td>${MemberVO.id}
					<input type="hidden" id="id" value="${MemberVO.id}">
					</td>
				</tr>
				<tr>
					<th>이름</th> 
					<td>${MemberVO.name}
					<input type="hidden" id="name" value="${MemberVO.name}">
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>${MemberVO.nick_name}</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><button style="padding-top:0.5em; padding-bottom:0.5em;" type="button" onclick="findMemberPwd()">비밀번호 변경하기</button></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${MemberVO.phone}</td> 
				</tr>
				<tr>
					<th>E-Mail</th>
					<td>${MemberVO.email}
					<input type="hidden" id="email" value="${MemberVO.email}">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${MemberVO.zip_num} &nbsp; ${MemberVO.address}</td>
				</tr>
				<tr style="border-bottom: solid 1px black;">
					<th>관심물품</th>
					<c:forEach items="${inter_kindList}" var="inter_kind" varStatus="status">
						<c:if test="${MemberVO.inter_kind == status.count}">
							<td>${inter_kind}</td>
						</c:if>
					</c:forEach>
				</tr>
			</table>
			<div>
				<button type="submit" class="submit">회원 정보 변경</button>
			</div>
		</div>
	</form>
</div>
</div>
</div>
</article>

</body>
</html>
<%@ include file="../footer.jsp"%>

