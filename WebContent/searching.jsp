<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%
String email = (String)request.getSession().getAttribute("email");
if(email == null || email == "")
{
	response.sendRedirect("login.jsp");
}
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }
      .form-signin {
        max-width: 330px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>
    <script src="js/jquery-1.10.2.js"></script>
      <script src="js/jquery-ui.js"></script>
  <link rel="stylesheet" href="css/jquery-ui.css">
    <script type="text/javascript">
	$(document).ready(function(){
		var titledata = "";
		  var xmlhttp;
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
		    	titledata = $.parseJSON( xmlhttp.responseText );
		    	$( "#title" ).autocomplete({
		  		  source: titledata
		  	  });
		      }
		    }
			$("#title").keyup(function(){
				var queryString = "AutoSearchServlet?title=" + $("#title").val();
		    	xmlhttp.open("POST",queryString,true);
		    	xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
		    	xmlhttp.send();
			});
	});
	</script>
    <title>Search</title>

    <!-- Bootstrap  CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!--  custom CSS here -->
    <link href="css/style.css" rel="stylesheet">

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
    <!--Products Section -->
    <div class="container">

      <form class="form-signin" action="MovieSearchServlet" method="post">
        <h2 class="form-signin-heading"><strong>Search Conditions</strong></h2>
        <br/>
        <input type="hidden" name="order" value="t_asc"/>
        <input type="hidden" name="page" value="1"/>
        <input type="hidden" name="ipp" value="5"/>
        <input type="text" id="title" class="input-block-level" placeholder="Title..." name="title"/>
        <input type="text" class="input-block-level" placeholder="Year..." name="year">
        <input type="text" class="input-block-level" placeholder="Director..." name="director"/>
        <input type="text" class="input-block-level" placeholder="First Name..." name="fname"/>
        <input type="text" class="input-block-level" placeholder="Last Name..." name="lname"/>
        <br/>
        <br/>
        <button class="btn btn-large btn-primary" type="submit">Search</button>
        
      </form>

    </div> <!-- /container -->
   <!--End Products Section -->
	<jsp:include page="tailer.jsp"></jsp:include>
    <!-- JavaScript -->
    
    <script src="js/bootstrap.js"></script>

</body>

</html>