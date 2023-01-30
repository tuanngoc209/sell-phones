package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Account;

/**
 * Servlet implementation class LoginController
 */
//@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		try {
			request.getSession(true).invalidate(); // bỏ đi session cũ
			// make sure that email is valid
			String regexMailString = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
			String regex = "[a-zA-Z0-9_!@#$%T^&*]+";

			// colect data from a login form
			String user = request.getParameter("username");
			String password = request.getParameter("password");

			Account acc = new Account();
			acc.setName(user);
			acc.setPwd(password);

			HttpSession session = request.getSession(true);
			if (!password.matches(regex) || !user.matches(regexMailString)) {
				session.setAttribute("error", "invalid syntax");
				response.sendRedirect("login.jsp");
			}
			
			//nút nhớ
			if (request.getParameter("remember")!=null) {
				Cookie cookie=new Cookie("username", user);
				cookie.setMaxAge(300);
				response.addCookie(cookie);
			}

			// read information of account in web.xml
			String uid = getServletContext().getInitParameter("username");
			String pwd = getServletContext().getInitParameter("password");

			// check account - use validate code in assignment 1 to valid user
			if (user != null && acc.getPwd().equals(pwd) && acc.getName().equalsIgnoreCase(uid)) {
				// set session
				session.setAttribute("user", user);
				// login is valid, now redirect to index page of main
				response.sendRedirect("admin/index.jsp");
			} else {
				session.setAttribute("error", "wrong username of password");
				response.sendRedirect("login.jsp");
			}

		} catch (NullPointerException e) {
			// TODO: handle exception
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} catch (Exception ex) {
			response.getWriter().println(ex);
			ex.printStackTrace();
		}
	}

}
