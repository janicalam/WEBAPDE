package edu.webapde.dto.professor;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.webapde.dto.course.Course;
import edu.webapde.dto.profile.Profile;
import edu.webapde.dto.profile.Request;
import edu.webapde.managers.Manager;

/**
 * Servlet implementation class ToProfessorViewRequest
 */
@WebServlet("/ToProfessorViewRequest")
public class ToProfessorViewRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToProfessorViewRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.removeAttribute("requestlist");
		Profile p = (Profile)request.getSession().getAttribute("profile");
		ArrayList<Request> r = new Manager().getAllProfRequest(p.getIdNo(), "All", "All", "All");
		request.getSession().setAttribute("viewrequestlist", r);
		
		ArrayList<String> s = new Manager().getAllStudentOfProf(p.getIdNo());
		request.getSession().setAttribute("students", s);
		
		ArrayList<Course> c = new Manager().getAllProfessorCourses(p.getIdNo());
		request.getSession().setAttribute("courses", c);
		
		request.getRequestDispatcher("ProfessorViewRequests.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
