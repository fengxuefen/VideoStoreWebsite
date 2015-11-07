<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<script type="text/javascript">
	$(document).ready(function(){
		var xmlhttp;
		var movie;
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
	    	alert(xmlhttp.responseXML);
	    	movie =	xmlhttp.responseXML.getElementsByTagName("movie");
	    	alert(movie[0].getElementsByTagName("year")[0].firstChild.nodeValue);
	      }
	    }
		$("#sort").click(function(){
			var queryString = "SearchServlet";
	    	xmlhttp.open("POST",queryString,true);
	    	xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
	    	xmlhttp.send();
		});
	$(".dropdown-menu li a").click(function(){
  		var selText = $(this).text();
  		$(this).parents('.btn-group').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
	});	
	});
	</script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>     
    <!--Products Section -->
<div class="container" style="width:800px">
<br/>



<h1>Search Results</h1>
<div align="right">
<a href="#" id="sort">
      <span class="glyphicon glyphicon-sort"></span> Sort by Title
</a>
&nbsp;&nbsp;
<a href="#">
      <span class="glyphicon glyphicon-sort"></span> Sort by Year
</a>
</div>
<hr size="1" color="#999999">
<div class="media" style="height:180px;vertical-align:middle;display: table-cell;">
   <a class="pull-left" href="#">
      <img class="media-object" src="img/temp2.jpg" 
      alt="Media Object" style="margin-left:100px;margin-top:80px">
   </a>
   <div class="media-body" style="margin-left:280px;">
      <h4 class="media-heading"><strong>How to Train Your Dragon</strong></h4>
      <br/>
      <table class="table table-hover" width="350" border="0">
  <tr>
    <td width="83"><b>Year:</b></td>
    <td width="15">&nbsp;</td>
    <td width="230">1991</td>
  </tr>
  <tr>
    <td><b>Director:</b></td>
    <td>&nbsp;</td>
    <td>James Cameron</td>
  </tr>
  <tr>
    <td><b>Movie ID:</b></td>
    <td>&nbsp;</td>
    <td>244</td>
  </tr>
  <tr>
    <td><b>Stars:</b></td>
    <td>&nbsp;</td>
    <td><a href="getStar?starid=139">Arnold Schwarzenegger</a>, <a href="getStar?starid=96">Linda Hamilton</a>, <a href="getStar?starid=236">Edward Furlong</a>, <a href="getStar?starid=667">Robert Patrick</a>, <a href="getStar?starid=1052">Earl Boen</a></td>
  </tr>
  <tr>
    <td><b>Genre:</b></td>
    <td>&nbsp;</td>
    <td>Action, Sci-Fi, Thriller</td>
  </tr>
  <tr>
    <td><b>Trailer:</b></td>
    <td>&nbsp;</td>
    <td>Click <a href="#">here</a> to watch the movie trailer</td>
  </tr>
  <tr>
    <td><b>Price</b></td>
    <td>&nbsp;</td>
    <td>$15.99</td>
  </tr>
</table>
  
      <button type="button" class="btn btn-primary">Add to Cart</button>
   </div>
</div>

<hr size="1" color="#999999">
<div class="media" style="height:180px;vertical-align:middle;display: table-cell;">
   <a class="pull-left" href="#">
      <img class="media-object" src="img/temp2.jpg" 
      alt="Media Object" style="margin-left:100px;margin-top:80px">
   </a>
   <div class="media-body" style="margin-left:280px;">
      <h4 class="media-heading"><strong>How to Train Your Dragon</strong></h4>
      <br/>
      <table class="table table-hover" width="350" border="0">
  <tr>
    <td width="83"><b>Year:</b></td>
    <td width="15">&nbsp;</td>
    <td width="230">1991</td>
  </tr>
  <tr>
    <td><b>Director:</b></td>
    <td>&nbsp;</td>
    <td>James Cameron</td>
  </tr>
  <tr>
    <td><b>Movie ID:</b></td>
    <td>&nbsp;</td>
    <td>244</td>
  </tr>
  <tr>
    <td><b>Stars:</b></td>
    <td>&nbsp;</td>
    <td><a href="getStar?starid=139">Arnold Schwarzenegger</a>, <a href="getStar?starid=96">Linda Hamilton</a>, <a href="getStar?starid=236">Edward Furlong</a>, <a href="getStar?starid=667">Robert Patrick</a>, <a href="getStar?starid=1052">Earl Boen</a></td>
  </tr>
  <tr>
    <td><b>Genre:</b></td>
    <td>&nbsp;</td>
    <td>Action, Sci-Fi, Thriller</td>
  </tr>
  <tr>
    <td><b>Trailer:</b></td>
    <td>&nbsp;</td>
    <td>Click <a href="#">here</a> to watch the movie trailer</td>
  </tr>
  <tr>
    <td><b>Price</b></td>
    <td>&nbsp;</td>
    <td>$15.99</td>
  </tr>
