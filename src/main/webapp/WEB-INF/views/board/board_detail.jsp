<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-1.11.0.min.js"></script>

<style>
	
table.type05 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: left;
  line-height: 1.5;
  border-top: 4px solid #ccc;
  border-bottom: 5px double #ccc; 
  margin: 20px 10px;
  width : 1500px;
  margin-left:auto; 
  margin-right:auto;
  background-color: white;
}
table.type05 th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  text-align : center;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #e4d8d8;
}
table.type05 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
</style>
</head>
<body>
<form id="formm">
<input type="hidden" id="bseq" name="bseq" value="${map.BSEQ}">
    <table  class="type05" >
        <caption style="font-size: 30px; margin-bottom: 20px;">상세보기</caption>
        <colgroup >
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="*">
        </colgroup>
         
        <tbody>
        
            <tr>
                <th scope="row">제목</th>
                <td>${map.TITLE}</td>
                <th scope="row">조회수</th>
                <td>${map.COUNT }</td>
            </tr>
            <tr>
                <th scope="row">작성자</th>
                <td>${map.ID }</td>
                <th scope="row">작성시간</th>
                <td>${map.REGDATE }</td>
            </tr>
            <tr>
                <th scope="row" style="height: 500px;">내용</th>
                <td colspan="3">
<%--                 	<img class="card-img img-fluid" src="product_images/${map.IMAGE}" alt="Card image cap" id="product-detail"><br> --%>
                    ${map.CONTENT}
                </td>
            </tr>
            
        </tbody>
       
    </table>
 </form>   
    <div style="text-align : center; margin: 40px;">
    <input type="button"  id="list" class="btn"  value="목록으로">
    <c:if test="${sessionScope.loginUser.id == map.ID}">
    <input type="button"  id="modify" class="btn" onClick="popOpenUpdate()" value="수정하기">
    <input type="button"  id="delete" class="btn" value="삭제하기">
    </c:if>
    </div>
    
    
<script type="text/javascript">
$(document).ready(function(){
    $("#list").on("click",function(e){
        e.preventDefault();
        fn_openBoardList();
    })
//     $("#modify").on("click",function(e){
//         e.preventDefault();
//         fn_openBoardModify();
//     })
     $("#delete").on("click",function(e){
        e.preventDefault();
        fn_openBoardDelete();
    })
})
 
function fn_openBoardList(){
	$("#formm").attr("action", "openBoardList.do").submit();
}
// function fn_openBoardModify(){
// 	$("#formm").attr("action", "openBoardUpdate.do").submit()
// }
function fn_openBoardDelete(){
	$("#formm").attr("action", "openBoardDelete.do").submit();
}

function popOpenUpdate() {
		var t =  document.getElementById("bseq").value
		var url= "<%=request.getContextPath()%>/BoardUpdate?bseq="+t;    //팝업창 페이지 URL
		var winWidth = 1100;
	    var winHeight = 500;
	    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
		window.open(url,"",popupOption);
	}


 
 </script>     
<%@include file="board_comment.jsp" %> 
<%@ include file="../footer.jsp"%>
</body>
</html>