<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

    <!-- Sidebar Toggle (Topbar) -->
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>

    <!-- Topbar Search -->
    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
        <div class="input-group">
      		<!-- 시간 -->
        	<h5 class="time" style="margin-top: 10px;"></h5>
        </div>
    </form>

    <!-- Topbar Navbar -->
    <ul class="navbar-nav ml-auto">
        <div class="topbar-divider d-none d-sm-block"></div>

        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${adminUser.name}</span>
                <img class="img-profile rounded-circle"
                    src="admin_img/undraw_profile.svg">
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    Logout
                </a>
            </div>
        </li>

    </ul>

</nav>
<!-- End of Topbar -->

<!-- Bootstrap core JavaScript-->
<script src="admin_vendor/jquery/jquery.min.js"></script>
<script src="admin_vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="admin_vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- 현재 시간 표시 -->
<script type="text/javascript">
var time = document.querySelector('.time');
function displayTime(){
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth()+1;
	var date = now.getDate();
	var day = now.getDay();
	var hour = now.getHours();
	var minute = now.getMinutes();
	var second = now.getSeconds();
	var html = "";
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	
	html += year+"년"+month+"월"+date+"일"+"("+week[day]+")"+" ";
	html += (hour<10 ? "0"+hour : hour)+":"+(minute<10 ? "0"+minute : minute)+":"+(second<10 ? "0"+second : second);
	
	time.innerHTML = html;
}

function init(){
	setInterval(displayTime, 1000);
}

init();	
</script>