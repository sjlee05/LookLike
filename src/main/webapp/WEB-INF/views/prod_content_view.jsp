<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.tab {
   border-collapse: collapse;
   width: 600px;
/*    height: 1000px; */
   border-top:none;
   border-right: none;
/*    border-bottom: none; */
   border-left: none;
   color: #BC8F8F;
   font-size: 1.2em;
   
   }
   .tab td{
   border-top:none;
   border-right: none;
   border-bottom: none;
   border-left: none;
   height: 40px;
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
   .tab img{
      width: 100%;
      height: 300px;
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
      width: 700px;
      margin: 0 auto;
      margin-top: 50px;
      text-align: center;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

   $(document).ready(function() {
      
       $("form").submit(function(event) {
           var name = $("input[name='prod_name']").val();
           var content = $("input[name='prod_content']").val();
           var price = $("input[name='prod_price']").val();
           
           if (name.trim() === '' || content.trim() === '' || price.trim() === '') {
               alert("상품명, 내용, 가격을 모두 입력해주세요.");
               event.preventDefault(); // 폼 제출을 중단
           }
       });
      
      
      $(".filePathBtn").click(function() {
         var fileName = $('#imgPath' + this.value).val();
         var imageDiv = $(this).parent();
         var prod_key = "${prod_content_view.prod_key}";
         
            $.ajax({
               type: "POST",
               url: "prod_deleteFile",
               data: {fileName : fileName
                    ,prod_key : prod_key
               },
               success: function(result) {
                   // 파일 및 DB 레코드 삭제 성공 시 처리
                   if (result=="200") {
                  alert("성공");
                  imageDiv.remove(); // 이미지를 감싸는 div 요소 제거
                       $("#filePathBtn").remove(); // 파일 삭제 버튼 제거
                   } else {
                       alert("파일 삭제에 실패했습니다.");
                   }
               },
               error: function() {
                    alert("파일 삭제에 실패했습니다.");

               }
           });
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
<div class="background-image"></div>
   <div class="content">
   <table border="1" class="tab">
      <form method="post" action="prod_modify" enctype="multipart/form-data">
         <input type="hidden" name="prod_key" value="${prod_content_view.prod_key}">
         <tr>
            <td>상품고유번호</td>
            <td>${prod_content_view.prod_key}</td>
         </tr>
         <tr>
            <td>카테고리고유번호</td>
            <td>${prod_content_view.cat_key}</td>
         </tr>
         <tr>
            <td>상품명</td>
            <td>
               <input type="text" name="prod_name" value="${prod_content_view.prod_name}">
            </td>
         </tr>
         <tr>
            <td>이미지</td>
            <td>
               <c:if test="${not empty imgs}">
                  <c:forEach var="imgs" items="${imgs}" varStatus="status">
                     <div>
                        <img alt="이미지" src="${imgs}">
                            <input type="hidden" id="imgPath${status.count}" value="${imgs}">
                            <input type="button" class ="filePathBtn" id="deleteFilebtn${status.count}" value="${status.count}">                        
                     </div>
                  </c:forEach>
               </c:if>
            </td>
         </tr>
         <tr>
            <td colspan="2">첨부파일
               <div class="uploadDiv">
                  <input type="file" name="uploadFile" multiple>
               </div>
            </td>
         </tr>
         <tr>
            <td>상품설명</td>
            <td>
               <input type="text" name="prod_content" value="${prod_content_view.prod_content}">
            </td>
         </tr>
         <tr>
            <td>가 격</td>
            <td>
               <input type="text" name="prod_price" value="${prod_content_view.prod_price}">
            </td>
         </tr>
         <tr>
            <td>재고량</td>
            <td>
               <input type="text" name="prod_cnt" value="${prod_content_view.prod_cnt}">
            </td>
         </tr>
         <tr>
            <td>사이즈</td>
            <td>
               <input type="text" name="prod_size" value="${prod_content_view.prod_size}">
            </td>
         </tr>
         <tr>
            <td colspan="2">
               <input type="submit" value="수정" class="btn" style="padding: 8px 16px;">
               &nbsp;&nbsp;<a href="prod_list" class="btn" style="padding: 8px 16px;">목록보기</a>
               <input type="submit" value="삭제" formaction="prod_delete" class="btn" style="padding: 8px 16px;">
            </td>
         </tr>
      </form>
   </table>
</div>
</body>
</html>
