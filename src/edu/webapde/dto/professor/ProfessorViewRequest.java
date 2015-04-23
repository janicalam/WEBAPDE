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
@WebServlet(urlPatterns =
{ "/ProfessorViewRequest", "ApproveRequest", "DenyRequest" })
public class ProfessorViewRequest extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProfessorViewRequest()
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

		case "ApproveRequest":
			ArrayList<Request> r1 = (ArrayList<Request>) request.getSession()
					.getAttribute("viewrequestlist");
			index = Integer.parseInt(request.getParameter("index"));
			// new Manager().approveRequest(r1.get(index).getCourse(),
			// r1.get(index).getStudentID(), r1.get(index).getFromTime(),
			// r1.get(index).getToTime());
			break;
		case "DenyRequest":
			ArrayList<Request> r2 = (ArrayList<Request>) request.getSession()
					.getAttribute("viewrequestlist");
			index = Integer.parseInt(request.getParameter("index"));
			// new Manager().denyRequest(r2.get(index).getCourse(),
			// r2.get(index).getStudentID(), r2.get(index).getFromTime(),
			// r2.get(index).getToTime());
			break;

		case "/ProfessorViewRequest":
			String coursecode = request.getParameter("coursecode");
			String student = request.getParameter("student");
			String status = request.getParameter("status");

			ArrayList<Request> r = new Manager().getAllProfRequest(p.getIdNo(),
					student, coursecode, status);
			request.getSession().setAttribute("viewrequestlist", r);

			request.getRequestDispatcher("ProfessorViewRequests.jsp").forward(
					request, response);
		}
	}

}
