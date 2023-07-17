<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.getParameter("cust_name");
	request.getParameter("cust_id");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	  // 페이지가 로딩되면 실행되는 함수
	  $(document).ready(function() {
	    // cust_name과 cust_id 값을 가져옴
	    var custName = '<%= request.getAttribute("cust_name") %>';
	    var custId = '<%= request.getAttribute("cust_id") %>';
	  
	    alert(custName + "의 아이디는 " + custId + "입니다.");
	    setTimeout(function() {
	      location.href = "cust_login";
	    }, 1000); // 2초 후에 화면 변경 (2000ms)
	  });
	});
</script>
</head>
<body>
</body>
</html>