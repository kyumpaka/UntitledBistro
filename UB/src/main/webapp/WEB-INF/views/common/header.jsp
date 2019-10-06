<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${path}"><img src="${path}/resources/Admin/images/logo.png" alt="Logo"></a>
                    <a class="navbar-brand hidden" href="${path}"><img src="${path}/resources/Admin/images/logo2.png" alt="Logo"></a>
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <div class="header-left">
                        <button class="search-trigger"><i class="fa fa-search"></i></button>
                        <div class="form-inline">
                            <form class="search-form">
                                <input class="form-control mr-sm-2" type="text" placeholder="Search ..." aria-label="Search">
                                <button class="search-close" type="submit"><i class="fa fa-close"></i></button>
                            </form>
                        </div>

                        <div class="dropdown for-notification">
							<button id="realTimeSafeItem" onclick="riskItem()">
	                            <i class="fa fa-bell"></i>
	                            <span class="badge" id="riskItemCount">${riskItemCount}</span>
							</button>                        
                        </div>

                    </div>

                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="${path}/resources/Admin/images/admin.jpg" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="#"><i class="fa fa- user"></i>My Profile</a>

                            <a class="nav-link" href="#"><i class="fa fa- user"></i>Notifications <span class="count">13</span></a>

                            <a class="nav-link" href="#"><i class="fa fa -cog"></i>Settings</a>

                            <a class="nav-link" href="#"><i class="fa fa-power -off"></i>Logout</a>
                        </div>
                    </div>

                </div>
            </div>
        </header>
        
<!-- WebSocket -->
<script type="text/javascript">

var webSocket = new WebSocket("ws://localhost:8080/UntitledBistro/realTime-ws");
webSocket.onopen = onOpen;
webSocket.onmessage = onMessage;
webSocket.onclose = onClose;

function onOpen(e) {
	console.log("웹소켓 연결");
}

function onMessage(e) {
	console.log("서버로 부터 응답메시지 받음 : " + e.data);
	$("#header #realTimeCount").html(e.data);
}

function onClose(e) {
	console.log("웹소컷 닫음");
}

function riskItem() {
	window.location.href="${path}/jaego/risk_item";
}

</script>        