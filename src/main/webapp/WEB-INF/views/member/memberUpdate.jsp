<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<%@ include file="sub_menu.jsp"%>
<div class="col-lg-9">
<h2 style="letter-spacing: 0;">회원 정보 변경</h2><br>
	<form id="member_update" method="post" name="formm">
		<div class="container py-5">
			<div class="row">
				<div class="row">
			<table id="updatetable" width="100%" >
				<tr style="border-top: solid 1px black;">
					<th width="25%">아이디</th>
					<td colspan="3">${MemberVO.id}
						<input type="hidden" id="id" value="${MemberVO.id}">
					</td>
				</tr>
				<tr>
					<th>이름</th> 
					<td colspan="3">${MemberVO.name}
						<input type="hidden" id="name" value="${MemberVO.name}">
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td colspan="3">
						<input type="text" name="nick_name" id="nick_name" value="${MemberVO.nick_name}"> 
					</td>
				</tr>				
				<tr>
					<th>비밀번호</th>
					<td colspan="3"><button style="padding-top:0.5em; padding-bottom:0.5em;" type="button" onclick="findMemberPwd()">비밀번호 변경하기</button></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td colspan="3">
						<input type="text" name="phone" id="phone" value="${MemberVO.phone}" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}">
					</td>
				</tr>
				<tr>
					<th>E-Mail</th>
					<td colspan="3">
						<input type="email" name="email" id="email" value="${MemberVO.email}">
					</td>
				</tr>
				<tr>
					<th rowspan="2">주소</th> 
	       			<td style="width:25%">
	       				<input type="text" name="zip_num" id="zip_num" value="${MemberVO.zip_num}" readonly>
	       			</td>
	        		<td>
	        			<button style="padding-top:0.5em; padding-bottom:0.5em;" type="button" class="dup" onclick="post_zip()">주소 찾기</button>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td colspan="3">
	        			<input style="margin-bottom:0.3em;" type="text" name="addr1" value="${MemberVO.address}" readonly> 
	        		    <input type="text" name="addr2" size="50" placeholder="상세주소(주소 변경시 작성해주세요.)">
        		    </td>
			    </tr>
			   <tr style="border-bottom: solid 1px black;">
					<th>관심물품</th>
					<td colspan="3">
						<select name="inter_kind" id="inter_kind">
						<c:forEach items="${inter_kindList}" var="inter_kind" varStatus="status">
							<c:choose>
								<c:when test="${MemberVO.inter_kind == status.count}">
									<option value="${status.count}" selected="selected">${inter_kind}</option>
								</c:when>
								<c:otherwise>
									<option value="${status.count}">${inter_kind}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						</select>
					</td>
				</tr>
			</table>
		    <div align="left">
		        <button type="submit" onclick="updateMember()">정보 수정</button>
		        <button type="button" onclick="location='member_info'">취소</button>
   			</div>
			</div>
			</div>
			</div>
		</form>
		</div>
	</div>
</article>
</body>
</html>
<%@ include file="../footer.jsp"%>
