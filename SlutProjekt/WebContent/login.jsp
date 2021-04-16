<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="model.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<title>Home Page</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Home Page</title>

<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

<!-- Custom styles for this template -->
<link href="css/signin.css" rel="stylesheet">

</head>

<%!UserBean bean;%>
<body class="text-center" onload="checkTheme()"> 
<%
  
  // Check to see if the session has a user bean.
  if(session.getAttribute("user") == null){
	
	// if there is no user, go to the logout servlet
	RequestDispatcher rd = request.getRequestDispatcher("LogoutController");
	rd.forward(request, response);
	
	
  } else {
	// if user exist unpack bean and view profile page
	UserBean bean = (UserBean) request.getAttribute("user");
	
	//System.out.println("session finns"); 
  
	
	  	//add feed by sending to FeedController if posts i null
		if(request.getAttribute("posts") == null){ //
			//System.out.println("jag är null");
			
			RequestDispatcher rd1 = request.getRequestDispatcher("FeedController"); //skickas till GET vid manuellt försök!
			rd1.forward(request, response);	
		}
	%>
	
	<div class="container">
	
	<%
	
	//if time add profile pic for each user
	//out.print("<div class=\"profile-container\"><img src=\"img/penguin.png\" width=\"25\" height=\"25\"class=\"profile\">");
	out.print("<h3 class=\"profile\" id=\"userName\">" +bean.getFirstName() + " " + bean.getLastName() + "</h3></div>");%>
	
	<div class="theme">
	    <div>
		  <input class="form-check-input" type="radio" name="flexRadioDefault" id="spring"
		  onclick ="themeChoice()">
		  <label class="form-check-label" for="flexRadioDefault1">
		    Spring Theme
		  </label>
		</div>
		<div>
		  <input class="form-check-input" type="radio" name="flexRadioDefault" id="fall" 
		  onclick ="themeChoice()">
		  <label class="form-check-label" for="flexRadioDefault2" >
		    Fall Theme
		  </label>
		</div>
	</div><br>
	<!-- Form for new post -->
	<main class="form-signin">
	<div>
		<form action="<%= request.getContextPath() %>/FeedController" method="GET">
		
			<!--Hidden field to pass userName to FeedController along with post-->
	    	<input type="hidden" name="userName" value="<%=bean.getFirstName()%>"> 
	    	
	    	<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="newPost" 
	    	placeholder="Enter your very important opinion here and don't forget the #ashTags" required></textarea>
			<br>
			<button class="w-50 btn btn-lg btn-secondary" type="submit">Post</button>
			<!-- Change to icon? -->

		</form></div></main>
		
		<!-- feed div -->
		<div id="feed">
		
		<%@include file="feed.jsp"%>
		
		<!-- <jsp:include page="feed.jsp"/> vid en statisk fil men annars bättre med include file-->
		</div>
		
		<!-- searchbox for hashtags -->
		<div class="row justify-content-center" id="child-container">
              <div class="col-12 col-md-10 col-lg-8" id="inner-div">
                  <form class="card card-sm">
                      <div class="card-body row no-gutters align-items-center">
                          
                          <div class="col">
                              <input class="form-control form-control-lg form-control-borderless" id="searchBox" type="search" placeholder="Search by #tags...">
                          </div>
                          <div class="col-auto">
                              <i class="fas fa-search h4 text-body" onclick ="searchTag()"></i>
                          </div> 
                      </div>
                  </form>
              </div>
               
           </div> 
		
  <%
  }
%>

<!-- sign out button, send to LogoutController -->
	<main class="form-signin" onload="getTheme()">
		<form action="<%=request.getContextPath()%>/LogoutController" method="post"> 
	   		<button class="w-50 btn btn-lg btn-secondary" type="submit">Sign Out</button> 
		</form>
	</main>
	<jsp:include page="footer.jsp"/>
</div>

</body>

<!-- JS functions and playhouse -->
<script type="text/javascript">

