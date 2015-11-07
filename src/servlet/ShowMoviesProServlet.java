package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.MovieDAO;
import db.MovieVO;

public class ShowMoviesProServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ShowMoviesProServlet() {
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
		String method=request.getParameter("by");
		String arg=request.getParameter("arg");
		String order=request.getParameter("order");
		String page=request.getParameter("page");
		int pageNow = Integer.parseInt(page);
		
		String s_ipp=request.getParameter("ipp");
		int ipp=Integer.parseInt(s_ipp);
		
		MovieDAO mdao=new MovieDAO();
			
			ArrayList<MovieVO> al= mdao.getMovieByPage(ipp, pageNow, order, arg, method);
			int pageCount=mdao.getPageCount(arg,ipp,method);
			request.setAttribute("movieList", al);
			
			request.setAttribute("pageCount", pageCount + "");
		
			request.setAttribute("pageNow", page);
			request.setAttribute("by", method);
			request.setAttribute("arg", arg);
			request.setAttribute("order", order);
			request.setAttribute("ipp", s_ipp);
			request.getRequestDispatcher("showmovie.jsp").forward(request,
					response);
			
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
