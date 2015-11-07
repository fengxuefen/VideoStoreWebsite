<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import= "db.MovieVO"  %>
<%@page import= "db.StarVO"  %>
<%
	MovieVO mvo=(MovieVO)request.getAttribute("movieInfo");
	String mvPhoURL=mvo.getBannerUrl();
	if(mvPhoURL.equals("")){
		mvPhoURL="img/noAvailable.png";
	}
 %>
 <%
String email = (String)request.getSession().getAttribute("email");
if(email == null || email == "")
{
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Fabflix > Movie Details</title>

    <!-- Bootstrap  CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!--  custom CSS here -->
    <link href="css/style.css" rel="stylesheet">
    <style type="text/css">
    .table-hover tbody tr td, .table-hover tbody tr th, .table-hover thead tr th {
    border: none;
}
    </style>
	<script src="js/jquery-1.10.2.js"></script>
	<script type="text/javascript">
	function addmovie(movieid){
		if (window.XMLHttpRequest)
	      {// code for IE7+, Firefox, Chrome, Opera, Safari
	      xmlhttp=new XMLHttpRequest();
	      }
	    else
	      {// code for IE6, IE5
	      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	      }
	    xmlhttp.onreadystatechange=function()
	    {
	    if (xmlhttp.readyState==4 && xmlhttp.status==200)
	      {
	      }
	    }
	    var queryString = "ShoppingProServlet?type=addMovies&moviesId=" + movieid;
		xmlhttp.open("POST",queryString,true);
    	xmlhttp.send();
	}
	</script>
</head>

<body> 
=&quot;<jsp:include page="header.jsp"></jsp:include>     
    <!--Products Section -->
<div class="container" style="width:800px">
<br/>

<h1>Movie Details</h1>

<hr size="1" color="#999999">
<div class="media" style="height:180px;vertical-align:middle;display: table-cell;">
   <a class="pull-left" href="#">
      <img class="media-object" src="<%=mvPhoURL %>" 
      alt="Media Object" style="margin-left:100px;margin-top:80px;height: 150px;width:100px;">
   </a>
   <div class="media-body" style="margin-left:280px;">
      <h4 class="media-heading"><strong><%=mvo.getTitle() %></strong></h4>
      <br/>
      <table class="table table-hover" width="350" border="0">
  <tr>
    <td width="83"><b>Year:</b></td>
    <td width="15">&nbsp;</td>
    <td width="230"><%=mvo.getYear() %></td>
  </tr>
  <tr>
    <td><b>Director:</b></td>
    <td>&nbsp;</td>
    <td><%=mvo.getDirector() %></td>
  </tr>
  <tr>
    <td><b>Movie ID:</b></td>
    <td>&nbsp;</td>
    <td><%=mvo.getId() %></td>
  </tr>
  <tr>
    <td><b>Stars:</b></td>
    <td>&nbsp;</td>
    	<td width="302">
   	<%
   		ArrayList<StarVO> svo=mvo.getStars();
   		
   		for(int j=0;j<svo.size();++j){
   			StarVO s=svo.get(j);
   			if(j!=svo.size()-1){
   			%>
   			<a href="GetStar?starid=<%=s.getId() %>"><%=s.getFirstname()+" "+s.getLastname() %></a>, 
   		
   		<%
   			}else{
   			%>
   			<a href="GetStar?starid=<%=s.getId() %>"><%=s.getFirstname()+" "+s.getLastname() %></a>
   		
   		<%
   			}
   			
   			}
   				
   	 %>  	
   	</td>
  </tr>
  <tr>
    <td><b>Genre:</b></td>
    <td>&nbsp;</td>
    <td><%=mvo.getGenres() %></td>
  </tr>
  <tr>
    <td><b>Trailer:</b></td>
    <td>&nbsp;</td>
    <%
    if(mvo.getTrailerUrl().equals("")){
    %>
    <td>No movie trailer here.</td>
    <%
    }else{
    %>
    <td>Click <a href="<%=mvo.getTrailerUrl() %>">here</a> to watch the movie trailer</td>
    <%
    }
     %>
    
  </tr>
  <tr>
    <td><b>Price</b></td>
    <td>&nbsp;</td>
    <td>$15.99</td>
  </tr>
</table>
      <br/>
      <br/>
      <a href="javascript:addmovie(<%=mvo.getId() %>)" class="btn btn-primary" role="button">Add to Cart</a>
   </div>
</div>

<hr size="1" color="#999999">
<nav>
  <ul class="pager">
    <li class="previous"><a href="Javascript:window.history.go(-1)"><span aria-hidden="true">&larr;</span>Back to Previous Page</a></li>
  </ul>
</nav>
   <!--End Products Section -->
<jsp:include page="tailer.jsp"></jsp:include>
    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/my.js"></script>

</body>

</html>
