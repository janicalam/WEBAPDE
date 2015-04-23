package edu.webapde.dto.student;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import edu.webapde.dto.course.Course;
import edu.webapde.dto.profile.Profile;

/**
 * Servlet implementation class RequestConsultationServlet
 */
@WebServlet(urlPatterns =
{ "/RequestConsultationServlet", "/gotoSched" })
public class RequestConsultationServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RequestConsultationServlet()
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

		case "/gotoSched":
			index = Integer.parseInt(request.getParameter("index"));
			ArrayList<Course> enrolled = (ArrayList<Course>) request
					.getSession().getAttribute("course");
			response.getWriter().write(enrolled.get(index).getProfessorLast() + enrolled.get(index).getProfessorFirst());
			break;
		}
		request.getRequestDispatcher("StudentRequestConsultation.jsp").forward(
				request, response);
	}

}
