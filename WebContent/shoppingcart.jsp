<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="db.MyCartDAO"%>
<%@page import="db.MovieVO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList al=(ArrayList)request.getSession().getAttribute("myCartInfo");
if(al==null)
	al=new ArrayList();
MyCartDAO mcd=(MyCartDAO)request.getSession().getAttribute("myCart");
if(mcd==null){
	mcd=new MyCartDAO();
	System.out.println(basePath);
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
	<style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 800px;
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
    <title>Shopping Cart</title>

    <!-- Bootstrap  CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!--  custom CSS here -->
    <link href="css/style.css" rel="stylesheet">
    <script src="js/jquery-1.10.2.js"></script>
    
	<script type="text/javascript">
		
		function delAll(){
			window.open("ShoppingProServlet?type=delAll","_self");	
		}
		
		function update(movieid){
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
		    	window.location.reload();
		      }
		    }
		    var stringnum = "num" + movieid;
		    var num=document.getElementById(stringnum).value; 
		    var queryString = "ShoppingProServlet?type=updateMovies&moviesId=" + movieid +"&newNum="+num;
			xmlhttp.open("POST",queryString,true);
	    	xmlhttp.send();			
   			var id =document.getElementById("goodsId").value;
  		} 
		
		function deletemovie(movieid){
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
		    	window.location.reload();
		      }
		    }
		    var queryString = "ShoppingProServlet?type=delMovies&moviesId=" + movieid;
			xmlhttp.open("POST",queryString,true);
	    	xmlhttp.send();	
		}
		
		function delAll(){
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
		    	window.location.reload();
		      }
		    }
			var queryString = "ShoppingProServlet?type=delAll";
			xmlhttp.open("POST",queryString,true);
	    	xmlhttp.send();	
		}
	</script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
    <!--Products Section -->
    <div class="container">

      <form class="form-signin" action="ShoppingProServlet?type=checkout" method="post">
        <h2 class="form-signin-heading"><b>Shopping Cart</b></h2>
        <table class="table table-striped">
        <thead>
          <tr>
            <th width="50%">Movie Title</th>
            <th width="10%" >Price</th>
            <th width="10%" >Quantity</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          
      <%
      	for(int i=0;i<al.size();i++){
      		MovieVO mvo=(MovieVO)al.get(i);
      	
      	%>
      	<tr>
        <input type="hidden" id="goodsId" value="<%=mvo.getId() %>"/>
        <td width="63%" style="vertical-align:middle;"><%=mvo.getTitle() %></td>
        <td width="10%" style="vertical-align:middle;"><%="$15.99" %></td>
        <td style="vertical-align:middle;"><input name="newNum" id="num<%=mvo.getId() %>" class="input-block-level" type="text" maxlength="3" value=<%=mcd.getMovieNumById(mvo.getId()+"") %> style="max-width: 60px;max-height: 25px;vertical-align:middle;" ></td>
        <td width="7%" align="center" style="vertical-align:middle;"><button type="button" class="btn btn-large btn-primary" onclick="update(<%=mvo.getId() %>)">update</button></td>
        <td width="15%" align="center" style="vertical-align:middle;"><button type="button" class="btn btn-large btn-primary"  onclick="deletemovie(<%=mvo.getId() %>)">delete</button></a></td>
      </tr>
      	<%
      }
       %>
       
        </tbody>
      </table>
      	<h4><b>Grand Total: $<%=mcd.getAllPrice() %></b></h4> 
      	<button class="btn btn-large btn-primary" type="button" onclick="delAll()">Empty Cart</button>  
        <button class="btn btn-large btn-primary" type="submit">Check out</button>        
      </form>

    </div> <!-- /container -->
   <!--End Products Section -->
	<jsp:include page="tailer.jsp"></jsp:include>
    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>

</body>

</html>