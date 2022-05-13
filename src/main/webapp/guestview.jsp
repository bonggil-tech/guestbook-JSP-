<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guest.*" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
	<%
		PrintWriter script=response.getWriter();
		int guestNum = Integer.parseInt(request.getParameter("guestNum"));
		if(guestNum == 0){
			script.println("<script>");
			script.println("alert('잘못된 접근입니다.')");
			script.println("location.href='./index.jsp'");
			script.println("</script>");
		}
		Guest guest = new GuestDAO().getguest(guestNum); 
		
	%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=guest.getguestTitle() %></title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/default.css">
    <link rel="stylesheet" href="./css/guestview.css">
</head>
<body>
	<section class="sec01">
        <div class="wrap">
            <div class="view_tit">
                <span class="view_num"><%= guest.getguestNum() %></span>     
                <h1 class="tit"><a href="./guestbook.jsp">GuestBook</a></h1>      
            </div>
            <div class="sub_tit">
                <div class="view view_title">
                    <span><%= guest.getguestTitle() %></span>            
                </div>
                <div class="view view_txt">
                    <textarea cols="30" rows="30" placeholder="내용" readonly><%= guest.getguestContent() %></textarea>            
                </div>
            </div>
        </div>
        <form style="width: 80%;margin: 0 auto;" class="relative" action="./deleteAction.jsp?guestNum=<%=guestNum%>" method="post">
            <div class="delete_box">
                <label>
                	<input class="hidden" type="text" name="guestNum" id="guestNum" value="<%=guest.getguestNum() %>">
                    <input class="delete_txt" placeholder="삭제비밀번호 입력해주세요" type="password" name="guestPass" id="guestPass">
                    <button class="write_save" type="submit">삭제</button>
                </label>
            </div>
	        <div class="btn_box">
	            <a href="./guestbook.jsp" class="btn_write">목록</a>
	        </div>
        </form> 
    </section>
    
</body>
</html>