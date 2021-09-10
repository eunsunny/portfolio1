<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="js/product.js"></script>
<script type="text/javascript" src="member/member.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>
<script type="text/javascript">
function callIamport(){
	//validation('formm');
    var IMP = window.IMP; // 생략가능
    IMP.init('imp97936430'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    var msg;
    var pseq = $('#pseq').val();
    
    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : 'Sunny FleaMarket ProductBuy',
        amount : $('#price').val(),   
        buyer_email : '',   
        buyer_name : '',
        buyer_tel : '',
        buyer_addr : '',
        buyer_postcode : '',
//         m_redirect_url : 'http://www.naver.com'
    }, function(rsp) {
        if ( rsp.success ) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            jQuery.ajax({
                url: "pay_success", //cross-domain error가 발생하지 않도록 주의해주세요
                type: 'POST',
                dataType: 'json',
                data: {
                    imp_uid : rsp.imp_uid
                    //기타 필요한 데이터가 있으면 추가 전달
                }
            }).done(function(data) {
                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                if ( everythings_fine ) {
                    msg = '결제가 완료되었습니다.';
                    msg += '\n고유ID : ' + rsp.imp_uid;
                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                    msg += '\결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    
                    alert(msg);
                } else {
                    //[3] 아직 제대로 결제가 되지 않았습니다.
                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                }
            }); 

            //결제정보 Insert까지 성공 시 결제완료 페이지 이동
            if(insertFuntion()){
	            location.href="<%=request.getContextPath()%>/call_iamport_success?pseq=" + pseq;            	
            } else{
            	alert('결제에 실패하였습니다.');
            }
            
            //성공시 이동할 페이지
        } else {
            msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            //실패시 이동할 페이지
<%--             location.href="<%=request.getContextPath()%>/call_iamport_fail";            	 --%>
            alert(msg);
        }
    });
}

//결제정보 Insert
function insertFuntion(){
	var returnflag = true;
	var param = {buyer_address : $('#addr1').val()+$('#addr2').val(),
				 pseq : $('#pseq').val()
				 };
	$.ajax({
		type:'POST', 
		url:'pay_save',
		data:param,
		success: function(data) {},
		error:function(request, status, error) {
			returnflag = false;
		}
	});
	return returnflag;
}
</script>
<body>
<article>
	<div class="row">
	

	<form id="formm" name="formm" method="post">
		<input type="hidden" name="pseq" id="pseq" value="${buyerInfo.pseq}" />
		<input type="hidden" name="kind" id="kind" value="${buyerInfo.kind}" />
		
		<div style="font-size: 30px; margin-top: 60px;">
		<h1>결제하기</h1>  
		</div>	
		<br>
		
		<table id="list" style="width: 1000;">
		
<!-- 		<p> -->
<%-- 		<span>name:</span> <input name="name" value="${buyerInfo.loginUserName}"> --%>
<!-- 			<!-- 값 가져오기 -->
<!-- 		</p> -->
		<tr>
			  <th>이름</th>
			  <td width="343" colspan="5">
			       <input style="width:50%;" type="text" name="name" id="name" size="47" maxlength="100" value="${buyerInfo.loginUserName}" disabled>
			  </td>
		</tr>
		
<!-- 		<p> -->
<!-- 			<span>이메일:</span> <input name="email" id="email"> -->
<!-- 		</p> -->

		<tr>
			  <th>이메일</th>
			  <td width="343" colspan="5">
			       <input style="width:70%;" type="text" name="email" id="email" size="47" maxlength="100" value="${buyerInfo.email}" disabled>
			  </td>
		</tr>

<!-- 		<span>폰넘버:</span> -->
<!-- 		<p> -->
<!-- 			<input type="text" name="phone" id="phone"> -->
<!-- 		</p> -->
		
		<tr>
			  <th>전화번호</th>
			  <td width="343" colspan="5">
			       <input style="width:70%;" type="text" name="phone" id="phone" size="47" maxlength="100" value="${buyerInfo.phone}" disabled>
			  </td>
		</tr>
		
		
<!-- 		<span>주소:</span> -->
<!-- 		<p> -->
<!-- 			<input name="address" id="address"> -->
<!-- 		</p> -->

<!-- 		<tr> -->
<!-- 			  <th>주소*</th> -->
<!-- 			  <td width="343" colspan="5"> -->
<%-- 			       <input type="text" name="address" id="address" size="47" maxlength="100" value="${buyerInfo.address}"  --%>
<!-- 			       style="background-color: white;"> -->
<!-- 			  </td> -->
<!-- 		</tr> -->
		
		<tr>
			  <th>받으실 주소*</th>
			  <td width="500" colspan="5">
			       <div class="col-4" >
        			<input style="width:50%; margin-bottom: 0.5em;" size="10" type="text" name="zip_num" id="zip_num" placeholder="우편번호" readonly>
        			
        			</div>
        			<div class="col-8" >
        		    <input style="width:100%; margin-bottom: 0.5em;" type="text" id="addr1" name="addr1" class="form-control input-md" placeholder="주소" readonly > 
        		    <input style="width:100%; margin-bottom: 0.5em; background-color: white;" type="text" id="addr2" name="addr2" class="form-control input-md" placeholder="상세주소">
        		    </div>
        		</td>
        		<td>
        			<div class="col-1">      
        			<input style="margin-bottom: 10px;" type="button" value="주소 찾기" class="dup" onclick="execPostCode();">
        			</div>
        			
			  </td>
		</tr>

<!-- 		<span>총가격:</span> -->
<!-- 		<p> -->
<%-- 			<input name="totalPrice" id="totalPrice" value="${buyerInfo.price}"> --%>
<!-- 		</p> -->
		
		<tr>
			  <th >결제 금액</th>
			  <td width="343" colspan="5" >
			  <input style="width:70%;" type="text" name="price" id="price" size="47" maxlength="100" value="${buyerInfo.price}" disabled>
			  </td>
			
		</tr>
		
		</table>
		<div style="text-align: center;">
		<br>
		<input type="button" onclick="callIamport()" value="결제하기"> <input type="button" onClick="go_cancel()" value="취소하기">
		</div>
	</form>
 </div>
</article>
<%@ include file="../footer.jsp"%>	
</body>
</html>