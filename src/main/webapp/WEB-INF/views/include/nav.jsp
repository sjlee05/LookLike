<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
    <script src="${pageContext.request.contextPath}/resources/js/nav.js"></script>
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
          <div class="menu_list">
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
                  <th class="menu_name" id="menu_top"><a href="prod_member_TopList">TOP</a></th>
                </tr>
                <tr><td style="height: 10px;"></td></tr>
                <tr>
                  <td class="s_top"><a href="prod_member_TopList?cat_key=11">티셔츠</a></td>
                </tr>
                <tr>
                  <td class="s_top"><a href="prod_member_TopList?cat_key=12">맨투맨</a></td>
                </tr>
                <tr>
                  <td class="s_top"><a href="prod_member_TopList">후드</a></td>
                </tr>
              </table>
            </div>
           	  <div class="menu3" style="height: 50px;">
              <table class="nav_table">
                <tr>
                  <th class="menu_name" id="menu_bottom"><a href="prod_member_BottomsList">BOTTOM</a></th>
                </tr>
                <tr><td style="height: 10px; padding: 0;"></td></tr>
                <tr>
                  <td class="s_bottom"><a href="prod_member_BottomsList">슬렉스</a></td>
                </tr>
                <tr>
                  <td class="s_bottom"><a href="prod_member_BottomsList">청바지</a></td>
                </tr>
                <tr>
                  <td class="s_bottom"><a href="prod_member_BottomsList">반바지</a></td>
                </tr>
              </table>
            </div>
            <div class="menu4" style="height: 50px;">
              <table class="nav_table">
                <tr>
                  <th class="menu_name" id="menu_shoes"><a href="prod_member_shoeseList">SHOES</a></th>
                </tr>
                <tr><td style="height: 10px; padding: 0;"></td></tr>
                <tr>
                  <td class="s_shoes"><a href="prod_member_shoeseList">운동화</a></td>
                </tr>
                <tr>
                  <td class="s_shoes"><a href="prod_member_shoeseList">구두</a></td>
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
                <tr>
                  <td class="s_comm"><a href="#">1:1 문의</a></td>
                </tr>
              </table>
            </div>
          </div>
          <div class="search_div">
          <form action="prod_member_search">
            	<input type="text" name="keyword" placeholder="상품명">
				<input type="submit" value="검색">
            </form>
          </div>
        </nav>
</body>
</html>