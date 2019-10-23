<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>PDF</title>
</head>
<body>
<c:if test="${result > 0}">
<iframe id="iframe" style="height: 500px; width: 100%;" src="${pageContext.request.contextPath}/resources/images/jumun/ordersPDF.pdf" ></iframe>
</c:if>
<c:if test="${result == 0}">
<h2>주문서 오류</h2>
</c:if>
</body>
</html>