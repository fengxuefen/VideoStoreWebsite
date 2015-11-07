<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="db.StarVO" %>
<%@page import="db.MovieVO" %>
<%
 	StarVO svo=(StarVO)request.getAttribute("starInfo");
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

    <title>Fabflix > Star Details</title>

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
	
	</script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>     
    <!--Products Section -->
<div class="container" style="width:800px">
<br/>

<h1>Star Details</h1>

<hr size="1" color="#999999">
<div class="media" style="height:180px;vertical-align:middle;display: table-cell;">
   <a class="pull-left" href="#">
      <img class="media-object" src="<%=svo.getPhoto_url() %>" 
      alt="Media Object" style="margin-left:60px;margin-top:15px;height: 180px;width:150px;">
   </a>
   <div class="media-body" style="margin-left:280px;">
      <h4 class="media-heading"><strong><%=svo.getFirstname()+" "+svo.getLastname() %></strong></h4>
      <br/>
      <table class="table table-hover" width="350" border="0">
  <tr>
    <td width="130"><b>Date of Birth:</b></td>
    <td width="10">&nbsp;</td>
    <td width="210"><%=svo.getDob() %></td>
  </tr>
  <tr>
    <td width="130"><b>Star ID:</b></td>
    <td width="10">&nbsp;</td>
    <td width="210"><%=svo.getId() %></td>
  </tr>
  <tr>
    <td width="130"><b>Starred in:</b></td>
    <td width="10">&nbsp;</td>
    <td width="210">
    <%
   		ArrayList<MovieVO> mvo=svo.getMovieStarredIn();
   		
   		for(int j=0;j<mvo.size();++j){
   			MovieVO m=mvo.get(j);
   			
   			%>
   			<a href="GetMovie?movieid=<%=m.getId() %>"><%=m.getTitle()%></a> (<%=m.getYear() %>)<br/>
   		
   		<%
   			
   			
   			}
   				
   	 %>  	
    </td>
  </tr>

</table>
      <br/>
      <br/>
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
