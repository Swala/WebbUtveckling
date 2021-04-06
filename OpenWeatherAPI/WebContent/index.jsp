<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
<script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

 
<link href="style.css" rel="stylesheet">


<title>Open Weather</title>
</head>
<body>
<% //ett försök till att bara visa GDPR-frågan en gång...vet ej vad jag ska jämföra med

//System.out.println(session.getAttribute("userID"));

if(session.getAttribute("userID") == null){ 	//när/var skapas session?
	System.out.println(session.getAttribute("session"));
	
	out.print("<div class=\"alert alert-info\" role=\"alert\" id=\"cookieAlert\">Save my cookies");
	out.print("<button type=\"submit\"class=\"mdc-button\" onclick=\"removeAlert()\"><span class=\"mdc-button__ripple\"></span>No Way</button>");
	out.print("<button type=\"submit\"class=\"mdc-button\" onclick=\"addCookie()\"><span class=\"mdc-button__ripple\"></span>Yes, please</button></div>");
			
}

%>

<!-- 
<div class="alert alert-info" role="alert" id="cookieAlert">Save my cookies
  <button type="submit"class="mdc-button" onclick="removeAlert()"><span class="mdc-button__ripple"></span>No Way</button>
  <button type="submit"class="mdc-button" onclick="addCookie()"><span class="mdc-button__ripple"></span>Yes, please</button> 
</div>

--> 

<div id="indexDiv">
	 <h2 id="title">Weather App</h2>
	 <form action="servlet" method="get" id="weatherForm">  
	    <input type="text" name="city" placeholder="City" id="city" required/><br><br>
	    <input type="text" name="country" placeholder="Country Code" id="code" required/><br><br>  
	    <input id="hiddenInput" name="userCookie" type="hidden" value ="y"> 
	    
	    <button type="submit"class="mdc-button"><span class="mdc-button__ripple"></span>Go!</button><br> 
	
		<button type="submit"class="mdc-button" onclick="getCookie()" id="noCookie">  
		<span class="mdc-button__ripple" ></span>See previous search</button>
	
	</form>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

</body>

<script type="text/javascript">
 function getCookie(){
	
	let cookieJar = document.cookie;
	let cList = cookieJar.split(";");
	//console.log(cookieJar);
	//console.log(cList);
	
	let cCity = cList[0].split("=")[1];
	console.log(cCity);
	
	let cCode = cList[1].split("=")[1];
	console.log(cCode);
	
	document.getElementById("city").value=cCity;
	document.getElementById("code").value=cCode;
	
	document.getElementById("weatherForm").submit();
 };
 
 function removeAlert (){
	 var alert = document.getElementById("cookieAlert");
	 alert.style.display = "none";
	 var searchButton = document.getElementById("noCookie");
	 searchButton.style.display = "none";
	 
	 let input = document.getElementById ("hiddenInput");
	 input.value ="n";
	 	 
 };
 
 function addCookie(){
	 var alert = document.getElementById("cookieAlert");
	 alert.style.display = "none";
	 
 };
 

</script>
 
</html>


<!--  test/old code
<form action="CookieServlet" method="get">
<input type="submit" value="See my previous search"/> <br><br>

<input type="submit" value="Send"/> <br><br> 

<script>
 window.onload = function(){
	 if (document.cookie() >1){
		console.log(document.cookie().length);
	</script>
	<div class="alert alert-info" role="alert" id="cookieAlert">Save my cookies
	  <button type="submit"class="mdc-button" onclick="removeAlert()"><span class="mdc-button__ripple"></span>No Way</button>
	  <button type="submit"class="mdc-button" onclick="addCookie()"><span class="mdc-button__ripple"></span>Yes, please</button> 
	</div>
	<script>
	 }
}
</script> 


 function showCity(){
	 console.log("hej");
	 let allCookies= document.cookie;
	 let cList = allCookies.split(";");
	 
	 for(let i= 0; i<cList.length;i++){
		 console.log(cList[i]);
		 
		 if(cList[i].split("=") === "city"{
			 console.log(cList[i].split("=")[1]);
		 }
		 //document.getElementById("city").value=cCity;
	 }
 };
-->
