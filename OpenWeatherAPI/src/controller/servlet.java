package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.GettheWeather;
import model.weatherBean;

/**
 * Servlet implementation class OWservlet
 */
@WebServlet("/servlet")
public class servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
			
			String cityStr = request.getParameter("city");
			String countryStr = request.getParameter("country");
			String saveCookies = request.getParameter("userCookie"); //from hidden input. Value n or y
			
			System.out.println(saveCookies);
			
			HttpSession session= request.getSession();
			session.setAttribute("userID", "test");
			
			//create bean
			weatherBean wBean = new weatherBean(cityStr, countryStr);
	
			GettheWeather.getWeather(wBean);
	
			request.setAttribute("wBean", wBean);
			
			
			//create cookies if(saveCookies...)-->
			if(saveCookies.equals("n")) {
				GettheWeather.getWeather(wBean);
				request.setAttribute("wBean", wBean);
					
				RequestDispatcher rd = request.getRequestDispatcher("showWeather.jsp");
				rd.forward(request, response);
				
			}else {
				Cookie cookieCity = new Cookie("city", wBean.getCityStr()); //2 strängar, namn och innehåll
				Cookie cookieCode = new Cookie("code", wBean.getCountryStr());
				
				
				cookieCity.setMaxAge(60*60);
				cookieCode.setMaxAge(60*60);
						
				
				response.addCookie(cookieCity); //svar till klienten, sker innan redirect
				request.setAttribute("city", cookieCity);
					
				response.addCookie(cookieCode); 
				request.setAttribute("code", cookieCode);
				
				
				GettheWeather.getWeather(wBean);
				request.setAttribute("wBean", wBean);
					
				RequestDispatcher rd = request.getRequestDispatcher("showWeather.jsp");
				rd.forward(request, response);
			}
			
				
			
			/*
			Bonus: ej anropa API:et, kolla om det finns cookie (inte för gamla) och visa samma info
			*/
				
				
		}
			

	

}
