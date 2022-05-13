<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="guest.*" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>


<jsp:useBean id="guest" class="guest.Guest" scope="page" />
<jsp:setProperty name="guest" property="guestNum" />
<jsp:setProperty name="guest" property="guestPass" />

<!DocTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제중입니다..</title>
</head>
<body>
	<%
	PrintWriter script = response.getWriter();
		
	if(guest.getguestNum() == 0 || guest.getguestPass() == null){
		script.println("<script>");
		script.println("alert('아이디와 패스워드를 확인하세요')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		GuestDAO guestDAO = new GuestDAO();
		
		int result = guestDAO.delete2(guest.getguestNum(),guest.getguestPass());
		script.println("<script>");
		  
		if(result == 1){
			//삭제동작
			guestDAO.delete(guest.getguestNum(),guest.getguestPass());
			session.setAttribute("guestNum",guest.getguestNum());
			script.println("alert('삭제성공')");
			script.println("location.href='./guestbook.jsp'");
		}else if(result == -1) {
			script.println("alert('패스워드를 확인하세요')");
			script.println("history.back()");
		}else if(result == -3){	
			script.println("alert('데이터베이스 오류')");
			script.println("history.back()");
		}
		
		script.println("</script>");
	}
%>
	
</body>
</html>


