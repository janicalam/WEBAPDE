package edu.webapde.dto.student;

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
 * Servlet implementation class StudentViewRequest
 */
@WebServlet("/StudentViewRequest")
public class StudentViewRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentViewRequest() {
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
		String professor = request.getParameter("professor");
		String status = request.getParameter("status");
		
		Profile p = (Profile) request.getSession().getAttribute("profile");
		ArrayList<Request> r = new Manager().getAllStudentRequest(p.getIdNo(), professor,coursecode, status );
		request.getSession().setAttribute("requestlist", r);
		
		request.getRequestDispatcher("StudentViewRequest.jsp").forward(request, response);
	}

}
