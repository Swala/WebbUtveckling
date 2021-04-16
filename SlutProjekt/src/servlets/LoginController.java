package servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserBean;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//response.setContentType("text/html");
		//PrintWriter out = response.getWriter();
		//out.print("Hej servlet");
		
		String login = "login";
		
		// Check if user in session and handle any wrongly attempts to access without login in
			if (request.getSession().getAttribute("user") != null) {
				// get the user out of session 
				UserBean bean = (UserBean) request.getSession().getAttribute("user");

				// Validate username and password again  
				if (bean.validate(bean, login)) {
						
					// get session and request to go to login page 
					HttpSession session = request.getSession();
					session.setAttribute("user", bean);
					request.setAttribute("user", bean);

					//System.out.println("sending to login page");
					RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
					rd.forward(request, response);
					
					
					} else {
						// this only happens if the sessionid is removed, manually or because it timed out and you try to go directly to the "login.jsp"
						// goto logoutController to clean up
					
						RequestDispatcher rd = request.getRequestDispatcher("LogoutController");
						rd.forward(request, response);
						
					}
				} else {
					// this should only happen if you try to goto "/login" manually 
					response.sendRedirect("index.jsp");
				}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
			//params to be used depending on which DB we need connect to
			String login = "login";
		
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");

			// Set values to user bean
			UserBean bean = new UserBean();
			bean.setUserName(userName);
			bean.setPassword(password);
			
			//System.out.println(bean.getUserName()); 

			// Check if the email and pass is correct
			if (bean.validate(bean, login)) {
				
				HttpSession session = request.getSession();
				
				session.setAttribute("user", bean);
				request.setAttribute("user", bean);
				
				// RequestDispatcher for when we want to send the request to the new page
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);

				//System.out.println("Successfully signed in");

			} else { //if login-value is incorrect, send to error and start again
				// go to an error page that includes the index page to have the user try again
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
				rd.forward(request, response);
			}
		}
	}


