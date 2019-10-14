<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>   
    
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
 
<meta charset="utf-8">

<title><tiles:insertAttribute name="title"/></title>
 
<!-- Scripts -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 전체적인 css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${path}/resources/Admin/assets/css/style.css">
<link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
 
<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
 
<!-- 버튼 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="${path}/resources/Admin/assets/js/main.js"></script> 
 
<style>
	#weatherWidget .currentDesc {
	    color: #ffffff!important;
	}
	.traffic-chart {
	    min-height: 335px;
	}
	#flotPie1  {
	    height: 150px;
	}
	#flotPie1 td {
	    padding:3px;
	}
	#flotPie1 table {
	    top: 20px!important;
	    right: -10px!important;
	}
	.chart-container {
	    display: table;
	    min-width: 270px ;
	    text-align: left;
	    padding-top: 10px;
	    padding-bottom: 10px;
	}
	#flotLine5  {
	     height: 105px;
	}
	
	#flotBarChart {
	    height: 150px;
	}
	#cellPaiChart{
	    height: 160px;
	}
	
	.header-menu .dropdown {
		line-height: 45px;
	}
</style>

</head>

<body>
	<!-- Left Panel -->
	<tiles:insertAttribute name="leftPanel"/>
    <!-- /#left-panel -->
    
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
    
        <!-- Header-->
        <tiles:insertAttribute name="header"/>
        <!-- /#header -->
        
        <!-- Content -->
        <tiles:insertAttribute name="content"/>
        <!-- /.content -->
        
        <!-- <div class="clearfix"></div> -->
        
        <!-- Footer -->
       	<tiles:insertAttribute name="footer"/>
        <!-- /.site-footer -->
        
    </div>
    <!-- /#right-panel -->
    
</body>
</html>
