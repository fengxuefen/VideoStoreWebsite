<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="db.MovieVO"%>
<%@page import="db.StarVO"%> 
<%@page import="db.GenreVO"%>  
<%
String email = (String)request.getSession().getAttribute("email");
if(email == null || email == "")
{
	response.sendRedirect("login.jsp");
}
%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<MovieVO> al=(ArrayList<MovieVO>)request.getAttribute("movieList");
String s_pageNow = (String) request.getAttribute("pageNow");
int pageNow = Integer.parseInt(s_pageNow);
String s_pageCount = (String) request.getAttribute("pageCount");
int pageCount = Integer.parseInt(s_pageCount);
////
String method=(String)request.getAttribute("by");
String arg="";
String title="";
String year="";
String director="";
String fname="";
String lname="";
if(method.equals("search")){
	title=(String)request.getAttribute("title");
	year=(String)request.getAttribute("year");
	director=(String)request.getAttribute("director");
	fname=(String)request.getAttribute("fname");
	lname=(String)request.getAttribute("lname");
}else{
	arg=(String)request.getAttribute("arg");
}
String order=(String)request.getAttribute("order");
String ipp=(String)request.getAttribute("ipp");
String newOrder,newOrder2;
if(order.equals("t_asc")){
	newOrder="t_desc";
}else{
	newOrder="t_asc";
}
if(order.equals("y_asc")){
	newOrder2="y_desc";
}else{
	newOrder2="y_asc";
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Fabflix > Movie List</title>

    <!-- Bootstrap  CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!--  custom CSS here -->
    <link href="css/style.css" rel="stylesheet">
     <link rel="stylesheet" href="css/jquery-ui.css">
    <style type="text/css">
    .table-hover tbody tr td, .table-hover tbody tr th, .table-hover thead tr th {
    border: none;
}
.hide-me{
	display: none;    
}
.ui-tooltip {
    max-width: 800px;
  }
    </style>
    
     
	<script src="js/jquery-1.10.2.js"></script>
	 <script src="js/jquery-ui.js"></script>
	<script type="text/javascript">
	$(function() {
		    $( ".aclass" ).tooltip({
		    	items: "img, [data-geo], [title]",
		      content: function() {
		        var element = $( this );
		        var text = element.text();
		        var banner_url = element.attr("banner_url");
		        var trailer_url = element.attr("trailer_url");
		        return "<div>"  + text + "<br/><br/><br/> trailer_url = "+ trailer_url + 
		        "<br/><br/><br/> banner_url = "+ banner_url + "</div>";
		      }
		    });
		  });
	function show(){
		$('#alert_recover_ok').css('visibility','visible').fadeIn();
		$('#alert_recover_ok').show()
	}
	function hide(){
		$('#alert_recover_ok').css('visibility','hidden');
	}
	
	var showtype = "<%=method %>";
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
	$(document).ready(function(){
		$("#dropdownpagesize").parents('.btn-group').find('.dropdown-toggle').html('Items per Page: '+<%=ipp %>+' <span class="caret"></span>');
	$(".dropdown-menu li a").click(function(){
  		var selText = $(this).text();
  		var queryString;
  		if(showtype == 'search')
  			queryString = "MovieSearchServlet?by=<%=method %>&title=<%=title %>&director=<%=director %>&fname=<%=fname %>&lname=<%=lname %>&year=<%=year %>&order=<%=order %>&page=<%=pageNow %>&ipp="+selText;
  		else
  			queryString = "ShowMoviesProServlet?by=<%=method %>&arg=<%=arg %>&order=<%=order %>&page=<%=pageNow %>&ipp="+selText;
  		window.location.href = queryString;
	});	
	});
	</script>
</head>


<body>
<% 
/*	String u = (String) session.getAttribute(&amp;quot;myName&amp;quot;); 
	if (u == null) { 
		response.sendRedirect(&amp;quot;login.jsp?err=1&amp;quot;); 
		return; 
	} 
*/ 
%>
<jsp:include page="header.jsp"></jsp:include>     
    <!--Products Section -->
<div class="container" style="width:800px">
<br/>



<h1>Search Results</h1>
<div align="right">
<%	
if(method.equals("search")){
%>
<a href="MovieSearchServlet?by=search&title=<%=title %>&director=<%=director %>&fname=<%=fname %>&lname=<%=lname %>&year=<%=year %>&page=<%=s_pageNow %>&ipp=<%=ipp %>&order=<%=newOrder %>">
<%
}else{
%>
<a href="ShowMoviesProServlet?by=<%=method %>&arg=<%=arg %>&order=<%=newOrder %>&page=<%=s_pageNow %>&ipp=<%=ipp %>">
<%
}
 %>

      <span class="glyphicon glyphicon-sort"></span> Sort by Title
</a>
&nbsp;&nbsp;
<%	
if(method.equals("search")){
%>
<a href="MovieSearchServlet?by=search&title=<%=title %>&director=<%=director %>&fname=<%=fname %>&lname=<%=lname %>&year=<%=year %>&page=<%=s_pageNow %>&ipp=<%=ipp %>&order=<%=newOrder2 %>">
<%
}else{
%>
<a href="ShowMoviesProServlet?by=<%=method %>&arg=<%=arg %>&order=<%=newOrder2 %>&page=<%=s_pageNow %>&ipp=<%=ipp %>">
<%
}
 %>
      <span class="glyphicon glyphicon-sort"></span> Sort by Year
</a>
</div>

<%
for(int i=0;i<al.size();++i){
	MovieVO mvo=(MovieVO)al.get(i);
	String mvPhoURL=mvo.getBannerUrl();
	if(mvPhoURL.equals("")){
		mvPhoURL="img/noAvailable.png";
	}
%>
	<hr size="1" color="#999999">
<div class="media" style="height:180px;vertical-align:middle;display: table-cell;">
   <a class="pull-left" href="#">
      <img class="media-object" src=<%=mvPhoURL %>
      alt="Media Object" style="margin-left:100px;margin-top:60px;height: 200px;width:150px">
   </a>
   <div class="media-body" style="margin-left:320px;">
      <h4 class="media-heading"><strong><a href="GetMovie?movieid=<%=mvo.getId() %>" class="aclass" data-geo=""  trailer_url="<%=mvo.getTrailerUrl() %>" banner_url="<%=mvo.getBannerUrl() %>"><%=mvo.getTitle() %></a></strong></h4>
      <br/>
      <table class="table table-hover" width="400" border="0">
  <tr>
    <td width="83"><b>Year:</b></td>
    <td width="15">&nbsp;</td>
    <td width="302"><%=mvo.getYear() %></td>
  </tr>
  <tr>
    <td width="83"><b>Director:</b></td>
    <td width="15">&nbsp;</td>
    <td width="302"><%=mvo.getDirector() %></td>
  </tr>
  <tr>
    <td><b>Movie ID:</b></td>
    <td>&nbsp;</td>
    <td><%=mvo.getId() %></td>
  </tr>
  <tr>
    <td width="83"><b>Stars:</b></td>
    <td width="15">&nbsp;</td>
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
    <td>
    <%
    	
   		ArrayList<GenreVO> gvo=mvo.getGenres();

   		for(int j=0;j<gvo.size();++j){
   			GenreVO g=gvo.get(j);
   			if(j!=gvo.size()-1){
   			%>
   			<%=g.getName() %>, 
   		
   		<%
   			}else{
   			%>
   			<%=g.getName() %>
   		
   		<%
   			}
   			
   			}
   				
   	 %>  	
    </td>
  </tr>
  <tr>
    <td><b>Price</b></td>
    <td>&nbsp;</td>
    <td>$15.99</td>
  </tr>
</table>
  
      <a href="javascript:addmovie(<%=mvo.getId() %>)" class="btn btn-primary" role="button" onclick="javascript:show()">Add to Cart</a> 
   </div>
</div>
<%
}
 %>


<hr size="1" color="#999999">

<nav>
  <ul class="pager">
    <%
    
    	if(pageNow!=1){
    	
    		if(method.equals("search")){
    		
    		%>
    			 <li ><a href="MovieSearchServlet?by=<%=method %>&title=<%=title %>&director=<%=director %>&fname=<%=fname %>&lname=<%=lname %>&year=<%=year %>&order=<%=order %>&page=<%=pageNow-1 %>&ipp=<%=ipp %>">Previous</a></li>
    		<%
    		   		}else{
    			%>
    	 <li ><a href="ShowMoviesProServlet?by=<%=method %>&arg=<%=arg %>&order=<%=order %>&page=<%=pageNow-1 %>&ipp=<%=ipp %>">Previous</a></li>
    	<%
    		}
    	
    	}   
     %>
   	 <%
    	if(pageNow!=pageCount){
    		if(method.equals("search")){
    		%>
    			 <li ><a href="MovieSearchServlet?by=<%=method %>&title=<%=title %>&director=<%=director %>&fname=<%=fname %>&lname=<%=lname %>&year=<%=year %>&order=<%=order %>&page=<%=pageNow+1 %>&ipp=<%=ipp %>">Next</a></li>
    		<%
    		}else{
    	%>
    	 <li><a href="ShowMoviesProServlet?by=<%=method %>&arg=<%=arg %>&order=<%=order %>&page=<%=pageNow+1 %>&ipp=<%=ipp %>">&nbsp;&nbsp;&nbsp;Next&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
    	<%
    		}  
    	} 
     %>
    
  </ul>
</nav>
<div class="btn-group">
      <a id="dropdownpagesize" class="btn dropdown-toggle btn-select" data-toggle="dropdown" href="#"><span class="caret"></span></a>
      
      <ul class="dropdown-menu">
        <li><a href="#">5</a></li>
        <li><a href="#">10</a></li>
        <li><a href="#">20</a></li>
      </ul>
    </div>

</div>
<div id="alert_recover_ok" class="alert alert-success hide-me" style="width: 350px;position: fixed;left: 50%;
    top: 50%;;text-align:center;z-index: 100; margin-top: -50px;  margin-left: -200px;">
    <a href="javascript:hide()" class="close" onclick="$('#alert_recover_ok').hide();">&times;</a>
    <strong>Success!</strong> Movie has been added successfully.
</div>
   <!--End Products Section -->
<jsp:include page="tailer.jsp"></jsp:include>
    <!-- JavaScript -->
    <script src="js/my.js"></script>

</body>

</html>
