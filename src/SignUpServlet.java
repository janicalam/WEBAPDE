


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.webapde.dto.profile.Profile;
import edu.webapde.managers.Manager;


/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*int diameter = Integer.parseInt(request.getParameter("diameter"));
		int crustthickness = Integer.parseInt(request.getParameter("crustthickness"));
		String sauce = request.getParameter("sauce");
		String restaurant = request.getParameter("restaurant");
		boolean hasCheese = Boolean.parseBoolean(request.getParameter("hasCheese"));
		boolean hasBacon = Boolean.parseBoolean(request.getParameter("hasBacon"));
		
		Pizza p = new Pizza(diameter, hasBacon, 
							hasCheese, sauce, 
							crustthickness, restaurant);
		new PizzaManager().addPizza(p);
		
		request.getRequestDispatcher("FirstServlet").forward(request, response);*/
		
		request.getRequestDispatcher("LogInServlet").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String email = request.getParameter("email");
		String cemail = request.getParameter("cemail");
		String password = request.getParameter("password");
		String cpassword = request.getParameter("cpassword");
		if(email.equals(cemail) && password.equals(cpassword))
		{
			int idnum = Integer.parseInt(request.getParameter("idnum"));
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String type = request.getParameter("type");
			Profile p = new Profile(idnum,password,email,fname,lname,type);
			new Manager().addAccount(p);
		}
		
		request.getRequestDispatcher("LogIn.jsp").forward(request, response);
	}

}
