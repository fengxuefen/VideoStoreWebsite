package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.MovieDAO;
import db.MovieVO;

/**
 * Servlet implementation class TitleMovieSearchSerclet
 */
public class TitleMovieSearchSerclet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TitleMovieSearchSerclet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title=request.getParameter("title");
		String year="";
		String director="";
		String fname="";
		String lname="";		
		String order="t_asc";
		String page="1";
		int pageNow = Integer.parseInt(page);
		
		String s_ipp="5";
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
			if(al.size()==0){
				request.getRequestDispatcher("nomovie.jsp").forward(request,
						response);
			}else
			request.getRequestDispatcher("showmovie.jsp").forward(request,
					response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

}
