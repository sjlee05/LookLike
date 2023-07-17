<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<link rel="stylesheet" href="resources/css/login_btn.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stylemain.css">
<style>
	.list_name{
		margin-top: 100px;
	}
	.list_main{
/* 		background-color: rgba(200, 200, 200, 0.5); */
		margin: 0 auto;
		width: 90%;
/* 		height: 1000px; */
		padding: 20px 0;
		/* display: flex-start; */
		overflow: auto;
	}
	.list_content{
/* 		border: 5px solid rgba(200, 255, 255, 0.5); */
		width: 90%;
		height: 800px;
		margin: 30px auto;
 		overflow: auto;
	}
	body{
		background-color: #fffafa;
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
	/* Chrome, Safari, Edge, Opera */
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
	  -webkit-appearance: none;
	  margin: 0;
	}
	body{
		background-color: #fffff0;
	}
	.list_name{
		margin-top: 100px;
	}
	.list_main{
/* 		background-color: rgba(200, 200, 200, 0.5); */
		margin: 0 auto;
		margin-bottom: 100px;
		width: 1000px;
/*  		height: 1000px; */
/*  		padding-top: 40px; */
		/* display: flex-start; */
		overflow: hidden;
		text-align: center;
	}
	.list_content{
/* 		border: 5px solid rgba(200, 255, 255, 0.5); */
		width: 90%;
		height: 800px;
		margin: 30px auto;
 		overflow: auto;
	}
	.wish_list{
		height: 200px;
/* 		border: 1px solid black; */
		margin: 50px auto;
	}
	.wish_list img{
		height: 100%;
		margin: auto;
	}
	hr:last-child{
		display: none;
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
	.wish_list button {
	    padding: 8px 12px;
	    background-color: #778899;
	    width:220px;
	    height:76px;
	    color: white;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	    margin-left: 10px;
	    font-size: 200%;
	}
	.wish_list button:hover {
	    background-color: #696969;
	}
</style>
<script>
	function wishDelete(cust_key,prod_key){
		if(confirm("관심내역에서 삭제하시겠습니까?")){
// 			alert('/cart/delete?cart_key='+key);
			location.href='/projectfinal/cust_wishDelete?cust_key='+cust_key+'&prod_key='+prod_key;
		}else{
			alert(''+key);			
		}
	}
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
		<h4 style="color:#BC8F8F;">Wish List</h4>
	</div><hr><br><br>
	<div class="list_main">
	<div class="list_content">
	<c:forEach items="${wishList}" var="wish">
		<div class="wish_list">
				<div style="height:100%; width:200px; background-color: darkgray; float: left; overflow: hidden;">
					<img src="${cart.prod_imgpath}">
				</div>
				<div style="height:100%; width:100px; left: 0; float: right; margin-left: 20px;">
					<input type="button"  value="삭제"  class="btn" onclick="wishDelete(${wish.cust_key},${wish.prod_key})" style="padding: 8px 16px;">
				</div>
				<div style="height:100%; width:550px; left: 0; float: right; text-align: left; padding-left: 20px; font-size: 25px;">
						<p style="font-size: 30px; margin: 0.5em 0;'"><b>${wish.prod_name}</b><p>
						가격 = ${wish.prod_price}<br>
						사이즈 = ${wish.prod_size}<br>
				</div>
		</div>
	</c:forEach>
	</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>