<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form</title>
</head>
<body>
<jsp:include page="Header.jsp"/>

<p>Form</p>

<form action= "secondPage.jsp" target=_blank>
<label>First name</label><input type=text name="fName" required><p></p>

<label>Last name</label><input type = text name="eName" required><p></p>

<label>Your age</label><input type=text name="age" required><p></p>

<label>Pick a color</label><select name="color">
<option value="red">Red</option>
<option value="green">Green</option>
<option value="blue">Blue</option>
</select>

<input type=submit value="Send">

</form>

<jsp:include page="Footer.jsp"/>

</body>
</html>