</table>

      <button type="button" class="btn btn-primary">Add to Cart</button>
   </div>
</div>

<hr size="1" color="#999999">
<div class="media" style="height:180px;vertical-align:middle;display: table-cell;">
   <a class="pull-left" href="#">
      <img class="media-object" src="img/temp2.jpg" 
      alt="Media Object" style="margin-left:100px;margin-top:80px">
   </a>
   <div class="media-body" style="margin-left:280px;">
      <h4 class="media-heading"><strong>How to Train Your Dragon</strong></h4>
      <br/>
      <table class="table table-hover" width="350" border="0">
  <tr>
    <td width="83"><b>Year:</b></td>
    <td width="15">&nbsp;</td>
    <td width="230">1991</td>
  </tr>
  <tr>
    <td><b>Director:</b></td>
    <td>&nbsp;</td>
    <td>James Cameron</td>
  </tr>
  <tr>
    <td><b>Movie ID:</b></td>
    <td>&nbsp;</td>
    <td>244</td>
  </tr>
  <tr>
    <td><b>Stars:</b></td>
    <td>&nbsp;</td>
    <td><a href="getStar?starid=139">Arnold Schwarzenegger</a>, <a href="getStar?starid=96">Linda Hamilton</a>, <a href="getStar?starid=236">Edward Furlong</a>, <a href="getStar?starid=667">Robert Patrick</a>, <a href="getStar?starid=1052">Earl Boen</a></td>
  </tr>
  <tr>
    <td><b>Genre:</b></td>
    <td>&nbsp;</td>
    <td>Action, Sci-Fi, Thriller</td>
  </tr>
  <tr>
    <td><b>Trailer:</b></td>
    <td>&nbsp;</td>
    <td>Click <a href="#">here</a> to watch the movie trailer</td>
  </tr>
  <tr>
    <td><b>Price</b></td>
    <td>&nbsp;</td>
    <td>$15.99</td>
  </tr>
</table>

      <button type="button" class="btn btn-primary">Add to Cart</button>
   </div>
</div>

<hr size="1" color="#999999">
<div class="media" style="height:180px;vertical-align:middle;display: table-cell;">
   <a class="pull-left" href="#">
      <img class="media-object" src="img/temp2.jpg" 
      alt="Media Object" style="margin-left:100px;margin-top:80px">
   </a>
   <div class="media-body" style="margin-left:280px;">
      <h4 class="media-heading"><strong>How to Train Your Dragon</strong></h4>
      <br/>
      <table class="table table-hover" width="350" border="0">
  <tr>
    <td width="83"><b>Year:</b></td>
    <td width="15">&nbsp;</td>
    <td width="230">1991</td>
  </tr>
  <tr>
    <td><b>Director:</b></td>
    <td>&nbsp;</td>
    <td>James Cameron</td>
  </tr>
  <tr>
    <td><b>Movie ID:</b></td>
    <td>&nbsp;</td>
    <td>244</td>
  </tr>
  <tr>
    <td><b>Stars:</b></td>
    <td>&nbsp;</td>
    <td><a href="getStar?starid=139">Arnold Schwarzenegger</a>, <a href="getStar?starid=96">Linda Hamilton</a>, <a href="getStar?starid=236">Edward Furlong</a>, <a href="getStar?starid=667">Robert Patrick</a>, <a href="getStar?starid=1052">Earl Boen</a></td>
  </tr>
  <tr>
    <td><b>Genre:</b></td>
    <td>&nbsp;</td>
    <td>Action, Sci-Fi, Thriller</td>
  </tr>
  <tr>
    <td><b>Trailer:</b></td>
    <td>&nbsp;</td>
    <td>Click <a href="#">here</a> to watch the movie trailer</td>
  </tr>
  <tr>
    <td><b>Price</b></td>
    <td>&nbsp;</td>
    <td>$15.99</td>
  </tr>
</table>
      <button type="button" class="btn btn-primary">Add to Cart</button>
   </div>
</div>

