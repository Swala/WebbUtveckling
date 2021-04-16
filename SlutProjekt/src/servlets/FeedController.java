package servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PostContent;
import model.SQLconn;
import model.UserBean;


/**
 * Servlet implementation class FeedController
 */
@WebServlet("/FeedController")
public class FeedController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String post = "post";
		String newPost = request.getParameter("newPost");
		String userName = request.getParameter("userName");
		
		if(newPost == null) {
			doPost(request,response);
			
		}else {
			
			//TODO create postBean and put this if-statement there
			
		if(newPost != null ) {
			String tags = "";
			String finalPost="";
		
			if(newPost.contains("#")) {
				System.out.println("hashtag present");
				String split = "#";
				
				tags = newPost.substring(newPost.indexOf(split));
				finalPost = newPost.substring(0, newPost.indexOf(split));
				
				//System.out.println(newPost);
				//System.out.println(finalPost);
				//System.out.println(tags);
				
			}else {
				finalPost=newPost;
				
			}
			
			if (SQLconn.connectSQL(post)) { 
				SQLconn.insertPostSQL(finalPost, tags, userName);
				
				doPost(request,response);
				
			}
		}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String post = "post";
		
		//System.out.println("in feedcontroller now");
		
		ArrayList <PostContent> postList = new ArrayList <PostContent> ();
		
		//call sql method to check all post in DB
		//create new objects for all post and add to postList-array
		
		if (SQLconn.connectSQL(post)) { 
			postList = SQLconn.getPostSQL();
			
    	}
		if(postList !=null) {
			
			HttpSession session = request.getSession();
			UserBean bean = (UserBean) request.getSession().getAttribute("user");
			session.setAttribute("user", bean);
			
			request.setAttribute("user", bean);
			request.setAttribute("posts", postList);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		
	}

}
