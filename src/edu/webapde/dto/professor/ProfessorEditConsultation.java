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
import edu.webapde.managers.Manager;

/**
 * Servlet implementation class ProfessorEditConsultation
 */
@WebServlet("/ProfessorEditConsultation")
public class ProfessorEditConsultation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfessorEditConsultation() {
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
		String section = request.getParameter("section");
		String day = request.getParameter("day");
		String fromTime = request.getParameter("fromTime");
		String toTime = request.getParameter("toTime");
		Profile p = (Profile) request.getSession().getAttribute("profile");
		
		new Manager().addProfCourse(p.getIdNo(), coursecode, section, day, fromTime, toTime);
		
		ArrayList<Course> c = new Manager().getAllProfessorCourses(p.getIdNo());
		request.getSession().setAttribute("courselist", c);

		request.getRequestDispatcher("ProfessorEditConsultation.jsp").forward(request, response);
	}

}