<hr size="1" color="#999999">
<div class="media" style="height:180px;vertical-align:middle;display: table-cell;">
   <a class="pull-left" href="#">
      <img class="media-object" src="img/temp2.jpg" 
      alt="Media Object" style="margin-left:100px;margin-top:80px">
   </a>
   <div class="media-body" style="margin-left:280px;">
      <h4 class="media-heading"><strong>How to Train Your Dragon</strong></h4>
      <br/>
      <table class="table table-hover" width="350" border="0">
  <tr>
    <td width="83"><b>Year:</b></td>
    <td width="15">&nbsp;</td>
    <td width="230">1991</td>
  </tr>
  <tr>
    <td><b>Director:</b></td>
    <td>&nbsp;</td>
    <td>James Cameron</td>
  </tr>
  <tr>
    <td><b>Movie ID:</b></td>
    <td>&nbsp;</td>
    <td>244</td>
  </tr>
  <tr>
    <td><b>Stars:</b></td>
    <td>&nbsp;</td>
    <td><a href="getStar?starid=139">Arnold Schwarzenegger</a>, <a href="getStar?starid=96">Linda Hamilton</a>, <a href="getStar?starid=236">Edward Furlong</a>, <a href="getStar?starid=667">Robert Patrick</a>, <a href="getStar?starid=1052">Earl Boen</a></td>
  </tr>
  <tr>
    <td><b>Genre:</b></td>
    <td>&nbsp;</td>
    <td>Action, Sci-Fi, Thriller</td>
  </tr>
  <tr>
    <td><b>Trailer:</b></td>
    <td>&nbsp;</td>
    <td>Click <a href="#">here</a> to watch the movie trailer</td>
  </tr>
  <tr>
    <td><b>Price</b></td>
    <td>&nbsp;</td>
    <td>$15.99</td>
  </tr>
</table>
  
      <br/>
      <button type="button" class="btn btn-primary">Add to Cart</button>
   </div>
</div>

<hr size="1" color="#999999">
<div class="media" style="height:180px;vertical-align:middle;display: table-cell;">
   <a class="pull-left" href="#">
      <img class="media-object" src="img/temp2.jpg" 
      alt="Media Object" style="margin-left:100px;margin-top:80px">
   </a>
   <div class="media-body" style="margin-left:280px;">
      <h4 class="media-heading"><strong>How to Train Your Dragon</strong></h4>
      <br/>
      <table class="table table-hover" width="350" border="0">
  <tr>
    <td width="83"><b>Year:</b></td>
    <td width="15">&nbsp;</td>
    <td width="230">1991</td>
  </tr>
  <tr>
    <td><b>Director:</b></td>
    <td>&nbsp;</td>
    <td>James Cameron</td>
  </tr>
  <tr>
    <td><b>Movie ID:</b></td>
    <td>&nbsp;</td>
    <td>244</td>
  </tr>
  <tr>
    <td><b>Stars:</b></td>
    <td>&nbsp;</td>
    <td><a href="getStar?starid=139">Arnold Schwarzenegger</a>, <a href="getStar?starid=96">Linda Hamilton</a>, <a href="getStar?starid=236">Edward Furlong</a>, <a href="getStar?starid=667">Robert Patrick</a>, <a href="getStar?starid=1052">Earl Boen</a></td>
  </tr>
  <tr>
    <td><b>Genre:</b></td>
    <td>&nbsp;</td>
    <td>Action, Sci-Fi, Thriller</td>
  </tr>
  <tr>
    <td><b>Trailer:</b></td>
    <td>&nbsp;</td>
    <td>Click <a href="#">here</a> to watch the movie trailer</td>
  </tr>
  <tr>
    <td><b>Price</b></td>
    <td>&nbsp;</td>
    <td>$15.99</td>
  </tr>
</table>
      <button type="button" class="btn btn-primary">Add to Cart</button>
   </div>
</div>

<hr size="1" color="#999999">

<nav>
  <ul class="pager">
    <li><a href="#">Previous</a></li>
    <li><a href="#">&nbsp;&nbsp;&nbsp;Next&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
  </ul>
</nav>
<div class="btn-group">
      <a class="btn dropdown-toggle btn-select" data-toggle="dropdown" href="#">Results Per Page <span class="caret"></span></a>
      <ul class="dropdown-menu">
        <li class="disabled"><a href="#">5</a></li>
        <li><a href="#">10</a></li>
        <li><a href="#">20</a></li>
      </ul>
    </div>

</div>
   <!--End Products Section -->
<jsp:include page="tailer.jsp"></jsp:include>
    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/my.js"></script>

</body>

</html>
