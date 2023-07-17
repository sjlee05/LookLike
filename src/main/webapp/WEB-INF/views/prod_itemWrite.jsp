<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 20px;
}

body {
	margin: 0;
	padding: 0;
}

.background-image {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-image:
		url("${pageContext.request.contextPath}/resources/images/Model1.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}

.content {
	position: relative;
	z-index: 1;
	background-color: rgba(255, 255, 255, 0.8);
	padding: 20px;
	border-radius: 5px;
	width: 500px;
	height: 650px;
	margin: 0 auto;
	margin-top: 150px;
	text-align: center;
}

table {
	margin: 0 auto;
}

.tab {
	border-collapse: collapse;
	width: 500px;
	height: 500px;
	border-top: none;
	border-right: none;
	border-left: none;
	color: #BC8F8F;
	font-size: 1.2em;
	margin-top: 80px;
}

.tab td {
	border-top: none;
	border-right: none;
	border-bottom: none;
	border-left: none;
}

.tab tr {
	border-top: 2px solid #a9a9a9;
}

.tab tr:first-child {
	border-top: none;
}

.tab
		a {
	text-decoration: none;
}

.btn {
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function fn_submit() {
       var formData = new FormData($("#frm")[0]);
        
        $.ajax({
          url:"prod_write"
          ,processData: false
          ,contentType: false
           ,data:formData
           ,type:"POST"
           ,success:function(data){
              alert("저장 완료");
              location.href = "prod_list";
           },
           error: function() {
			alert("오류발생");
		}
    
        });//end of click ajax
     };   //end of click function
 
	$(document).ready(function() {
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
   var maxSize = 5242880;//5MB
   
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
   };
});
</script>
</head>
<body>
<div class="background-image"></div>
<div class="content">
<h1>상품등록하기</h1>
	<form id="frm" method="post" action="prod_write" enctype="multipart/form-data">
		<table border="1" class="tab">
			<tr>
                <td>카테고리고유번호</td>
                <td>
                    <select name="cat_key" style="width:180px; text-align: center;" >
                    <c:forEach items="${categoryList}" var="cate" varStatus="status">
                        <option value="${cate.cat_key}">${cate.cat_key} : ${cate.cat_name}</option>
                      </c:forEach>
                       </select>
                </td>
            </tr>
				</td>
			</tr>
			<tr>
				<td>상품명</td>
				<td>
					<input type="text" name="prod_name">
				</td>
			</tr>
			<tr>
				<td>이미지</td>
				<td>
					<input type="file" name="uploadFile" multiple id="fileItem">
				</td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td>
					<textarea rows="4" cols="22" name="prod_content"></textarea>
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>
					<input type="text" name="prod_price">
				</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>
					<input type="text" name="prod_rdate">
				</td>
			</tr>
			<tr>
				<td>재고</td>
				<td>
					<input type="text" name="prod_cnt">
				</td>
			</tr>
			<tr>
				<td>사이즈</td>
				<td>
					<select name="prod_size" style="width:180px;text-align: center;">
						<option value="M">M[80-90]</option>
						<option value="L">L[90-100]</option>
						<option value="XL">XL[100-110]</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="등록" onclick="fn_submit()" class="btn" style="padding: 8px 16px;">
					<a href="prod_list"><input type="button" value="취소" class="btn" style="padding: 8px 16px;"></a>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>














