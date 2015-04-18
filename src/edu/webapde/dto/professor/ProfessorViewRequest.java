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
 * Servlet implementation class ProfessorViewRequest
 */
@WebServlet("/ProfessorViewRequest")
public class ProfessorViewRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfessorViewRequest() {
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
		String coursecode = request.getParameter("coursecode");
		String student = request.getParameter("student");
		String status = request.getParameter("status");
		
		Profile p = (Profile)request.getSession().getAttribute("profile");
		ArrayList<Request> r = new Manager().getAllProfRequest(p.getIdNo(), student, coursecode, status);
		request.getSession().setAttribute("viewrequestlist", r);
		
		request.getRequestDispatcher("ProfessorViewRequests.jsp").forward(request, response);
	}

}
