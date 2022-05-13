<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guest.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="guest" class="guest.Guest" scope="page"/>
<jsp:setProperty name="guest" property="guestNum"/>
<jsp:setProperty name="guest" property="guestTitle"/>
<jsp:setProperty name="guest" property="guestContent"/>
<jsp:setProperty name="guest" property="guestPass"/>
<!DocTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기록중입니다..!(제발 바카라 광고글 그만 ㅜㅜ)</title>
</head>
<body>
	<%
	if(guest.getguestPass() == null || guest.getguestTitle() == null || guest.getguestContent() == null){
	//db접근 금지
	%>
		<script>
			alert('모든내용은 반드시 입력바랍니다.');
			history.back();
		</script>
	<%
	}else{	
			//db접근 허용
			guest.GuestDAO guestDAO = new guest.GuestDAO();
			int result = guestDAO.guestWrite(guest.getguestTitle(),guest.getguestContent(),guest.getguestPass());
			if(result==1){
	%>
		<script>
		alert('기록완료');
		location.href='./guestbook.jsp';
		</script>
	<%
		}else if(result== -1){
	%>
		<script>
		alert('오류');
		location.href='./guestbook.jsp';
		</script>
	<%
		}
	}
	%>
</body>
</html>











