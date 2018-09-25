<%

    if (session.getAttribute("username") == null && session.getAttribute("password") == null && session.getAttribute("type") == "staff" ) 
    {
     response.sendRedirect("index.jsp");
    }
    
    %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@page isELIgnored="false"%> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>staff login</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script>
$(document).on('click', '.repeat', function (e) {
    e.preventDefault();
    $('.repeatable').parent('div.parent').append($('.parent').children('div:first').html());
});
</script> 
  
  </head>
  
  <body>
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>E-INDIA</h1>
        </header>
        <div class="profile-photo-container">
          <img src="DisplayImage.jsp" alt="Profile Photo" class="img-responsive">
          <div class="profile-photo-overlay"></div>
        </div>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
          </div>
        <nav class="templatemo-left-nav">
 <ul>
            <li><a href="staff.jsp"><i class="fa fa-home fa-fw"></i>PROFILE</a></li>
            <li><a href="create.jsp" class="active"><i class="fa fa-user-plus fa-fw"></i>CREATE USER</a></li>
            <li><a href="setting.jsp"><i class="fa fa-sliders fa-fw"></i>SETTINGS</a></li>
            <li><a href="DisplayLog"><i class="fa fa-sliders fa-fw"></i>UPLOAD LOG </a></li>
            <li><a href="logout"><i class="fa fa-eject fa-fw"></i>LOG OUT</a></li>
          </ul>
        </nav>
      </div>
      <!-- Main content -->
     
	  
      <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-content-container">
          <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">DOCUMENT UPLOAD</h2>
            <h2>${a.var}</h2>
            </br>
                        

 
          <h4 class="modal-title">Select a document to upload</h4>
       


<form action="uploadServlet" id="UploadForm" enctype="multipart/form-data" class="templatemo-login-form" method="post" >

 <div class="row form-group">
 <div class="col-lg-4 col-md-4 form-group"> 
 <select  class="form-control" name="option">				  
  <option value="">Document Type</option>
  <option value="Photo" >
  Photo</option>
  <option value="AadharCard" >
  Aadhar Card</option>
  <option value="PanCard" >
  Pan Card</option>
  <option value="RationCard" >
  Ration Card</option>
  <option value="BirthCeritificate" >
  Birth Ceritificate</option>
  <option value="CasteCeritificate" >
  Caste Ceritificate</option>
  <option value="Voter-id" >
  Voter-id</option>
  <option value="DrivingLicence" >
  Driving Licence</option>
  <option value="Passport" >
  Passport</option>
  <option value="ElectricityBill" >
  Electricity Bill </option>
  <option value="Uncategorized" >
  Uncategorized</option>
  </select>

  </div>
  <div class="col-lg-6">
      <input type="file" name="1" accept="image/*" class="filestyle" data-buttonName="btn-primary" data-buttonBefore="true" data-icon="false">
     
    
      <p>Maximum upload size is 5 MB.</p>  
      
   </div>
 </div> 

     <h3> 
         <c:forEach items="${sid}" var="sid"  varStatus="status">  
                         ${sid}
               
            </c:forEach>
         

</h3><br>
<div class="form-group text-left">      
            <button type="submit" value="save" class="templatemo-blue-button"> ADD DOCUMENT</button>
            <button type="reset" class="templatemo-white-button">RESET</button>       
	        </div>  
         </form></div>
		
      </div>
      
    </div>
 
  

              
			   </div>
        
  
   

    <!-- JS -->
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>       
    <script type="text/javascript" src="js/bootstrap-filestyle.min.js"></script> 
    <script type="text/javascript" src="js/templatemo-script.js"></script>       
  </body>
</html>
