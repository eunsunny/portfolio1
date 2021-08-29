<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../member/sub_menu.jsp"%>
<!DOCTYPE html>

<div class="col-lg-9">
	<h2 style="letter-spacing: 0;">나의 등급</h2><br>
	<div class="container py-5">
		<div class="row">
			<div class="row">
				<ul style="text-align:center; list-style-type:none; margin-bottom:2em;">
					<li><img src="grade_images/${MemberVO.grade}.png" width="250" height="250" style="margin:0 0 1em 0;"></li>
					<li>${MemberVO.id}(${MemberVO.name})님의 등급은 <span style="font-size:1.5em; font-weight:bold;">${gradeDetail}</span> 입니다.
				</ul>
				<table style="border-top: solid 1px black; border-bottom: solid 1px black;">
					<tr style="text-align:center; font-size:1em;">
						<th rowspan="2" style="border-right: solid 1px #dddddd">등급</th>
						<td><img src="grade_images/1.png" width="100" height="100"></td>
						<td><img src="grade_images/2.png" width="100" height="100"></td>
						<td><img src="grade_images/3.png" width="100" height="100"></td>
						<td><img src="grade_images/4.png" width="100" height="100"></td>
						<td><img src="grade_images/5.png" width="100" height="100"></td>
					</tr>
					<tr style="text-align:center; font-weight:bold;">
						<td>Welcome(Bronze)</td>
						<td>Silver</td>
						<td>Gold</td>
						<td>Platinum</td>
						<td>VIP(Diamond)</td>
					</tr>
					<tr style="text-align:center;">
						<th style="border-right: solid 1px #dddddd">내용</th>
						<td style="font-size:0.5em;">
						<ul style="line-height:20px; padding-left: -1px;">
							<li>처음 가입시 적용되는 등급</li>
						</ul>
						</td>
						<td style="font-size:0.5em;">
						<ul>
							<li>가입 후 판매완료 상품 10개 시 자동 적용</li>
						</ul>
						</td>
						<td style="font-size:0.5em;">
						<ul>
							<li>판매완료 상품 15개 시 자동 적용</li>
						</ul>
						</td>
						<td style="font-size:0.5em;">
						<ul>
							<li>판매완료 상품 25개 시 적용</li>
						</ul>
						</td>						
						<td style="font-size:0.5em;">
						<ul>
							<li>판매완료 상품 35개 시 적용</li>
							<li>메인 페이지 판매 등록 상품 노출 혜택</li>
						</ul>
						</td>
					</tr>
				</table>
					<p style="margin-left:-3em; padding-left:-3em;">※ &nbsp;&nbsp; Sunny-Flea-Market에서는 총 5개의 등급으로 나뉘어져 있습니다.<br>
				       ※ &nbsp;&nbsp;판매가 완료된 상품 갯수에 따라 자동으로 등급변경이 진행됩니다.</p>
				</div>
			</div>
			</div>
		</div>
	</div>
</article>

</body>
</html>

<%@ include file="../footer.jsp"%>