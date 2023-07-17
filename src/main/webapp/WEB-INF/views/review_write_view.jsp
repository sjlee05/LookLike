<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<link rel="stylesheet" href="resources/css/notice.css"> 
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_btn.css">
<link rel="stylesheet" href="resources/css/nav.css">
<script src="resources/js/nav.js"></script>
<link rel="stylesheet" href="resources/css/footer.css">
<script type="text/javascript">
$(function(){
	$(".footer").hover(function(){
		$(this).animate({"bottom":0});
	},function(){
		$(this).animate({"bottom":"-180px"});
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
<%-- 	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script> --%>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
	  .star-ratings {
	  color: #aaa9a9; 
	  position: relative;
	  unicode-bidi: bidi-override;
	  width: max-content;
	  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
	  -webkit-text-stroke-width: 1.3px;
	  -webkit-text-stroke-color: #2b2a29;
	}
	 
	.star-ratings-fill {
	  color: #fff58c;
	  padding: 0;
	  position: absolute;
	  z-index: 1;
	  display: flex;
	  top: 0;
	  left: 0;
	  overflow: hidden;
	  -webkit-text-fill-color: gold;
	}
	 
	.star-ratings-base {
	  z-index: 0;
	  padding: 0;
	}
	.star-rating {
	  display: flex;
	  flex-direction: row-reverse;
	  font-size: 2.25rem;
	  line-height: 2.5rem;
	  justify-content: space-around;
	  padding: 0 0.2em;
	  text-align: center;
	  width: 5em;
	}
	 
	.star-rating input {
	  display: none;
	}
	 
	.star-rating label {
	  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
	  -webkit-text-stroke-width: 2.3px;
	  -webkit-text-stroke-color: #2b2a29;
	  cursor: pointer;
	}
	 
	.star-rating :checked ~ label {
	  -webkit-text-fill-color: gold;
	}
	 
	.star-rating label:hover,
	.star-rating label:hover ~ label {
	  -webkit-text-fill-color: #fff58c;
	  
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
		margin-bottom: 300px;
	}
	.tab {
	border-collapse: collapse;
	width: 800px;
/* 	height: 1000px; */
	border-top:none;
	border-right: none;
/* 	border-bottom: none; */
	border-left: none;
	color: #BC8F8F;
	font-size: 1.2em;
	margin-top: 80px;
	}
	.tab td{
	border-top:none;
	border-right: none;
	border-bottom: none;
	border-left: none;
	height: 100px;
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
	}
    </style>
	<script type="text/javascript">

	$(document).ready(function() {
			
		$("form").submit(function(event) {
		    var title = $("input[name='rev_title']").val();
		    var content = $("textarea[name='rev_content']").val();
		    
		    if (title.trim() === '' || content.trim() === '') {
		        alert("제목과 내용을 모두 입력해주세요.");
		        event.preventDefault(); // 폼 제출을 중단
		    } else if ($('input:radio[name=rev_rate]:checked').length < 1) {
		        alert("평점을 입력해주세요.");
		        event.preventDefault(); // 폼 제출을 중단
		    }
		});
			
			
	    $("input[type='file']").on("change", function(e) {
	        var fileInput = $(this)[0];
	        var fileList = fileInput.files;
	        var fileObj = fileList[0];
	
	        if (!fileCheck(fileObj.name, fileObj.size)) {
	            return false;
	        }
	
	        console.log("fileList: " + fileList);
	        console.log("fileObj: " + fileObj);
	        console.log("fileName: " + fileObj.name);
	        console.log("fileSize: " + fileObj.size);
	        console.log("fileType(MimeType): " + fileObj.type);
	    });

	    var regex = new RegExp("(.*?)\\.(jpg|png)$");
	    var maxSize = 1048576; // 1MB
	
	    function fileCheck(fileName, fileSize) {
	        if (fileSize >= maxSize) {
	            alert("파일 사이즈 초과");
	            return false;
	        }
	
	        if (!regex.test(fileName)) {
	            alert("해당 종류의 파일은 업로드할 수 없습니다.");
	            return false;
	        }
	
	        return true;
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
<div class="table-wrapper">
	<table border="1" class="tab">
		<form id="frm" method="post" action="review_write" enctype="multipart/form-data">
			<input type="hidden" name="rev_step" value="${replyNum.rev_step}">
			<input type="hidden" name="rev_level" value="${replyNum.rev_level}">
			<input type="hidden" name="cust_id" value="${cust_id}">
			<input type="hidden" name="prod_name" value="${prod_name}">
			<tr>
				<td>이름</td>
				<td>
					${cust_id}
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="rev_title" size="50" style="height:30px;">
				</td>
			</tr>
			<tr>
				<td>상품명</td>
				<td>
					${prod_name}
				</td>
			</tr>
			<tr>
				<td>별점</td>
				<td>
		<div class="star-rating space-x-4 mx-auto">
		        <input type="radio" id="5-stars" name="rev_rate" value="5"/>
		        <label for="5-stars" class="star pr-4">★</label>
		        <input type="radio" id="4-stars" name="rev_rate" value="4"/>
		        <label for="4-stars" class="star">★</label>
		        <input type="radio" id="3-stars" name="rev_rate" value="3"/>
		        <label for="3-stars" class="star">★</label>
		        <input type="radio" id="2-stars" name="rev_rate" value="2"/>
		        <label for="2-stars" class="star">★</label>
		        <input type="radio" id="1-star" name="rev_rate" value="1"/>
		        <label for="1-star" class="star">★</label>
   		 </div>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="10" cols="55"  name="rev_content"></textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<div class="uploadDiv">
						<input type="file" name="uploadFile" multiple>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit"  value="입력" class="btn" style="padding: 8px 16px;">
					&nbsp;&nbsp;
					<a href="review_list" class="btn" style="padding: 8px 16px;">목록보기</a>
				</td>
			</tr>
		</form>
	</table>
</div>
<div class="footer">
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</div>
</body>
</html>














