<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="c">
<title>Second Page</title>
</head>
<body>
<jsp:include page="Header.jsp"/>

 <% //ta emot datan från form.jsp och skickar vidare beroende på val av färg
 String color = request.getParameter("color");
 String fName= request.getParameter("fName");
 String eName = request.getParameter("eName");
 String age = request.getParameter("age");
 
//globala variablar på denna filen?
%>

<%

switch(color){
	case "blue": 
		%><jsp:forward page="blue.jsp">
			<jsp:param name="fname" value="<%=fName %>"/>
			<jsp:param name="ename" value="<%=eName %>"/>
			<jsp:param name="age" value="<%=age %>"/>
		</jsp:forward>	
		<%
		break;
	case "red":
		%><jsp:forward page="red.jsp">
			<jsp:param name="fname" value="<%=fName %>"/>
			<jsp:param name="ename" value="<%=eName %>"/>
		</jsp:forward>
		<%
		break;
	case "green":
		%><jsp:forward page="green.jsp">
			<jsp:param name="fname" value="<%=fName %>"/>
			<jsp:param name="ename" value="<%=eName %>"/>
		</jsp:forward>
		<%
		break;
}
%>


<jsp:include page="Footer.jsp"/>
</body>
</html>