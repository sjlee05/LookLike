<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
h4{
		font-family: 'Times New Roman', Times, serif;
		font-size: 1.5em;
	}
	hr{
		width: 70%;
		height:3px;
		background-color: silver;
	}
	.div_page ul {
    display: flex;
    list-style: none;
    padding: 0;
    margin: 0;
}

.div_page ul li {
    margin-right: 10px;
}

.div_page ul li:last-child {
    margin-right: 0;
}

.div_page ul li a {
    text-decoration: none;
    color: #000;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

.div_page ul li a:hover {
    background-color: #f1f1f1;
}

.div_page ul li.active a {
    background-color: #ddd;
}

.div_page ul li.disabled a {
    pointer-events: none;
    color: #999;
}

.div_page ul li span {
    padding: 5px;
}



.search_wrap {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.search_area {
    display: flex;
    align-items: center;
}

.search_area select,
.search_area input[type="text"] {
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.search_area select {
    margin-right: 10px;
}

.search_area button {
    padding: 8px 12px;
    background-color: #778899;
    width:110px;
    height:38px;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-left: 10px;
}

.search_area button:hover {
    background-color: #696969;
}

#actionForm {
    display: none;
}
	.review {
		display: flex;
 		flex-direction: column; 
  		align-items: center;  
		margin-bottom: 300px;
	}
	body{
 		background-color: #FFFAFA; 
	}
	.footer{
       width: 100%;
       position: fixed;
       left: 0;
       bottom: -180px;
       z-index: 99;
  }
	.table-wrapper {
		display: flex;
		justify-content: center;
		margin-bottom: 30px;
	}
	.tab {
	border-collapse: collapse;
	width: 1100px;
/* 	height: 1000px; */
	border-top:none;
	border-right: none;
/* 	border-bottom: none; */
	border-left: none;
	color: #BC8F8F;
	font-size: 1.2em;
	font-family: 'Times New Roman', Times, serif;
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
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<link rel="stylesheet" href="resources/css/notice.css"> 
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_btn.css">
<link rel="stylesheet" href="resources/css/nav.css">
<script src="resources/js/nav.js"></script>
<link rel="stylesheet" href="resources/css/footer.css">
<script type="text/javascript">
var cust_id;
var ad_id;
$(function(){
	$(".footer").hover(function(){
		$(this).stop().animate({"bottom":0});
	},function(){
		$(this).stop().animate({"bottom":"-180px"});
	});
	
	cust_id = "${cust_id}";
	console.log("cust_id:"+cust_id);
	ad_id = "${ad_id}";
	var login_word = "Log In";
	$(".modal-btn").hide();
	
	if(cust_id.length>0){
        $(".modal-btn").show();
        $(".login-btn").text(cust_id);
        $(".login-btn").css({"background-color":"#BC8F8F"});
     }else if(ad_id.length>0){
        $(".modal-btn").show();
        $(".login-btn").text(ad_id);
        $(".login-btn").css({"background-color":"#BC8F8F"});
        $(".login-btn").parent().attr("href", "admin_managerpage");
        $(".login-btn").attr("onclick", "location.href='admin_loginmanager'");
     }else{
    	$(".modal-btn").hide();
        $(".login-btn").text(login_word);
        $(".login-btn").css({"background-color":"lightblue"});
     }
});
</script>
</head>
<body>
<div class="nav-menu" style="opacity: 0.7;">
<%@ include file="/WEB-INF/views/include/nav-main.jsp" %>
</div>
<a class="login-a" href="cust_login"><button class="login-btn" onclick="location.href='cust_myPage';">Log In</button></a>
<a class="login-a" href="cust_logout"><button class="modal-btn">Log Out</button></a>
<div class="review">
	<div class="notice_main">
		
		<h4 style="color:#BC8F8F;">ReView</h4>
	</div><hr><br><br>
<div class="table-wrapper">
	<table border="1" class="tab">
		<tr height="50px">
			<td width="5%" style="text-align: center;">번호</td>
			<td width="15%" style="text-align: center;">상품명</td>
			<td width="6%" style="text-align: center;">작성자</td>
			<td width="60%" style="text-align: center;">제목</td>
			<td width="14%" style="text-align: center;">날짜</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr height="30px">
				<td style="text-align: center;">${dto.rev_key}</td>
				<td style="text-align: center;">${dto.prod_name}</td>
				<td style="text-align: center;">
					<c:choose>
						<c:when test="${dto.cust_id != null}">
							${dto.cust_id}
						</c:when>
						<c:when test="${dto.ad_id != null}">
							${dto.ad_id}
						</c:when>
						<c:otherwise>
							Unknown
						</c:otherwise>
					</c:choose>
				</td>
				<td style="text-align: center;">
		            <c:if test="${dto.rev_level > 0}">
		                <c:forEach begin="0" end="${dto.rev_level}">
		                    &nbsp;&nbsp;&nbsp;&nbsp;
		                </c:forEach>
		                [답변]
		            </c:if>
					<a class="move_link" href="${dto.rev_key}">${dto.rev_title}</a>
				</td>
				<td style="text-align: center;">${dto.rev_date}</td>
			</tr>
		</c:forEach>
	</table>
</div>
	<div class="div_page">
		<ul>
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button">
<!-- 					시작페이지 -1 하면 이전의 10개 페이지 표시 -->
<!-- 					ex>11->10(1~10), 21->20(11~20) -->
					<a href="${pageMaker.startPage - 1}">
						이전
					</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
<!-- 				현재 페이지는 배경색 노란색으로 표시 -->
				<li class="paginate_button">
<!-- 					클릭한 현재페이지 번호를 링크로 연결 -->
					<a href="${num}">
						${num}
					</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="paginate_button">
<!-- 					끝페이지 + 1 하면 이후의 10개 페이지 표시 -->
<!-- 				ex>10->11(11~20), 20->21(21~30) -->
					<a href="${pageMaker.endPage + 1}">
						다음
					</a>
				</li>
			</c:if>
		</ul>
	</div>
	<div class="search_wrap">
        <div class="search_area">
        <select name="type">
                <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
                <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
                <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
                <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
                <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
            </select>    
            <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
            <button>Search</button>
        </div>
    </div>    

	<form page="get" id="actionForm" action="review_list">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		<input type="hidden" name="type" value="${pageMaker.cri.type }">
	</form>
</div>
<div class="footer">
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</div>		
</body>
</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var actionForm = $("#actionForm");
	
	//	페이지 번호처리
	$(".paginate_button a").on("click",function(e){
		e.preventDefault();
		console.log("@# href ===>"+$(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	//	게시글 처리
	$(".move_link").on("click",function(e){
		e.preventDefault();
		var targetBno = $(this).attr("href");
		
		var bno = actionForm.find("input[name='rev_key']").val();
		if (bno != ''){
			actionForm.find("input[name='rev_key']").remove();
		}
		
		actionForm.append("<input type='hidden' name='rev_key' value='"+targetBno+"'>")
		actionForm.attr("action","review_content_view").submit();
	});
	
	$(".search_area button").on("click", function(e){
        e.preventDefault();
        let type = $(".search_area select[name='type']").val();
        let keyword = $(".search_area input[name='keyword']").val();
        
        if(!type){
            alert("검색 종류를 선택하세요.");
            return false;
        }
        
        if(!keyword){
            alert("키워드를 입력하세요.");
            return false;
        }       
        actionForm.find("input[name='type']").val(type);
        actionForm.find("input[name='keyword']").val(keyword);
        actionForm.submit();
    });
	
	$(".btn").on("click", function(e){
        if(!"${cust_id}"&&!"${ad_id}"){
            if(confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?")){
                location.href="cust_login";
      		  }
        }else{
            location.href='review_write_view'; 
        }
    });
 

</script>
