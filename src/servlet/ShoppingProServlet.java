package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.MyCartDAO;

public class ShoppingProServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ShoppingProServlet() {
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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String type = request.getParameter("type");
		MyCartDAO mcd = (MyCartDAO) request.getSession().getAttribute("myCart");
		if (mcd == null) {
			mcd = new MyCartDAO();
			request.getSession().setAttribute("myCart", mcd);
		}
		if (type.equals("checkout")) {
			request.getRequestDispatcher("checkout.jsp").forward(request,
					response);
		} else {
			if (type.equals("addMovies")) {
				String goodsId = request.getParameter("moviesId");
				mcd.addMovies(goodsId, "1");
			} else if (type.equals("delMovies")) {
				String moviesId = request.getParameter("moviesId");
				mcd.delMovies(moviesId);

			} else if (type.equals("show")) {
				// do nothing
			} else if (type.equals("delAll")) {
				mcd.clear();
			} else if (type.equals("updateMovies")) {
				String moviesId = request.getParameter("moviesId");
				String newNum = request.getParameter("newNum");
				mcd.updatemovies(moviesId, newNum);
			}
			ArrayList al = mcd.showMyCart();
			request.getSession().setAttribute("myCart", mcd);
			request.getSession().setAttribute("myCartInfo", al);
			System.out.println("shoppingproservletinfor==="+al.size());
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
