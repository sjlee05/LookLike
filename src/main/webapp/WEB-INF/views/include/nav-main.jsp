<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style type="text/css">
    .search_div button {
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
.keywordinput{
	height: 30px;
}
body{
font-family: 'Times New Roman', Times, serif;
}
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
    <script src="${pageContext.request.contextPath}/resources/js/main_nav.js"></script>
</head>
<body>
    <nav class="nav" style="background-color:#FFFAFA">
        <div class="nav_div"> 
          <div class="logo">
            <a href="prod_member_list">
              <b>L</b>OO<b>K</b><br>
              <b>L</b>I<b>K</b>E
            </a>
          </div>
          <div class="menu_list" >
            <div class="menu1" style="height: 50px;">
              <table class="nav_table">
                <tr>
                  <th class="menu_name" id="menu_home"><a href="#">ABOUT</a></th>
                </tr>
              </table>
            </div>
            <div class="menu2" style="height: 50px;">
              <table class="nav_table">
                <tr>
                  <th class="menu_name" id="menu_top"><a href="prod_member_TopList?cat_key=1">TOP</a></th>
                </tr>
                <tr><td style="height: 10px;"></td></tr>
                <tr>
                  <td class="s_top"><a href="prod_member_TopList?cat_key=11">티셔츠</a></td>
                </tr>
                <tr>
                  <td class="s_top"><a href="prod_member_TopList?cat_key=12">맨투맨</a></td>
                </tr>
                <tr>
                  <td class="s_top"><a href="prod_member_TopList?cat_key=13">후드</a></td>
                </tr>
              </table>
            </div>
            <div class="menu3" style="height: 50px;">
              <table class="nav_table">
                <tr>
                  <th class="menu_name" id="menu_bottom"><a href="prod_member_TopList?cat_key=2">BOTTOM</a></th>
                </tr>
                <tr><td style="height: 10px; padding: 0;"></td></tr>
                <tr>
                  <td class="s_bottom"><a href="prod_member_TopList?cat_key=21">슬렉스</a></td>
                </tr>
                <tr>
                  <td class="s_bottom"><a href="prod_member_TopList?cat_key=22">청바지</a></td>
                </tr>
                <tr>
                  <td class="s_bottom"><a href="prod_member_TopList?cat_key=23">반바지</a></td>
                </tr>
              </table>
            </div>
            <div class="menu4" style="height: 50px;">
              <table class="nav_table">
                <tr>
                  <th class="menu_name" id="menu_shoes"><a href="prod_member_TopList?cat_key=3">OUTER</a></th>
                </tr>
                <tr><td style="height: 10px; padding: 0;"></td></tr>
                <tr>
                  <td class="s_shoes"><a href="prod_member_TopList?cat_key=31">가디건</a></td>
                </tr>
                <tr>
                  <td class="s_shoes"><a href="prod_member_TopList?cat_key=32">코트</a></td>
                </tr>
              </table>
            </div>
            <div class="menu5" style="height: 50px;">
              <table class="nav_table">
                <tr>
                  <th class="menu_name" id="menu_comm"><a href="#">COMMUNITY</a></th>
                </tr>
                <tr><td style="height: 10px; padding: 0;"></td></tr>
                <tr>
                  <td class="s_comm"><a href="notice_list">NOTICE</a></td>
                </tr>
                <tr>
                  <td class="s_comm"><a href="qna_list">QnA</a></td>
                </tr>
                <tr>
                  <td class="s_comm"><a href="review_list">ReView</a></td>
                </tr>
              </table>
            </div>
          </div>
          <div class="search_div">
            <form action="prod_member_search">
               <input type="text" name="keyword" placeholder="상품명" class="keywordinput">
            <button type="submit">검색</button>
            </form>
          </div>
        </nav>
</body>
</html>