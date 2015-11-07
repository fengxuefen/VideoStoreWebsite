package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.w3c.dom.DOMException;



import db.MovieDAO;
import db.MovieVO;

/**
 * Servlet implementation class SearchServlet
 */
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String searchval = request.getParameter("searchval");
		//String searchtype = request.getParameter("searchval");
//		String CONTENT_TYPE = "text/xml; charset=gb2312";
//		response.setContentType(CONTENT_TYPE);
//		PrintWriter out = response.getWriter();
//		MovieDAO mDao = new MovieDAO();
//		String movielist = "";
//		try {
//			movielist = mDao.search(request);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} 
//		out.write(movielist);
//		out.close();
		String title=request.getParameter("title");
		String year=request.getParameter("year");
		String director=request.getParameter("director");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");		
		String order=request.getParameter("order");
		String page=request.getParameter("page");
		int pageNow = Integer.parseInt(page);
		
		String s_ipp=request.getParameter("ipp");
		int ipp=Integer.parseInt(s_ipp);
		
		MovieDAO mdao=new MovieDAO();
			
			ArrayList<MovieVO> al= mdao.getMovieByPage(ipp, pageNow, order, title, year, director, fname, lname);
			int pageCount=mdao.getPageCount(ipp,title,year,director,fname,lname);
			request.setAttribute("movieList", al);	
			request.setAttribute("pageCount", pageCount + "");	
			request.setAttribute("pageNow", page);
			request.setAttribute("by", "search");
			request.setAttribute("title", title);
			request.setAttribute("year", year);
			request.setAttribute("director", director);
			request.setAttribute("fname", fname);
			request.setAttribute("lname", lname);			
			request.setAttribute("order", order);
			request.setAttribute("ipp", s_ipp);
			if(al.size()==0)
				request.getRequestDispatcher("nomovie.jsp").forward(request, response);
			else
				request.getRequestDispatcher("showmovie.jsp").forward(request,
					response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
