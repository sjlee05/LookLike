<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stylemain.css">
<link rel="stylesheet" href="resources/css/login_btn.css">
<script
  type="text/javascript"
  src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"
></script>
<style>
	body{
		background-color: #FFFAFA;
		font-family: 'Times New Roman', Times, serif;
	}
	::-webkit-scrollbar{
		display: none;
	}
	.list_name{
		margin-top: 100px;
	}
	.list_main:first-child{
		margin: 0 auto;
		width: 90%;
		padding: 20px 0;
	}
	.list_content{
		width: 90%;
		height: 800px;
		margin: 30px auto;
 		overflow: auto;
	}
	.notice_main{
	    margin-top: 10%;
	    text-align: center;
	    font-size: 2em;
	}
	h4{
		font-family: 'Times New Roman', Times, serif;
		font-size: 1.5em;
	}
	hr{
		width: 70%;
		height:3px;
		background-color: silver;
	}
	.table-wrapper {
		display: flex;
		justify-content: center;
		margin-bottom: 30px;
	}
	.tab {
	border-collapse: collapse;
	width: 1100px;
	border-top:none;
	border-right: none;
	border-left: none;
	color: #BC8F8F;
	font-size: 1.2em;
	
	}
	.tab td{
	border-top:none;
	border-right: none;
	border-bottom: none;
	border-left: none;
	height: 80px;
	}
	.tab tr{
	border-top: 2px solid #a9a9a9;
	}
	.tab tr:first-child {
	border-top: none;
	}
	.tab
	a{
	text-decoration: none;
	color: #DEB887;
	}
	.tab2{
	border-top:none;
	border-right: none;
 	border-bottom: none; 
	border-left: none;
	font-size: 1em;
	}
	.tab2 td{
 	border-top:none; 
 	border-bottom: none; 
 	border-left: none; 
 	border-right: 2px solid #a9a9a9;
	}
	.tab2 td:first-child {
	border-left: 2px solid #a9a9a9;
	}
	.btn{
	  display: inline-block;
	  background-color: #BC8F8F;
	  color: white;
	  border: none;
	  text-align: center;
	  text-decoration: none;
	  cursor: pointer;
	  font-size: 16px;
	  margin-right: 10px;
	}
	
	.btn:hover {
	  background-color: #DEB887;
	}
</style>
<script>
	$(function(){
		cust_id = "${cust_id}";
	    console.log(cust_id);
	    var login_word = "lalalala";
	    $(".modal-btn").hide();
		   
	    if(cust_id.length>0){
	         $(".modal-btn").show();
	         $(".login-btn").text(cust_id);
	         $(".login-btn").css({"background-color":"gray"});
        }else{
	         $(".login-btn").text(login_word);
	         $(".login-btn").css({"background-color":"lightblue"});
	      }
	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
	<a class="login-a" href="#"><button class="login-btn" onclick="location.href='cust_myPage';">Log In</button></a>
	<a class="login-a" href="cust_logout"><button class="modal-btn">Log Out</button></a>
	<div class="notice_main">
		<h4 style="color:#BC8F8F;">QnA</h4>
	</div><hr><br><br>
	<div class="table-wrapper">
		<table border="1" class="tab" style="margin-bottom: 300px">
			<tr height="50px" bgcolor="#FFFAFA">
				<td width="5%" style="text-align: center;">문의번호</td>
				<td width="14%" style="text-align: center;">상품명</td>
				<td width="60%">제목</td>
				<td width="15%" style="text-align: center;">등록일자</td>
				<td width="6%" style="text-align: center;">조회수</td>
			</tr>
			<c:forEach items="${qnaList}" var="qna">
				<tr height="30px" bgcolor="#FFFAFA"
					onmouseout="this.style.backgroundColor='#FFFAFA'"
					onmouseover="this.style.backgroundColor='#eeeeef'">
					<td style="text-align: center;">${qna.qna_key}</td>
					<td style="text-align: center;">${qna.prod_name}</td>
					<td>
						<a href="qna_content_view?qna_key=${qna.qna_key}">${qna.qna_title}</a>
					</td>
					<td style="text-align: center;">${qna.qna_date}</td>
					<td style="text-align: center;">${qna.qna_hit}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>