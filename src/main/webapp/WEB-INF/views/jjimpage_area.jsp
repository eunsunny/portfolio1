<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row">
	<div style="text-align:center;">
	
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous">
				<a href="jjim_list${pageMaker.makeQuery(pageMaker.startPage-1)}">[이전]</a>
			</li>
		</c:if>
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
			<c:choose>
				<c:when test="${index == criteria.pageNum}">
					<span style="font-size: 27px; font-weight: bold; padding-left:10px; padding-right:10px;"><a href="jjim_list${pageMaker.makeQuery(index)}">${index}</a></span>
				</c:when>
				<c:otherwise>
					<span style="font-size: 18px; padding-left:10px; padding-right:10px;"><a href="jjim_list${pageMaker.makeQuery(index)}">${index}</a></span>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:if test="${pageMaker.next}">
			<li class="paginate_button next">
				<a href="jjim_list${pageMaker.makeQuery(pageMaker.endPage+1)}">[다음]</a>
			</li>
		</c:if>	
			
	</div>
</div>