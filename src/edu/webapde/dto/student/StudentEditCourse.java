package edu.webapde.dto.student;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import edu.webapde.dto.course.Course;
import edu.webapde.dto.profile.Profile;
import edu.webapde.managers.Manager;

/**
 * Servlet implementation class StudentEditCourse
 */
@WebServlet(urlPatterns =
{ "/StudentEditCourse", "/AddCourse", "/DropCourse" })
public class StudentEditCourse extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudentEditCourse()
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
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		process(request, response);
	}

	protected void process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		int index;
		Profile p = (Profile) request.getSession().getAttribute("profile");
		switch (request.getServletPath())
		{

		case "/StudentEditCourse":
			String course = request.getParameter("course");
			String section = request.getParameter("section");

			ArrayList<Course> c; // = new ArrayList();
			if (course.equalsIgnoreCase("All")
					&& section.equalsIgnoreCase("All"))
			{
				c = new Manager().getCourseList();
			} else if (section.equalsIgnoreCase("All"))
			{
				c = new Manager().getCourseListByCourse(course);

			} else if (course.equalsIgnoreCase("All"))
			{
				c = new Manager().getCourseListBySection(section);
			} else
			{
				c = new Manager().getCourseList(course, section);
			}
			request.getSession().setAttribute("courselist", c);
			break;
		case "/AddCourse":
			ArrayList<Course> cl = (ArrayList<Course>) request.getSession()
					.getAttribute("courselist");
			index = Integer.parseInt(request.getParameter("index"));
			new Manager().addStudentCourse(p.getIdNo(), cl.get(index)
					.getCourseCode(), cl.get(index).getSection());
			break;
		case "/DropCourse":
			ArrayList<Course> enrolled = (ArrayList<Course>) request
					.getSession().getAttribute("enrolledCourses");
			index = Integer.parseInt(request.getParameter("index"));
			new Manager().dropCourse(p.getIdNo(), enrolled.get(index)
					.getCourseCode(), enrolled.get(index).getSection());
			break;
		}

		ArrayList<Course> c = new Manager().getAllStudentCourses(p.getIdNo());
		request.getSession().setAttribute("enrolledCourses", c);

		request.getRequestDispatcher("StudentEditCourseList.jsp").forward(
				request, response);

	}
}
