<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guest.*" %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DocTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>방명록 방문해주셔서 감사합니다.</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/default.css">
    <link rel="stylesheet" href="./css/guestbook.css">
    <style>
        
    </style>
</head>
<body>
    
    <section class="sec01">
        <div class="wrap">
            <header class="header">
                <h1 class="tit">Guest Book</h1>   
                <div style="padding: 20px;" class="sub_tit">
                    <div class="num">방문번호</div>
                    <div class="date">작성날짜</div>
                    <div class="title">제목</div>
                    <div class="txt">내용</div>
                </div>
            </header>
                <%
                    GuestDAO guestDAO = new GuestDAO();
                    ArrayList<Guest> list = guestDAO.getguestbook();
                    for(int idx=0;idx<list.size();idx++){
                %>
                
                <div class="content">
                    <span class="num"><%= list.get(idx).getguestNum() %></span>
                    <span class="date"><%= list.get(idx).getguestDate() %></span>
                    <span class="title" title="<%= list.get(idx).getguestTitle() %>"><a href="./guestview.jsp?guestNum=<%= list.get(idx).getguestNum() %>"><%= list.get(idx).getguestTitle() %></a></span>
                    <span class="txt"><a href="./guestview.jsp?guestNum=<%= list.get(idx).getguestNum() %>"><%= list.get(idx).getguestContent() %></a></span>
                </div>
                
                <%
                    }
                %>
                <div class="btn_box">
                    <div>
                        <a href="./guestwrite.jsp" class="btn_write">글 작성</a>
                    </div>
                </div>
            </div>
    </section>
</body>
</html>