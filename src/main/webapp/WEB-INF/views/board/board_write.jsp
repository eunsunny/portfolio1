<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
  
<script>
$(document).ready(function(){
	 	//썸머노트에 값넣기
	   $('#summernote').summernote('code', '');
	 
	    //위와 같이 값을 먼저 넣어준 후 초기화를 시킨다. 그럼 아래와 같이 입력이 된다.
	    //초기화
		$('#summernote').summernote({
			height : 2000, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			focus : true,
			lang : 'ko-KR' // 기본 메뉴언어 US->KR로 변경
			
// 			callbacks : { 
//             	onImageUpload : function(files, editor, welEditable) {
//             // 파일 업로드(다중업로드를 위해 반복문 사용)
//             for (var i = files.length - 1; i >= 0; i--) {
//             uploadSummernoteImageFile(files[i],
//             this);
//             		}
//             	}
//             }
		});
});

function boardWirte(){
	var param = { content : $('#summernote').summernote('code'),
		 		  title   : $('#title').val()
		 		};
	var status = 'reload';
	
    $.ajax({
   		type:'POST', 
   		url:'write_save',
   		data:param,
   		success: function(data) {
   			if(data) {
    			alert('글 등록에 성공하였습니다.');
   				window.opener.makeGrid(status);
   				window.close();
   			}
   		},
   		error:function(request, status, error) {
   			alert("error:" + error);
   		}
   	});
	
}

function uploadSummernoteImageFile(file, el) {
	alert(0);
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "uploadSummernoteImageFile",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			$(el).summernote('editor.insertImage', data.url);
		}
	});
}

</script>
</head>
<body>
<form name="frm" id="write_form" method="post" enctype="multipart/form-data" style="margin-top : 100px;">
		<input type="hidden" name="pseq" value="${productVO.pseq}">
			<table id="list" style="margin: 0 auto; font-size : 20px;">
            <tr>
			  <th>제목: &nbsp;&nbsp;&nbsp;</th>
			  <td width="343" colspan="5">
			       <input type="text" name="title" id="title" size="80" maxlength="100" value="">
			  </td>
			</tr>
			</table>
		<div style="margin : 30px;"></div>
			
<div style="text-align: center; margin: 0 auto; width: 1000px;">
<div id="summernote" style="margin: 0 auto;">써니플리마켓의 게시판 입니다.</div>
</div>

 <div  style="text-align : center;">
  <button type="button" class="btn btn-success btn-lg" id="saveBtn" onClick="boardWirte()">작성</button>
 </div>
 </form> 
 
 
	



</body>
</html>