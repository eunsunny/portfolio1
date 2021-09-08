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
var fileNameArr = [];

$(document).ready(function() {
	
	
	var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ];

	var setting = {
            height : 300,
            minHeight : null,
            maxHeight : null,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar,
            callbacks : { //여기 부분이 이미지를 첨부하는 부분
            onImageUpload : function(files, editor, welEditable) {
						            for (var i = files.length - 1; i >= 0; i--) {
						            uploadSummernoteImageFile(files[i], this);
						            }
				            	}
				        }
         };
		
       $('#summernote').summernote(setting);
       
        
    });

function uploadSummernoteImageFile(file, el) {
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
			fileNameArr.push(data.url.substr(data.url.indexOf("/")+1, data.url.length)); // 파일명
			$(el).summernote('editor.insertImage', data.url);
			
		}
	});
}

function boardFinalUpdate(){	
	var param = { content  : $('#summernote').summernote('code'),
		 		  title    : $('#title').val(),
		 		  files	   : fileNameArr,
				  bseq 	   : document.getElementById("bseq").value
				};
	
	var status = 'reload';
	
    $.ajax({
   		type:'POST', 
   		url:'write_update',
   		data:param,
   		success: function(data) {
   			alert('등록 성공하였습니다.');
//  			window.opener.makeGrid(status);
 			window.close();
   		},
   		error:function(request, status, error) {
   			alert("error:" + error);
   		}
   	});
}

</script>
</head>

<body>
<form name="frm" id="write_form" method="post" enctype="multipart/form-data" style="margin-top : 100px;">
		<input type="hidden" id="bseq" name="bseq" value="${map.bseq}">
			<table id="list" style="margin: 0 auto; font-size : 20px;">
            <tr>
			  <th>제목: &nbsp;&nbsp;&nbsp;</th>
			  <td width="343" colspan="5">
			       <input type="text" name="title" id="title" size="80" maxlength="100" value="${map.TITLE}">
			  </td>
			</tr>
			</table>
		<div style="margin : 30px;"></div>
			
<div  style="text-align: left; margin: 0 auto; width: 1000px;">
<div id="summernote" style="margin: 0 auto;">${map.CONTENT}</div>
</div>

 <div  style="text-align : center;">
  <button type="button" class="btn btn-success btn-lg" id="saveBtn" onClick="boardFinalUpdate()">수정</button>
 </div>
 </form> 
 
 
</body>
</html>