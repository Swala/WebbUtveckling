<jsp:include page="Header.jsp"/>

<h2 style="color:red;">You picked red!</h2>

<% 
//String fName= request.getParameter("fName");
//String eName = request.getParameter("eName");
out.print("Hello " + request.getParameter("fname") + " " + request.getParameter("ename"));

%>

<jsp:include page="Footer.jsp"/>
</html>