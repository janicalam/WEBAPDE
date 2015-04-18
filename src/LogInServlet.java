import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.webapde.dto.course.Course;
import edu.webapde.dto.profile.Profile;
import edu.webapde.dto.profile.Request;
import edu.webapde.managers.Manager;

/**
 * Servlet implementation class LogInServlet
 */
@WebServlet("/LogInServlet")
public class LogInServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LogInServlet()
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

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		if (session != null)
		{
			session.invalidate();
		}
		int idnum = Integer.parseInt(request.getParameter("idnum"));
		String password = request.getParameter("password");
		if (new Manager().getProfile(idnum, password) != null)
		{
			Profile p = new Manager().getProfile(idnum, password);
			request.getSession().setAttribute("profile", p);
			if (p.getType().equals("Student"))
			{
				ArrayList<Course> c = new Manager().getAllStudentCourses(p
						.getIdNo());
				request.getSession().setAttribute("course", c);

				ArrayList<Course> cl = new Manager().getCourseList();
				request.getSession().setAttribute("courselist", cl);

				ArrayList<Request> notif = new Manager().getAllStudentNotif(p
						.getIdNo());
				request.getSession().setAttribute("notif", notif);

				request.getRequestDispatcher("StudentHome.jsp").forward(
						request, response);

			} else
			{
				ArrayList<Request> notif = new Manager().getAllProfNotif(p
						.getIdNo());
				request.getSession().setAttribute("notif", notif);

				request.getRequestDispatcher("ProfessorHome.jsp").forward(
						request, response);
			}
		} else
		{
			request.getRequestDispatcher("StartServlet").forward(request,
					response);
		}
	}

}
