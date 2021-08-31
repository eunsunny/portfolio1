<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div>
	<ul class="pagination">
	
		<c:if test="${map.pageMaker.prev}">
			<li class="paginate_button previous">
				<a href="list.do${map.pageMaker.makeQuery(map.pageMaker.startPage-1)}&search_option=${map.search_option}&keyword=${map.keyword}">[이전]</a>
			</li>
		</c:if>
				
		<!-- [1][2][3]... 표시 부분 -->
<%-- 		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index"> --%>
<%-- 			<a href="category${pageMaker.makeQuery(index)}&kind=${kind}">[${index}]</a> --%>
<%-- 		</c:forEach> --%>

<!-- 		[1][2][3]... 표시 부분 -->
		
		
		<c:forEach begin="${map.pageMaker.startPage}" end="${map.pageMaker.endPage}" var="index">
			<div div="row">
				<ul class="pagination pagination-lg justify-content-end">
				
				<c:choose>
				 <c:when test="${index == map.criteria.pageNum}">
				 <li class="page-item disabled">
				 <a  href="list.do${map.pageMaker.makeQuery(index)}&search_option=${map.search_option}&keyword=${map.keyword}"  class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0">${index}</a>
				 </li>
				 </c:when>
				 
				 <c:otherwise>
				 <li class="page-item ">
				 <a href="list.do${map.pageMaker.makeQuery(index)}&search_option=${map.search_option}&keyword=${map.keyword}"  class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark">${index}</a>
				 </li>
				 </c:otherwise>
				</c:choose>
				
				</ul>
			</div>
		</c:forEach>
		

		
		<c:if test="${map.pageMaker.next}">
			<li class="paginate_button next">
				<a href="list.do${map.pageMaker.makeQuery(map.pageMaker.endPage+1)}&search_option=${map.search_option}&keyword=${map.keyword}">[다음]</a>
			</li>
		</c:if>	
			
	</ul>
</div>




