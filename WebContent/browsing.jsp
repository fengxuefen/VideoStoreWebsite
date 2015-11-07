<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

    <title>Main</title>

    <!-- Bootstrap  CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!--  custom CSS here -->
    <link href="css/style.css" rel="stylesheet">
<script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>     
    <!--Products Section -->
<div class="container" style="width:800px">
<br/>
<ul id="myTab" class="nav nav-tabs nav-justified">
   <li class="active">
      <a href="#home" data-toggle="tab">
        <b> Browsing Movie by Genre </b>
      </a>
   </li>
   <li><a href="#ios" data-toggle="tab"> <b>Browsing Movie by Title</b></a></li>
</ul>
<div id="myTabContent" class="tab-content">
   <div class="tab-pane fade in active" id="home">
      <p></p>
      <table width="100%" class="table table-striped">
  <tr>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Action&order=t_asc&page=1&ipp=5">Action</a></td>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Adventure&order=t_asc&page=1&ipp=5">Adventure</a></td>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Animation&order=t_asc&page=1&ipp=5">Animation</a></td>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Biography&order=t_asc&page=1&ipp=5">Biography</a></td>
  </tr>
  <tr>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Comedy&order=t_asc&page=1&ipp=5">Comedy</a></td>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Crime&order=t_asc&page=1&ipp=5">Crime</a></td>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Documentary&order=t_asc&page=1&ipp=5">Documentary</a></td>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Drama&order=t_asc&page=1&ipp=5">Drama</a></td>
  </tr>
  <tr>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Family&order=t_asc&page=1&ipp=5">Family</a></td>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Fantasy&order=t_asc&page=1&ipp=5">Fantasy</a></td>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Film-Noir&order=t_asc&page=1&ipp=5">Film-Noir</a></td>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=History&order=t_asc&page=1&ipp=5">History</a></td>
  </tr>
  <tr>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Horror&order=t_asc&page=1&ipp=5">Horror</a></td>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Music&order=t_asc&page=1&ipp=5">Music</a></td>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Musical&order=t_asc&page=1&ipp=5">Musical</a></td>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Mystery&order=t_asc&page=1&ipp=5">Mystery</a></td>
  </tr>
  <tr>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Romance&order=t_asc&page=1&ipp=5">Romance</a></td>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Sci-Fi&order=t_asc&page=1&ipp=5">Sci-Fi</a></td>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Sport&order=t_asc&page=1&ipp=5">Sport</a></td>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Thriller&order=t_asc&page=1&ipp=5">Thriller</a></td>
  </tr>
  <tr>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=War&order=t_asc&page=1&ipp=5">War</a></td>
    <td width="25%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=genre&arg=Western&order=t_asc&page=1&ipp=5">Western</a></td>
    <td width="25%" align="center" valign="middle"><a></a></td>
    <td width="25%" align="center" valign="middle"><a></a></td>
  </tr>
</table>
   </div>
   <div class="tab-pane fade" id="ios">
      <table width="100%" class="table table-striped">
  <tr>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=0&order=t_asc&page=1&ipp=5">0</a></td>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=1&order=t_asc&page=1&ipp=5">1</a></td>
    <td width="16.66%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=2&order=t_asc&page=1&ipp=5">2</a></td>
    <td width="16.66%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=3&order=t_asc&page=1&ipp=5">3</a></td>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=4&order=t_asc&page=1&ipp=5">4</a></td>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=5&order=t_asc&page=1&ipp=5">5</a></td>
  </tr>
  <tr>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=6&order=t_asc&page=1&ipp=5">6</a></td>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=7&order=t_asc&page=1&ipp=5">7</a></td>
    <td width="16.66%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=8&order=t_asc&page=1&ipp=5">8</a></td>
    <td width="16.66%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=9&order=t_asc&page=1&ipp=5">9</a></td>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=A&order=t_asc&page=1&ipp=5">A</a></td>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=B&order=t_asc&page=1&ipp=5">B</a></td>
  </tr>
  <tr>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=C&order=t_asc&page=1&ipp=5">C</a></td>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=D&order=t_asc&page=1&ipp=5">D</a></td>
    <td width="16.66%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=E&order=t_asc&page=1&ipp=5">E</a></td>
    <td width="16.66%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=F&order=t_asc&page=1&ipp=5">F</a></td>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=G&order=t_asc&page=1&ipp=5">G</a></td>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=H&order=t_asc&page=1&ipp=5">H</a></td>
  </tr>
  <tr>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=I&order=t_asc&page=1&ipp=5">I</a></td>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=J&order=t_asc&page=1&ipp=5">J</a></td>
    <td width="16.66%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=K&order=t_asc&page=1&ipp=5">K</a></td>
    <td width="16.66%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=L&order=t_asc&page=1&ipp=5">L</a></td>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=M&order=t_asc&page=1&ipp=5">M</a></td>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=N&order=t_asc&page=1&ipp=5">N</a></td>
  </tr>
  <tr>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=O&order=t_asc&page=1&ipp=5">O</a></td>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=P&order=t_asc&page=1&ipp=5">P</a></td>
    <td width="16.66%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=Q&order=t_asc&page=1&ipp=5">Q</a></td>
    <td width="16.66%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=R&order=t_asc&page=1&ipp=5">R</a></td>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=S&order=t_asc&page=1&ipp=5">S</a></td>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=T&order=t_asc&page=1&ipp=5">T</a></td>
  </tr>
  <tr>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=U&order=t_asc&page=1&ipp=5">U</a></td>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=V&order=t_asc&page=1&ipp=5">V</a></td>
    <td width="16.66%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=W&order=t_asc&page=1&ipp=5">W</a></td>
    <td width="16.66%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=X&order=t_asc&page=1&ipp=5">X</a></td>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=Y&order=t_asc&page=1&ipp=5">Y</a></td>
    <td width="16.67%" align="center" valign="middle"><a href="ShowMoviesProServlet?by=title&arg=Z&order=t_asc&page=1&ipp=5">Z</a></td>
  </tr>
</table>
   </div>
</div>
</div>
   <!--End Products Section -->
<jsp:include page="tailer.jsp"></jsp:include>
    <!-- JavaScript -->
    

</body>

</html>
