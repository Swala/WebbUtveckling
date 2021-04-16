
<div>

<%@page import ="java.util.ArrayList"%>
<%@page import="model.PostContent"%>

<%
// check if session has user

/*
if (session.getAttribute("user") == null) {
	// if true, send to login
	RequestDispatcher rd = request.getRequestDispatcher("LogoutController");
	rd.forward(request, response); // Get

}
if(request.getAttribute("posts") == null){
	System.out.println("jag är null inne från feed.jsp");
	
	RequestDispatcher rd = request.getRequestDispatcher("FeedController");
	rd.forward(request, response);	
	
}

*/

	
	//<!-- feed page, get posts from DB. For-loop to print out -->
	
	%>

	<h5>Feed</h5>
	
	<% //System.out.println("nu är jag i feed.jsp");
	
	ArrayList <PostContent> postList = (ArrayList <PostContent>) request.getAttribute("posts"); //request blr fel vid bugtestning
	//System.out.println(postList.size());
	
	//for each post entry, print out content in card
	for (PostContent p : postList){
		out.print("<div class=\"card\" style=\"width: 18rem;\"><div class=\"card-body\"> <h5 class=\"card-title\">" 
		+ p.getName() + " posted</h5>" 
		+ "<h6 class=\"card-subtitle mb-2 text-muted\">" + p.getDate() + "</h6>" 
		+ "<p class=\"card-text\">" + p.getContent()  + "</p>"
		+ "<p class=\"card-text tag\">" + p.getTag() + "</p></div></div>");
	}
	
	
	%>
	
	</div>


<%

%>
