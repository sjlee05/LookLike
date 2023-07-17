<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
	.div_page ul{
		display: flex;
		list-style: none;
	}
	.sale {
		display: flex;
 		flex-direction: column; 
  		align-items: center;
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
	color: blue;
	font-weight: bolder;
	}
	.btn {
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<link href="resources/css/stylelogin.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="resources/css/notice.css"> 
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_btn.css">
<script src="resources/js/nav.js"></script>
<link rel="stylesheet" href="resources/css/footer.css">
<script type="text/javascript">
var cust_id;
var ad_id;
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
        $(".login-btn").css({"background-color":"gray"});
     }else if(ad_id.length>0){
        $(".modal-btn").show();
        $(".login-btn").text(ad_id);
        $(".login-btn").css({"background-color":"gray"});
        $(".login-btn").parent().attr("href", "admin_managerpage");
        $(".login-btn").attr("onclick", "location.href='admin_loginmanager'");
     }else{
    	$(".modal-btn").hide();
        $(".login-btn").text(login_word);
        $(".login-btn").css({"background-color":"lightblue"});
     }
	
});
</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
$(function() {
	  var date = new Date();
	  var datepickerOption = { dateFormat: 'yy-mm-dd', defaultDate: date };

	  $("#startDate").datepicker({
	    dateFormat: "yy-mm-dd",
	    defaultDate: date,
	    onClose: function(selectedDate) {
	      if (selectedDate != "") {
	        $("#endDate").datepicker("option", "minDate", selectedDate);
	      }
	    }
	  });

	  $("#endDate").datepicker({
	    dateFormat: "yy-mm-dd",
	    defaultDate: date,
	    onClose: function(selectedDate) {
	      if (selectedDate != "") {
	        $("#startDate").datepicker("option", "maxDate", selectedDate);
	      }
	    }
	  });

	  // 기간 조건 변경
	  $("#dateCond").on("change", function() {
	    var today = new Date();
	    var toDate = getToDate(today, 0);
	    var fromDate;

	    var y = today.getFullYear();
	    var m = today.getMonth();
	    var firstDay = new Date(y, m, 1);
	    var lastDay = new Date(y, m + 1, 0);

	    switch ($(this).val()) {
	      case "thisMonth":
	        fromDate = firstDay;
	        toDate = lastDay;
	        break;

	      case "lastWeek":
	        fromDate = getToDate(today, 7);
	        break;

	      case "lastMonth":
	        fromDate = getToDate(today, 30);
	        break;

	      case "lastYear":
	        fromDate = getToDate(today, 365);
	        break;

	      case "":
	        fromDate = "1900-01-01";
	        toDate = "9999-12-31";
	        break;

	      default:
	        return;
	    }

	    $("#startDate")
	      .datepicker("option", "maxDate", toDate)
	      .datepicker("setDate", fromDate);
	    $("#endDate")
	      .datepicker("option", "minDate", fromDate)
	      .datepicker("setDate", toDate);
	  });

	  // 오늘 날짜
	  function getToDate(date, days, delimiter = "-") {
	    if (typeof days !== "number") return;
	    var to = new Date(date.getTime() - days * 24 * 60 * 60 * 1000);
	    var year = to.getFullYear();
	    var month = to.getMonth() + 1;
	    var day = to.getDate();
	    return [year, month, day].join(delimiter);
	  }
	});
	
	 

function sendRefundStatus(ord_merchant, idx) {
	  var selectedStatus =  $("#refundStatusSelect_"+idx).val();
	  // AJAX 호출
	   if (selectedStatus === "2") { //환불완료
	  $.ajax({
	    url: "cust_payCancel",  // 요청을 보낼 서버 URL
	    type: "POST",  // 요청 방식
	    data: {ord_merchant},  // 서버로 전송할 데이터
	    success: function(response) {
	      // 요청이 성공하면 실행할 코드 작성
	      alert("환불 성공");
	      $.ajax({
	          url: "countBack",
	          data: { ord_merchant: ord_merchant },
	          success: function() {
	            alert("환불 재고처리 완료");
	          },
	          error: function(jqXHR, textStatus, errorThrown) {
	            alert("환불 재고처리 실패");
	          }
	        });
	    },
	    error: function(xhr, status, error) {
	      // 요청이 실패하면 실행할 코드 작성
	      console.log(error);  // 에러 메시지 출력 (필요에 따라 처리)
	    }
	  });
	}else if (selectedStatus === "3"){//배송중
		alert("배송중 처리완료");
		location.href="cust_delivery?ord_merchant=" + ord_merchant;
	}else if (selectedStatus === "4"){//배송완료
		alert("배송완료 처리완료")
		location.href="cust_deliverycheck?ord_merchant=" + ord_merchant;	
	}else{
	   alert("주문 처리를 기다리고 있습니다.");		
	}
}
</script>
</head>
<body>
<div class="nav-menu" style="opacity: 0.7;">
<%@ include file="/WEB-INF/views/include/nav-main.jsp" %>
</div>
<a class="login-a" href="cust_login"><button class="login-btn" onclick="location.href='cust_myPage';">Log In</button></a>
<a class="login-a" href="cust_logout"><button class="modal-btn">Log Out</button></a>
<div class="sale">
	<h2>주문내역조회</h2>
	<label for="dateFrom"></label>
	<div class="input-date">
	<input type="text" name="startDt" id="startDate" title="시작일" maxlength="10" value="${sDate}" readonly>
	<span>~</span>
	<input type="text" name="endDt" id="endDate" title="시작일" maxlength="10" value="${eDate}" readonly>
	<select id="dateCond">
	  <option value="thisMonth" ${dateCond == 'thisMonth' ? 'selected' : ''}>이번달</option>
	  <option value="lastWeek" ${dateCond == 'lastWeek' ? 'selected' : ''}>최근1주일</option>
	  <option value="lastMonth" ${dateCond == 'lastMonth' ? 'selected' : ''}>최근30일</option>
	  <option value="lastYear" ${dateCond == 'lastYear' ? 'selected' : ''}>최근1년</option>
	  <option value="" ${dateCond == '' ? 'selected' : ''}>전체</option>
	</select>
	            <button>Search</button>
	</div>
