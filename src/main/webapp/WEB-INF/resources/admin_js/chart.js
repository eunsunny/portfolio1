$(document).ready(function(){
	// 최다 주문 회원 차트
	$.ajax({
		type: 'GET',
		headers : {
			Accept: "application/json; charset=UTF-8",
			"Content-type":"application/json; charset=UTF-8"
		},
		url: 'most_order_chart',
		success: function(result){
			// 최신 버전의 구글차트 패키지 로드
	    	google.charts.load('current', {'packages':['corechart']});
	    	google.charts.setOnLoadCallback(function(){
	    		drawOrderChart(result);
	    	});
		},
		error: function(){
			alert("Order Chart error!");
		}
	});
	
	function drawOrderChart(result){
		// 차트에 사용할 데이터 객체 생성
		var data = new google.visualization.DataTable();
		
		data.addColumn("string", "id");
		data.addColumn("number", "주문 횟수");
		
		// controller에서 json타입으로 전달된 데이터를 자바스크립트 배열로 저장
		var dataArray = [];
		$.each(result, function(i, obj){
			dataArray.push([obj.id, obj.order_count]);
		})
		        		
		// data에 dataArray 저장
		data.addRows(dataArray);
		
		// 차트 옵션 설정
		var option = {
			width:'100%',
			height:300,
			legend:'none',
			series:{
				0:{color:'00FF33'}
			}		};
		
		// 차트 그리기
		var chart = new google.visualization.ColumnChart(document.getElementById('myAreaChart1'));
		window.addEventListener('resize', function(){ chart.draw(data, option)}, false);
		chart.draw(data, option);
	}
	
	// 카테고리별 등록된 상품 갯수 차트
	$.ajax({
		type:'GET',
		headers:{
			Accept:"application/json; charset=utf-8",
			"Content-type":"application/json; charset=utf-8"
		},
		url:'kind_count_chart',
		success: function(result){
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(function(){
				drawKindChart(result);
			});
		},
		error:function(){
			alert("Kind Chart error!");
		}
	});
	
	function drawKindChart(result){
		// 차트에 사용할 데이터 객체 생성
		var data = new google.visualization.DataTable();
		
		data.addColumn("string", "kind");
		data.addColumn("number", "상품 갯수");
		
		// controller에서 json타입으로 전달된 데이터를 자바스크립트 배열로 저장
		var dataArray = [];
		$.each(result, function(i, obj){
			dataArray.push([obj.kind, obj.kind_count]);
		})
		        		
		// data에 dataArray 저장
		data.addRows(dataArray);
		
		// 차트 옵션 설정
		var option = {
			width:'100%',
			height:300,
			series:{
				0:{color:'00FF33'}
			}
		};
		
		// 차트 그리기
		var chart = new google.visualization.PieChart(document.getElementById('myAreaChart2'));
		window.addEventListener('resize', function(){ chart.draw(data, option)}, false);
		chart.draw(data, option);
	}
});