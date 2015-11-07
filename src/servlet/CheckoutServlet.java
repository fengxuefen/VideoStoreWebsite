package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.CreditcardDAO;
import db.CustomerDAO;

public class CheckoutServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CheckoutServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cardnum = request.getParameter("cardnum");
		String expDate = request.getParameter("expDate");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		CreditcardDAO cDao=new CreditcardDAO();
		try {
			boolean judge = cDao.checkValidation(cardnum, fname, lname, expDate);
			//boolean judge=false;
			if(judge){
				request.setAttribute("status", "ok");
				request.getRequestDispatcher("confirmation.jsp").forward(request, response);
			}
			else{
				request.setAttribute("status", "fail");
				request.getRequestDispatcher("checkout.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
