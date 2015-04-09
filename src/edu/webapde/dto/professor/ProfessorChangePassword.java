package edu.webapde.dto.professor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.webapde.dto.profile.Profile;
import edu.webapde.managers.Manager;

/**
 * Servlet implementation class ProfessorChangePassword
 */
@WebServlet("/ProfessorChangePassword")
public class ProfessorChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfessorChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pass = request.getParameter("pass");
		String newpass = request.getParameter("newpass");
		String confirmnewpass = request.getParameter("confirmnewpass");
		Profile p = (Profile) request.getSession().getAttribute("profile");
		

		if (pass.equals(p.getPassword()))
		{
			if (newpass.equals(confirmnewpass))
			{
				new Manager().changePassword(p.getIdNo(), confirmnewpass);
			}
		}
		request.getRequestDispatcher("ProfessorHome.jsp").forward(request,
				response);
	}


}
