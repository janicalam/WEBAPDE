package edu.webapde.dto.student;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.webapde.dto.profile.Profile;
import edu.webapde.managers.Manager;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePasswordServlet()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		String pass = request.getParameter("pass");
		String newpass = request.getParameter("newpass");
		String confirmnewpass = request.getParameter("confirmnewpass");
		Profile p = (Profile) request.getSession().getAttribute("profile");
		/*
		 * response.setContentType("text/html;charset=UTF-8"); PrintWriter out =
		 * response.getWriter();
		 * 
		 * try{ out.println("<!DOCTYPE html>"); out.println("<html>");
		 * out.println("<head>"); out.println("</head>"); out.println("<body>");
		 * out.println("<h1>" + pass + "</h1>"); out.println("</body>");
		 * out.println("</html>"); }finally{ out.close(); }
		 */

		if (pass.equals(p.getPassword()))
		{
			if (newpass.equals(confirmnewpass))
			{
				new Manager().changePassword(p.getIdNo(), confirmnewpass);
			}
		}
		request.getRequestDispatcher("StudentHome.jsp").forward(request,
				response);
	}

}
