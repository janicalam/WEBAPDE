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
 * Servlet implementation class ToStudentEditCourseList
 */
@WebServlet("/ToStudentEditCourseList")
public class ToStudentEditCourseList extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ToStudentEditCourseList()
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
		Profile p = (Profile) request.getSession().getAttribute("profile");// sessionScope.profile;
		ArrayList<Course> c = new Manager().getAllCourseStudent(p.getIdNo());

		request.getSession().setAttribute("course", c);

		request.getRequestDispatcher("StudentEditCourseList.jsp").forward(
				request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
	}

}