<div class="table-wrapper">
	<form method="post" action="cust_payCancel">
  <table border="1" class="tab">
    <tr>
      <td>주문번호</td>
      <td>회원정보</td>
      <td>이름</td>
      <td>구매일</td>
      <td>총구매금액</td>
      <td>결제번호</td>
      <td>주문처리현황</td>
      <td>주문상태</td>
    </tr>
    <c:set var="previousOrdKey" value="" />
    <c:forEach items="${list}" var="dto" varStatus="status">
  <c:if test="${dto.ord_key ne previousOrdKey}">
    <tr>
      <td>
        <a class="move_link" href="${dto.ord_key}">${dto.ord_key}</a>
      </td>
      <td>${dto.cust_id}</td>
      <td>${dto.ord_name}</td>
      <td>${dto.ord_date}</td>
      <td>${dto.ord_totalprice}</td>
      <td>${dto.ord_merchant}</td>
      <td>
        <select name="refundStatus" id="refundStatusSelect_${status.count}">
          <option value="1" selected>${dto.ord_status}</option>
          <option value="2">환불완료</option>
          <option value="3">배송중</option>
          <option value="4">배송완료</option>
        </select>
      </td>
      <td>
        <button type="button" class="btn" style="padding: 8px 16px;" onclick="sendRefundStatus('${dto.ord_merchant}',${status.count})">주문상태 보내기</button>
      </td>
    </tr>
  </c:if>
  <c:set var="previousOrdKey" value="${dto.ord_key}" />
</c:forEach>
  </table>
</form>
	</div>
	<div class="div_page">
		<ul>
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button">
<!-- 					시작페이지 -1 하면 이전의 10개 페이지 표시 -->
<!-- 					ex>11->10(1~10), 21->20(11~20) -->
					<a href="${pageMaker.startPage - 1}">
						[Previous]
					</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
<!-- 				현재 페이지는 배경색 노란색으로 표시 -->
				<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='background-color:yellow'":""}>
<!-- 					클릭한 현재페이지 번호를 링크로 연결 -->
					<a href="${num}">
						[${num}]
					</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="paginate_button">
<!-- 					끝페이지 + 1 하면 이후의 10개 페이지 표시 -->
<!-- 				ex>10->11(11~20), 20->21(21~30) -->
					<a href="${pageMaker.endPage + 1}">
						[next]
					</a>
				</li>
			</c:if>
		</ul>
	</div>

	<form page="get" id="actionForm" action="sale_list">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="dateCond" value="${pageMaker.cri.dateCond }">
		<input type="hidden" name="startDt" value="${pageMaker.cri.startDt }">
		<input type="hidden" name="endDt" value="${pageMaker.cri.endDt }">
	</form>
</div>
<div class="footer">
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</div>
</body>
</html>

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
		
		var bno = actionForm.find("input[name='ord_key']").val();
		if (bno != ''){
			actionForm.find("input[name='ord_key']").remove();
		}
		
		actionForm.append("<input type='hidden' name='ord_key' value='"+targetBno+"'>")
		actionForm.attr("action","sale_content_view").submit();
	});
	
	$(".input-date button").on("click", function(e){
        e.preventDefault();
        let dateCond = $(".input-date select[name='dateCond']").val();
        let startDt = $(".input-date input[name='startDt']").val();
        let endDt = $(".input-date input[name='endDt']").val();
        
        if(!startDt){
            alert("시작일을 입력하세요.");
            return false;
        }
        
        if(!startDt){
            alert("시작일을 입력하세요.");
            return false;
        }  
        actionForm.find("input[name='startDt']").val(startDt);
        actionForm.find("input[name='endDt']").val(endDt);
        actionForm.find("input[name='pageNum']").val(1);
        actionForm.submit();
    });
 
</script>
