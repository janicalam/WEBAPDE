package edu.webapde.dto.professor;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.webapde.dto.profile.Profile;
import edu.webapde.dto.profile.Request;
import edu.webapde.managers.Manager;

/**
 * Servlet implementation class ToProfessorChangePassword
 */
@WebServlet("/ToProfessorChangePassword")
public class ToProfessorChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToProfessorChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Profile p = (Profile) request.getSession().getAttribute("profile");
		ArrayList<Request> notif = new Manager().getAllProfNotif(p.getIdNo());
		request.getSession().setAttribute("notif", notif);
		request.getRequestDispatcher("ProfessorChangePassword.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
