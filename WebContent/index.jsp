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
	
	<script src="js/jquery-1.10.2.js"></script>
	<script type="text/javascript">
	function addmovie(movieid){
		alert("Movie has been added successfully.");
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
	<style type="text/css">
     .hide-me{
	display: none;    
}

    </style>
    <title>Fabflix > Home</title>

    <!-- Bootstrap  CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!--  custom CSS here -->
    <link href="css/style.css" rel="stylesheet">
    

</head>

<body>

     <jsp:include page="header.jsp"></jsp:include>
     <!-- Carousel Section -->
    <div id="main-Carousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#main-Carousel" data-slide-to="0" class="active"></li>
            <li data-target="#main-Carousel" data-slide-to="1" class=""></li>
            <li data-target="#main-Carousel" data-slide-to="2" class=""></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
        	<div class="item active">
                <div class="fill"></div>
                    <img src="img/3.jpg" alt="">
            </div>
            <div class="item">
                <div class="fill" ></div>
                     <img src="img/1.jpg" alt="">
            </div>
            <div class="item">
                <div class="fill"></div>
                    <img src="img/2.jpg" alt="">
            </div>
            
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#main-Carousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#main-Carousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </div>
     <!--End Carousel Section -->
    <!--Products Section -->
    <div class="container">

               <div class="row">
            <div class="row">
  
                <div class=" col-md-3 col-sm-4">
    <div class="thumbnail">
      <img src="http://ia.imdb.com/media/imdb/01/I/95/71/38m.jpg" alt="" class="img-thumbnail">
      <div class="caption">
        <h3><a href="GetMovie?movieid=135001">12 Monkeys</a></h3>
        <p><strong>Director:</strong> Terry Gilliam </p>
        <p><strong>Year:</strong> 1995 </p>
        <p><strong>Genre:</strong> SCI/FI; Horror</p>
        <p><strong>Price:</strong> $15.99</p>
        <p><a href="javascript:addmovie(135001)" class="btn btn-primary" role="button">Add to Cart</a> </p>
      </div>
    </div>
  </div>
                <div class=" col-md-3 col-sm-4">
    <div class="thumbnail">
      <img src="http://ia.imdb.com/media/imdb/01/I/05/01/68m.jpg" alt="" class="img-thumbnail">
      <div class="caption">
        <h3><a href="GetMovie?movieid=217008">Robots</a></h3>
        <p><strong>Director:</strong> Chris Wedge </p>
        <p><strong>Year:</strong> 2005 </p>
        <p><strong>Genre:</strong> Fantasy</p>
        <p><strong>Price:</strong> $15.99</p>
        <p><a href="javascript:addmovie(217008)" class="btn btn-primary" role="button">Add to Cart</a> </p>
      </div>
    </div>
  </div>
              
                <div class=" col-md-3 col-sm-4">
    <div class="thumbnail">
      <img src="http://ia.imdb.com/media/imdb/01/I/31/05/32m.jpg" alt="" class="img-thumbnail">
      <div class="caption">
        <h3><a href="GetMovie?movieid=907002">24 Hour Party People</a></h3>
        <p><strong>Director:</strong> Michael Winterbottom </p>
        <p><strong>Year:</strong> 2002 </p>
        <p><strong>Genre:</strong> Drama; Comedy</p>
        <p><strong>Price:</strong> $15.99</p>
        <p><a href="javascript:addmovie(907002)" class="btn btn-primary" role="button">Add to Cart</a> </p>
      </div>
    </div>
  </div>
                <div class=" col-md-3 col-sm-4">
    <div class="thumbnail">
      <img src="http://ia.imdb.com/media/imdb/01/I/91/99/28m.jpg" alt="" class="img-thumbnail">
      <div class="caption">
        <h3><a href="GetMovie?movieid=910">Spiderman 2</a></h3>
        <p><strong>Director:</strong> Sam Raimi </p>
        <p><strong>Year:</strong> 2005 </p>
        <p><strong>Genre:</strong> Action</p>
        <p><strong>Price:</strong> $15.99</p>
        
        <p><a href="javascript:addmovie(910)" class="btn btn-primary" role="button">Add to Cart</a> </p>
      </div>
    </div>
  </div>           
</div>
</div>
</div>
<div id="alert_recover_ok" class="alert alert-success hide-me" style="width: 350px;position: absolute;top:450px;text-align:center;margin-left: 700px">
    <a href="javascript:hide()" class="close" data-dismiss="alert">&times;</a>
    <strong>Success!</strong> Movie has been added successfully.
</div>
<jsp:include page="tailer.jsp"></jsp:include>
   <!--End Products Section -->

    <!-- JavaScript -->
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/my.js"></script>
	
</body>

</html>
