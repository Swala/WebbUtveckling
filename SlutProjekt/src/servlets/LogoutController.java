package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserBean;

/**
 * Servlet implementation class LogoutController
 */
@WebServlet("/LogoutController")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// Check if there is an user in session
		if (request.getSession().getAttribute("user") != null) {

			// Get the session
			HttpSession session = request.getSession();

			// get the user data
			UserBean bean = (UserBean) session.getAttribute("user");
			// and clear it
			bean.resetUserBean();

			// remove the user
			session.removeAttribute("user");
			// turn off the session
			session.invalidate();
			// goto index
			response.sendRedirect("index.jsp");
			
			//System.out.println("Succesfully signed out");

		}else {
			// this should only happen if you try to goto "/Logout" manually 
			response.sendRedirect("index.jsp");
				
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