//change background-color and set cookies
function themeChoice(){
	let user = document.getElementById("userName").innerHTML;
	let fName = user.split(" ")[0];
	
	let spring = document.getElementById("spring").checked;
	let fall = document.getElementById("fall").checked;
	if(spring){ //and a check to see Yes/No on cookies
		
		document.cookie =fName+"=spring"; //saves fName with whitespace in beginning of string?? why...
		getTheme("spring");
		
	}else{
		document.cookie =fName+"=fall";
		getTheme("fall");
		
	}
};
//check if there are cookies with matched userName with saved theme - onload
function checkTheme(){
	console.log("test");
	let cookieJar = document.cookie;
	let answer ="Yes";
	
	let user = document.getElementById("userName").innerHTML;
	let fName = " " + user.split(" ")[0];
	let userTheme = "";
	
	if(cookieJar.length > 2){
		let cookieList = cookieJar.split(";");
		console.log(cookieList);
		//check choice
		for (var i=0; i<cookieList.length;i++){
			//if Yes -> get user Theme choice. If No -> cookies still saved but not used...
			if (cookieList[i].split("=")[0] === "choice" && cookieList[i].split("=")[1] === answer){
				for (var i=0; i<cookieList.length;i++){
					console.log(cookieList[i].split("=")[0]);
					if(cookieList[i].split("=")[0] === fName){
						
						userTheme = cookieList[i].split("=")[1];
						console.log(userTheme);
						getTheme(userTheme);
					}
			    }
			}else{
				//not working at the moment
				document.cookie = fName + "= ; expires = Thu, 01 Jan 1970 00:00:00 UTF";
			}
		}
	}
		
};
//sets new color
 function getTheme(userTheme){
	 console.log(userTheme);
	 if(userTheme === "spring"){
		 document.body.style.backgroundColor =" #aedfb6";
		 //cannnot access elements in different file...
		 //document.getElementById("feed").childNodes.style.backgroundColor="##d3ecd7";
	 }else{
	 	document.body.style.backgroundColor =" #e8a740";
	 }
};


 function searchTag(){
	let isPresent = false;
	let tags = document.getElementById("searchBox").value;
	console.log(tags);
	
	//om inget skrivs i input
	if(tags == ""){
		//console.log("nothing entered");
		
		let alertDiv = document.createElement("div");
		alertDiv.setAttribute("class", "alert alert-warning");
		alertDiv.setAttribute("role", "alert");
		alertDiv.setAttribute("id", "alertDiv");
		alertDiv.textContent = "Oops! Nothing was entered";
		
		document.getElementById("child-container").appendChild(alertDiv);
		
	}
	else{
		let tagValue = "#" + tags;
		console.log(tagValue);
		//hide all cards != tagValue
		let posts = document.getElementsByClassName("tag");
		
		for(var i=0; i<posts.length;i++){
			//console.log(posts[i].innerHTML);
			if(posts[i].innerHTML.includes(tagValue)){ //posts[i].innerHTML != tagValue
				isPresent = true;
				continue;
				//posts[i].parentNode.style.display="none";
				
			} else{
				posts[i].parentNode.style.display="none";
			}
		}
		createBtn();
		
		if(isPresent === false){
			console.log("No post was found");
			let alertDiv2 = document.createElement("div");
			alertDiv2.setAttribute("class", "alert alert-warning");
			alertDiv2.setAttribute("role", "alert");
			alertDiv2.setAttribute("id", "alertDiv2");
			alertDiv2.textContent = "No post was found";
			
			document.getElementById("child-container").appendChild(alertDiv2);
		}
			
	}
 };
 
 function createBtn(){
	 let reloadBtn = document.createElement ("button");
		reloadBtn.setAttribute("type", "button");
		reloadBtn.setAttribute("id", "closeBtn");
		reloadBtn.setAttribute("class", "btn-close");
		reloadBtn.setAttribute("aria-label", "Close");
		reloadBtn.setAttribute("onclick", "reloadPage()");
		document.getElementById("inner-div").appendChild(reloadBtn);
	 
 };
 
 function reloadPage(){ 
	 
	 let posts = document.getElementsByClassName("tag");
		
		for(var i=0; i<posts.length;i++){
			//console.log(posts[i].innerHTML);
			if(posts[i].parentNode.style.display == "none"){
				posts[i].parentNode.style.display="block";
				
			}
		}
		document.getElementById("closeBtn").style.display="none";
		document.getElementById("alertDiv2").style.display="none";
		document.getElementById("alertDiv").style.display="none";
	 
 };
  

</script>

</html>

