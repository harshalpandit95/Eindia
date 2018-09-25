<%@page import="javax.swing.JFrame"%>
<%@page import="com.github.sarxos.webcam.WebcamResolution"%>
<%@page import="com.github.sarxos.webcam.WebcamPanel"%>
<%@page import="com.google.zxing.NotFoundException"%>
<%@page import="com.google.zxing.MultiFormatReader"%>
<%@page import="com.google.zxing.common.HybridBinarizer"%>
<%@page import="com.google.zxing.BinaryBitmap"%>
<%@page import="com.google.zxing.LuminanceSource"%>
<%@page import="com.google.zxing.client.j2se.BufferedImageLuminanceSource"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.google.zxing.Result"%>
<%@page import="com.github.sarxos.webcam.Webcam"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %> 


<%

    if (session.getAttribute("username") == null && session.getAttribute("password") == null && session.getAttribute("type") == "staff" ) 
    {
     response.sendRedirect("Home");
    }
    
    %>
  
    
   
  
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page isELIgnored="false"%> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Third party</title>
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
            <li><a href="staff"><i class="fa fa-home fa-fw"></i>PROFILE</a></li>
            <li><a href="" class="active"><i class="fa fa-user-plus fa-fw"></i>SCAN QRCODE</a></li>
            <li><a href="setting.jsp"><i class="fa fa-sliders fa-fw"></i>SETTINGS</a></li>
            <li><a href="logout"><i class="fa fa-eject fa-fw"></i>LOG OUT</a></li>
          </ul>
        </nav>
      </div>
      <!-- Main content -->
     
	  
      <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-content-container">
          <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">SCAN QR-CODE</h2>
          
            </br>

  <center>    
     WebcamQRCode View:<br />
       <script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.webcamqrcode.min.js"></script>
<script>
(function($){
	$('document').ready(function(){
		$('#qrcodebox').WebcamQRCode({
			onQRCodeDecode: function( p_data ){
					$('#qrcode_result').html( p_data );
			}
		});
		
		$('#btn_start').click(function(){
			$('#qrcodebox').WebcamQRCode().start();
		});
		
		$('#btn_stop').click(function(){
			$('#qrcodebox').WebcamQRCode().stop();
		});
	});
})(jQuery);
</script>
<div style="width: 350px; height: 350px;" id="qrcodebox">
</div>
<input type="button" value="Start" id="btn_start" /> 
<input type="button" value="Stop" id="btn_stop" />

<p>
Last QRCode value: <span id="qrcode_result">none</span>
<input type="submit" value="decrypt code">
</p> </center>

            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
     
            <center> 
         Press Scan and place the phone in front of the cam 
         <div>
               
         </div>
                </br> </br> </br> 
                </center>
            
                       
            
            
  <h2 class="margin-bottom-10">UPLOAD QR-CODE</h2>
 


<form action="Scan" id="UploadForm" enctype="multipart/form-data" class="templatemo-login-form" method="post" >

 <div class="row form-group">
 <div class="col-lg-4 col-md-4 form-group"> 

  </div>
  <div class="col-lg-9">
 
          <h4 class="modal-title">Select QR-CODE</h4>
            <input type="file" name="photo" id="photo" accept="image/*" class="filestyle" data-buttonName="btn-primary" data-buttonBefore="true" data-icon="false">
     
    
      <p>Maximum upload size is 5 MB.</p>  
      
   </div>
 </div> 

<div class="form-group text-left">      
            <button type="submit" value="save" class="templatemo-blue-button"> PROCEED</button>
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
  <c:if test="${sessionScope.message != null}">
  <script>
        var message = "${sessionScope.message}";
        alert(message);
        <%session.removeAttribute("message");%>
    </script>
</c:if> 