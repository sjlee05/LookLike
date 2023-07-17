<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String name = "";
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	for (int i=0; i<=idx; i++){
		name = "prod_name_"+i;
		String prod_name = request.getParameter(name);
		%>
		<input type="text" value="<%=prod_name%>">
		<%
	}
%>
</body>
</html>