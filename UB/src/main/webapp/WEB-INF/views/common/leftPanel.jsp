<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- Left Panel -->
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="./"><i class="menu-icon fa fa-laptop"></i>현황판</a>
                    </li>
                    <li class="menu-title">재고관리</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>발주</a>
                        <ul class="sub-menu children dropdown-menu">     
                            <li><i class="fa fa-id-badge"></i><a href="${path}/balju/Balju_Plan">계획 등록</a></li>
                            <li><i class="fa fa-bars"></i><a href="${path}/balju/Balju_Plan_Result">계획 현황</a></li>
                            <li><i class="fa fa-id-card-o"></i><a href="${path}/balju/Balju">발주 등록</a></li>
                            <li><i class="fa fa-exclamation-triangle"></i><a href="${path}/balju/Balju_Mng">발주 관리</a></li>
                            <li><i class="fa fa-spinner"></i><a href="${path}/balju/Balju_Result">발주 현황</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>재고</a>
                        <ul class="sub-menu children dropdown-menu">
                             <li><i class="fa fa-id-badge"></i><a href="${path}/jaego/item">재고 현황</a></li>
                            <li><i class="fa fa-bars"></i><a href="${path}/jaego/in_item">입고 내역</a></li>
                            <li><i class="fa fa-id-card-o"></i><a href="${path}/jaego/out_item">출고 내역</a></li>
                            <li><i class="fa fa-exclamation-triangle"></i><a href="${path}/jaego/change_item">재고 변동표</a></li>
                            <li><i class="fa fa-spinner"></i><a href="${path}/jaego/bad_item">불량 처리</a></li>
                            <li><i class="fa fa-fire"></i><a href="${path}/jaego/special_item">특별 관리</a></li>
                        </ul>
                    </li>
                    
                    <li class="menu-title">매출관리</li><!-- /.menu-title -->

                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>주문</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-fort-awesome"></i><a href="font-fontawesome.html">메뉴 관리</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="font-themify.html">테이블 관리</a></li>
                        </ul>
                    </li>
                   
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>결산</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-line-chart"></i><a href="charts-chartjs.html">결산 현황</a></li>
                            <li><i class="menu-icon fa fa-pie-chart"></i><a href="charts-peity.html">결산 마감</a></li>
                        </ul>
                    </li>

                  
                    <li class="menu-title">인사</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>사원관리</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="page-login.html">직원 등록</a></li>
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">직원 목록</a></li>
                            <li><i class="menu-icon fa fa-paper-plane"></i><a href="pages-forget.html">급여 확인</a></li>
                            <li><i class="fa fa-bars"></i><a href="ui-tabs.html">근무 스케줄</a></li>
                        </ul>
                    </li>
                      <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-area-chart"></i>서비스</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-map-o"></i><a href="maps-gmap.html">회원 목록</a></li>
                            <li><i class="menu-icon fa fa-street-view"></i><a href="maps-vector.html">회원 관리</a></li>
                            <li><i class="fa fa-id-card-o"></i><a href="ui-cards.html">포인트 현황</a></li>
                            <li><i class="fa fa-calendar-check-o"></i><a href="ui-cards.html">예약관리</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->