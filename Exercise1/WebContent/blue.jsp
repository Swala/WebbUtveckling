<jsp:include page="Header.jsp"/>

<h2 style="color:blue;">You picked blue!</h2>

<% 
String fName= request.getParameter("fName");
String eName = request.getParameter("eName");
String age = request.getParameter("age");
out.print("Hello " + fName.toUpperCase() + " " + eName);
%>
<br>
<%="Your age: " + age %>

<jsp:include page="Footer.jsp"/>
</html>