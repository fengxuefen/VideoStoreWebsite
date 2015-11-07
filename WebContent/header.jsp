<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
			$("#searchgo").click(function(){
				window.location.href="TitleMovieSearchSerclet?title="+$("#title").val();
			});
	});
	</script>
 <!-- Nav Section -->
    <nav class=" navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand logo-nav" href="index.jsp">
                    <img src="img/title.png" alt="">
                </a>
            </div>

            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav navbar-right margin-top">
                    <li><a href="index.jsp"><b>Home</b></a>
                    </li>
                    <li><a href="browsing.jsp"><b>Browsing</b></a>
                    </li>
                    <li><a href="searching.jsp"><b>Searching</b></a>
                    </li>
                  
                    <li><a href="shoppingcart.jsp"><b>Cart</b></a>
                    </li>
                    <%
                    String email = (String)request.getSession().getAttribute("email");
                    if(email == null || email == "")
                    {
                    %>
                    <li><a href="login.jsp"><b>Login</b></a>
                    </li>
                    <%
                    }else{
                    %>
                    <li><a href="LogoutServlet"><b>Logout</b></a>
                    </li>
                    <%} %>
                    
                </ul>
                
            </div>
            <div class="nav navbar-nav navbar-right"><div  class="input-group"><input id="title" style="width:200px" type="text" class="form-control" placeholder="title">
        <button class="btn btn-default" type="button" id="searchgo">Go!</button>
      </div>
</div>
        </div>
      
    </nav>
