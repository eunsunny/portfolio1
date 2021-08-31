<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<!-- 사이드 메뉴 -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="admin_main">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Sunny <sup>adminPage</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - 회원관리 사이드 메뉴 -->
            <li class="nav-item">
                <a class="nav-link" href="member_manage">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>회원관리</span>
                </a>
            </li>

            <!-- Nav Item - 상품관리 사이드 메뉴 -->
            <li class="nav-item">
                <a class="nav-link" href="product_manage">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>상품관리</span>
                </a>
            </li>

            <!-- Nav Item - 결제관리 사이드 메뉴 -->
            <li class="nav-item">
				<a class="nav-link" href="order_manage">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>결제관리</span>
                </a>
            </li>

            <!-- Nav Item - 게시판 관리 사이드 메뉴 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>게시판 관리</span>
                </a>
				<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Board Screens:</h6>
                        <a class="collapse-item" href="board">자유게시판</a>                        
                        <a class="collapse-item" href="gongzi">공지사항</a>
                        <a class="collapse-item" href="usuallyask">자주묻는질문</a>
                        <a class="collapse-item" href="oneone">1:1 문의</a>
                        <a class="collapse-item" href="report">신고 처리</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            <!-- Sidebar Message -->
            <div class="sidebar-card d-none d-lg-flex">
                <img class="sidebar-card-illustration mb-2" src="admin_img/undraw_rocket.svg" alt="...">
                <p class="text-center mb-2"><strong>Sunny Flea Market</strong><br>
                관리자 페이지입니다.
                </p>
                <a class="btn btn-success btn-sm" href="#">Upgrade to Pro!</a>
            </div>

        </ul>
        <!-- End of Sidebar -->