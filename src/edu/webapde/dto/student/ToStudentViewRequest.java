package edu.webapde.dto.student;


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
 * Servlet implementation class ToStudentViewRequest
 */
@WebServlet("/ToStudentViewRequest")
public class ToStudentViewRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToStudentViewRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.removeAttribute("requestlist");
		Profile p = (Profile) request.getSession().getAttribute("profile");
		ArrayList<Request> r = new Manager().getAllStudentRequest(p.getIdNo(), "All", "All", "All" );
		request.getSession().setAttribute("requestlist", r);

		ArrayList<Course> c = new Manager().getAllStudentCourses(p.getIdNo());
		request.getSession().setAttribute("enrolledCourses", c);
		
		ArrayList<String> prof = new Manager().getAllProfOfStudent(p.getIdNo());
		request.getSession().setAttribute("professors", prof);
		
		request.getRequestDispatcher("StudentViewRequest.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
