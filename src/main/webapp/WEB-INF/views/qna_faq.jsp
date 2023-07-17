<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
      integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
      crossorigin="anonymous"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>

    <title>FAQ</title>
    <style>
          @import url('https://fonts.googleapis.com/css?family=Muli&display=swap');
        * {
        box-sizing: border-box;
        }

        body {
         font-family: 'Times New Roman', Times, serif;
 		 background-color:#FFFAFA;
        }

        h1 {
        margin: 50px 0 30px;
        text-align: center;
        }

        .faq-container {
        max-width: 600px;
        margin: 0 auto;
        }

        .faq {
        background-color: transparent;
        border: 1px solid #9fa4a8;
        border-radius: 10px;
        margin: 20px 0;
        padding: 30px;
        position: relative;
        overflow: hidden;
        transition: 0.3s ease;
        }

        .faq.active {
        background-color: #fff;
        box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1), 0 3px 6px rgba(0, 0, 0, 0.1);
        }

        .faq.active::before,
        .faq.active::after {
        content: '\f075';
        font-family: 'Font Awesome 5 Free';
        color: #2ecc71;
        font-size: 7rem;
        position: absolute;
        opacity: 0.2;
        top: 20px;
        left: 20px;
        z-index: 0;
        }

        .faq.active::before {
        color: #3498db;
        top: -10px;
        left: -30px;
        transform: rotateY(180deg);
        }

        .faq-title {
        margin: 0 35px 0 0;
        }

        .faq-text {
        display: none;
        margin: 30px 0 0;
        }

        .faq.active .faq-text {
        display: block;
        }

        .faq-toggle {
        background-color: transparent;
        border: 0;
        border-radius: 50%;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 16px;
        padding: 0;
        position: absolute;
        top: 30px;
        right: 30px;
        height: 30px;
        width: 30px;
        }

        .faq-toggle:focus {
        outline: 0;
        }

        .faq-toggle .fa-times {
        display: none;
        }

        .faq.active .faq-toggle .fa-times {
        color: #fff;
        display: block;
        }

        .faq.active .faq-toggle .fa-chevron-down {
        display: none;
        }

        .faq.active .faq-toggle {
        background-color: #9fa4a8;
        }
        </style>
  </head>
  <body>
    <h1>자주 묻는 질문</h1>
    <div class="faq-container">
      <div class="faq">
        <h3 class="faq-title">자주 묻는 질문 1</h3>

        <p class="faq-text">대답 1</p>

        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
      </div>
      <div class="faq">
        <h3 class="faq-title">자주 묻는 질문 2</h3>

        <p class="faq-text">대답 2</p>

        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
      </div>
      <div class="faq">
        <h3 class="faq-title">자주 묻는 질문 3</h3>

        <p class="faq-text">대답 3</p>

        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
      </div>
      <div class="faq">
        <h3 class="faq-title">자주 묻는 질문 4</h3>

        <p class="faq-text">대답 4</p>

        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
      </div>
    </div>
    <script src="resources/js/script.js"></script>
  </body>
</html>