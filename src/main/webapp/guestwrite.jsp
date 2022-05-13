<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guest.*" %>  
<% request.setCharacterEncoding("utf-8"); %>  
<!DocTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 글작성</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/default.css">
    <link rel="stylesheet" href="./css/guestview.css">

	<%
	guest.GuestDAO guestDAO = new guest.GuestDAO();
			int result = guestDAO.nextguestNum();
	%>
</head>
<body>
    <section class="sec01">
        <div class="view_tit">
            <h1 class="tit"><a href="./guestbook.jsp">Write</a></h1>      
        </div>
        <form class="relative" action="./WriteAction.jsp" method="post">
            <div class="sub_tit">
                <div class="view view_title">
                    <label>
                        <textarea name="guestTitle" id="guestTitle" cols="200" rows="2" placeholder="제목"></textarea>
                    </label>
                </div>
                <div class="view view_txt">
                    <label>
                        <textarea name="guestContent" id="guestContent" cols="30" rows="30" placeholder="내용"></textarea>
                    </label>
                </div>
                <div class="delete_save">
                    <label>
                        <input type="password" name="guestPass" id="guestPass"class="delete_save" placeholder="삭제시 사용할 비밀번호">
                    </label>
                    <button class="btn_save" type="submit">저장</button>
                </div>
            </div>
        </form> 
    </section>
</body>
</html>