<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to BlankBook</title>


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

 
<title>Welcome to BlankBook</title>

<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/signin.css" rel="stylesheet">


</head>

<%
// check if session has user
if (session.getAttribute("user") != null) {
	// if true, send to login
	//System.out.println("kollar session från index"); 
	RequestDispatcher rd = request.getRequestDispatcher("LoginController");
	rd.forward(request, response); // Get

}

%>
  <body class="text-center" onload="checkIfCookiePresent()">
  <div class="alert alert-info" role="alert" id="cookieAlert">Save my cookies
  <button type="submit"class="mdc-button" onclick="removeAlert(event)">No</button>
  <button type="submit"class="mdc-button" onclick="removeAlert(event)">Yes</button>
  
  </div>
    
<main class="form-signin">
  <form action="<%=request.getContextPath()%>/LoginController" method="post">
    
    <h1 class="font-weight-bold">BlankBook</h1>

    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" name="userName" placeholder="User Name" required>
      <label for="floatingInput">User Name</label>
    </div><br>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password" required>
      <label for="floatingPassword">Password</label>
    </div>
    
    <button class="w-50 btn btn-lg btn-secondary" type="submit">Sign in</button>
   
    <jsp:include page="footer.jsp"/>
  </form>
</main>
</body>

<script type="text/javascript">

//set cookie and remove alert question
function removeAlert(event){
	
	let choice = event.target;
	console.log(choice.innerHTML);
	 var alert = document.getElementById("cookieAlert");
	 alert.style.display = "none";
	 document.cookie = "choice=" + choice.innerHTML; //use in login to check if ok to save theme or not  
};

function checkIfCookiePresent(){
	let cookieJar = document.cookie;
	//check choice
	if(cookieJar.length > 2){
		let cookieList = cookieJar.split(";");
		console.log(cookieList);
		for (var i=0; i<cookieList.length;i++){
			if (cookieList[i].split("=")[0] === "choice"){
				var alert = document.getElementById("cookieAlert");
				alert.style.display = "none";
			}else{
				removeAlert();
			}
		}
	}
	
};
</script>

</html>


