<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.weatherBean"%>
<%@page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>

<link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
<script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">


 <link href="style.css" rel="stylesheet">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>The Weather</title>
</head>
<body>


<%!weatherBean wBean;

%>

<%
wBean = (weatherBean) request.getAttribute("wBean");
//out.print("<p>The weather in " + wBean.getCityStr() + " is now " + wBean.getCloudsStr() + "</p>");

%>

<div id="viewDiv">
	<h2>Weather App</h2>
	<div id="innerDiv" class="mdc-card mdc-card--outlined">
	  <!-- ... content ... -->
	  
	  <h2><%out.print(wBean.getCityStr().toUpperCase());%></h2>
	  <p><%out.print(LocalDate.now()); %></p>
	  
	  <h6>The weather is now <%out.print(wBean.getCloudsStr());%></h6>
	  <h6>Temperature: <%out.print(wBean.getTemp());%><h6>
	   
	  <form action="index.jsp" method="get">  
	   	<button type="submit"class="mdc-button"><span class="mdc-button__ripple"></span>Back to Start</button>
	  </form> 
	</div>
</div> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

</body>
</html>

