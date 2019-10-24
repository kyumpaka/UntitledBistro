<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- Left Panel -->
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="${path}/erp?empregister_empnum=<sec:authentication property='principal.username'/>"><i class="menu-icon fa fa-laptop"></i>?ÑÌô©??</a>
                    </li>
                    <li class="menu-title">?¨Í≥†Í¥ÄÎ¶?</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>Î∞úÏ£º</a>
                        <ul class="sub-menu children dropdown-menu">     
                            <li><i class="fa fa-id-badge"></i><a href="${path}/balju/Balju_Plan">Í≥ÑÌöç ?±Î°ù</a></li>
                            <li><i class="fa fa-bars"></i><a href="${path}/balju/Balju_Plan_Result">Í≥ÑÌöç ?ÑÌô©</a></li>
                            <li><i class="fa fa-id-card-o"></i><a href="${path}/balju/Balju">Î∞úÏ£º ?±Î°ù</a></li>
                            <li><i class="fa fa-exclamation-triangle"></i><a href="${path}/balju/Balju_Mng">Î∞úÏ£º Í¥ÄÎ¶?</a></li>
                            <li><i class="fa fa-spinner"></i><a href="${path}/balju/Balju_Result">Î∞úÏ£º ?ÑÌô©</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>?¨Í≥†</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-square"></i><a href="${path}/jaego/item">?¨Í≥† ?ÑÌô©</a></li>
                            <li><i class="fa fa-square"></i><a href="${path}/jaego/in_item">?ÖÍ≥† ?¥Ïó≠</a></li>
                            <li><i class="fa fa-square"></i><a href="${path}/jaego/out_item">Ï∂úÍ≥† ?¥Ïó≠</a></li>
                            <li><i class="fa fa-square"></i><a href="${path}/jaego/change_item">?¨Í≥† Î≥Ä?ôÌëú</a></li>
                            <li><i class="fa fa-plus-square"></i><a href="${path}/jaego/defect_item">Î∂àÎüâ ?ÑÌô©</a></li>
                            <li><i class="fa fa-square"></i><a href="${path}/jaego/risk_item">?ÑÌóò?¨Í≥† ?ÑÌô©</a></li>
                            <li><i class="fa fa-plus-square"></i><a href="${path}/jaego/safe_item">?àÏ†Ñ?¨Í≥† ?ÑÌô©</a></li>
                        </ul>
                    </li>
                    
                    <li class="menu-title">Îß§Ï∂úÍ¥ÄÎ¶?</li><!-- /.menu-title -->

                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>Ï£ºÎ¨∏</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-fort-awesome"></i><a href="${path}/jumun/erp/menuSetting.do">Î©îÎâ¥ Í¥ÄÎ¶?</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="${path}/jumun/erp/tableSetting.do">?åÏù¥Î∏? Í¥ÄÎ¶?</a></li>
                        </ul>
                    </li>
                   
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>Í≤∞ÏÇ∞</a>
                        <ul class="sub-menu children dropdown-menu">
                           <li><i class="menu-icon fa fa-line-chart"></i><a href="${path}/View_jungsan.html">Í≤∞ÏÇ∞ ?ÑÌô©</a></li>
                            <li><i class="menu-icon fa fa-pie-chart"></i><a href="${path}/Day_DeadLine.html">Í≤∞ÏÇ∞ ÎßàÍ∞ê</a></li>
                        </ul>
                    </li>

                  
                    <li class="menu-title">?∏ÏÇ¨</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>?¨ÏõêÍ¥ÄÎ¶?</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="${path}/insa/EmpRegisterList">ÏßÅÏõê Î™©Î°ù</a></li>
                            <li><i class="menu-icon fa fa-paper-plane"></i><a href="${path}/insa/EmpWorkList">Í∑ºÎ¨¥ ?ºÏ?</a></li>
                            <li><i class="menu-icon fa fa-paper-plane"></i><a href="${path}/insa/PayCheck">Í∏âÏó¨</a></li>
                            <li><i class="fa fa-bars"></i><a href="${path }/insa/Schedule">?¥Í? ?§Ï?Ï§?</a></li>
                        </ul>
                    </li>
                      <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-area-chart"></i>?úÎπÑ??</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-map-o"></i><a href="${path}/Seobis/mList">?åÏõê Í¥ÄÎ¶?</a></li>
                            <li><i class="menu-icon fa fa-street-view"></i><a href="${path}/Seobis/jUs">?åÏõê ?±Î°ù</a></li>
                            <li><i class="fa fa-calendar-check-o"></i><a href="${path}/Seobis/Seobis_calendar">?àÏïΩ Í¥ÄÎ¶?</a></li>
                            <li><i class="menu-icon fa fa-map-o"></i><a href="${path}/Seobis/pList">?¨Ïù∏?? Í¥ÄÎ¶?</a></li>
                            
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->