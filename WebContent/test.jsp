<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><!doctype html>
    <%@page import="db.MovieVO"%>
<%@page import="db.StarVO"%>  
<html lang="en">
<head>
  <meta charset="utf-8">

    <title>Main</title>

    <!-- Bootstrap  CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!--  custom CSS here -->
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <style type="text/css">
    .table-hover tbody tr td, .table-hover tbody tr th, .table-hover thead tr th {
    border: none;
}
.ui-tooltip {
    max-width: 500px;
  }
    </style>
	<script src="js/jquery-1.10.2.js"></script>
	 <script src="js/jquery-ui.js"></script>
	<script>
  $(function() {
    $( ".aclass" ).tooltip({
    	items: "img, [data-geo], [title]",
      content: function() {
        var element = $( this );
        var text = element.text();
        return "<div>"  + text + "<br/>sdfkjsdkfjksjdkjsdkjk</div>";
      }
    });
  });
  </script>
</head>
<body>
 <jsp:include page="header.jsp"></jsp:include>  
    <h3><a class="aclass" href="http://maps.google.com/maps?q=vienna,+austria&amp;z=11" data-geo="">sdfsdfsdfsdfs</a></h3>
 
 
 
</body>
<script src="js/my.js"></script>
</html>