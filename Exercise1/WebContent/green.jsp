<jsp:include page="Header.jsp"/>

<h2 style="color:green;">You picked green!</h2>

<% 
String fName= request.getParameter("fName");
String eName = request.getParameter("eName");
out.print("Hello " + fName.toUpperCase() + " " + eName);

%>

<jsp:include page="Footer.jsp"/>
</html>