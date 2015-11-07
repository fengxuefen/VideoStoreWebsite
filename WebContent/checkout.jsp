<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String status= (String)request.getAttribute("status");
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
        max-width: 300px;
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
    <title>Check Out</title>

    <!-- Bootstrap  CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="css/datepicker.css">
    <!--  custom CSS here -->
    <link href="css/style.css" rel="stylesheet">

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
    <!--Products Section -->
    <div class="container">

      <form class="form-signin" action="CheckoutServlet" method="post">
        <h2 class="form-signin-heading">Order Information</h2>
    	<%
    		if(status==null){
    		%>
    			<br/>
    		<%
    		}else{
    			%>
    			<p style="color: #5bc0de">Invalid credit card information. Please fill in again.</p>
    			<p style="color: #5bc0de">Please fill in again.</p>
    		<%
    		}
    	 %>
        <br/>
        <input type="text" class="input-block-level" placeholder="Card Number" name="cardnum">
        <input type="text" class="input-block-level" placeholder="Expiration Date" name="expDate" id="expDate">
        <input type="text" class="input-block-level" placeholder="First Name" name="fname">
        <input type="text" class="input-block-level" placeholder="Last Name" name="lname">
        <br/>
        <br/>
        <button class="btn btn-large btn-primary" type="submit">Check Out</button>
        <p></p>
        
      </form>

    </div> <!-- /container -->
   <!--End Products Section -->
	<jsp:include page="tailer.jsp"></jsp:include>
    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
                
                $('#expDate').datepicker({
                    format: "yyyy-mm-dd"
                });  
            
            });
        </script>
</body>

</html>