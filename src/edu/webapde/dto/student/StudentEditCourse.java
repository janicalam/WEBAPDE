package edu.webapde.dto.student;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.webapde.dto.course.Course;
import edu.webapde.managers.Manager;

/**
 * Servlet implementation class StudentEditCourse
 */
@WebServlet("/StudentEditCourse")
public class StudentEditCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentEditCourse() {
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
		String course = request.getParameter("course");
		String section = request.getParameter("section");
		
		ArrayList<Course> c; //= new ArrayList();
		if(course.equalsIgnoreCase("all") && section.equalsIgnoreCase("all"))
		{
			c = new Manager().getCourseList();
		} 
		else if(section.equalsIgnoreCase("all"))
		{
			c = new Manager().getCourseListByCourse(course);
			
		}
		else if (course.equalsIgnoreCase("all"))
		{
			c = new Manager().getCourseListBySection(section);
		}
		else
		{
			c = new Manager().getCourseList(course, section);
		}
		request.getSession().setAttribute("courselist", c);
		request.getRequestDispatcher("StudentEditCourseList.jsp").forward(request, response);
	}

}
