<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<style>

	@keyframes slidy {
		0% { left: 0%; }
		20% { left: 0%; }
		25% { left: -100%; }
		45% { left: -100%; }
		50% { left: -200%; }
		70% { left: -200%; }
		75% { left: -300%; }
		95% { left: -300%; }
		100% { left: -400%; }
	}
	 
	body {
	
		background-color: white;
	}
	body > .bannerbody { 
		margin: 30px 150px 0 150px; 
	}
	 
	div#slider { 
		overflow: hidden; 
	}
	
	div#slider figure img { 
		width: 20%; 
		float: left; 
	}
	
	div#slider figure { 
	  position: relative;
	  width: 500%;
	  margin: 0;
	  top:0;
	  left: 0;
	  text-align: left;
	  font-size: 0;
	  -webkit-animation: 30s slidy ease-in-out infinite;
	  animation: 30s slidy ease-in-out infinite; 
	}

</style>

</head>
<body>
	<div class="bannerbody">
	<div id="slider">
		<figure>
			<img src="ad_images/ad1.jpg" alt="">
			<img src="ad_images/ad2.jpg" alt="">
			<img src="ad_images/ad3.jpg" alt="">
			<img src="ad_images/ad2.jpg" alt="">
			<img src="ad_images/ad1.jpg" alt="">
		</figure>
	</div>
	</div>
</body>
</html>