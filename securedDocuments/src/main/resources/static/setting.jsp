<%
    if (session.getAttribute("username") == null && session.getAttribute("password") == null ) 
    {
     response.sendRedirect("index.jsp");
    }
    %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Visual Admin Dashboard - Preferences</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">

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
            <li><a href="create.jsp"><i class="fa fa-user-plus fa-fw"></i>CREATE USER</a></li>
            <li><a href="setting.jsp" class="active"><i class="fa fa-sliders fa-fw"></i>SETTINGS</a></li>
            <li><a href="DisplayLog"><i class="fa fa-sliders fa-fw"></i>UPLOAD LOG </a></li>
            <li><a href="logout"><i class="fa fa-eject fa-fw"></i>LOG OUT</a></li>
          </ul>
        </nav>
      </div>
      <!-- Main content -->
      <div class="templatemo-content col-1 light-gray-bg">
     
        <div class="templatemo-content-container">
          <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">Change Password</h2>
            <p>Password must minimum of length 8.</p>
            
           <form action="ChangePassword" class="templatemo-login-form" method="post" >
              
                 <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputCurrentPassword">Current Password</label>
                    <input type="password" class="form-control" id="op1" name="op1" placeholder="*********************">                  
                </div>                
              </div>
                
              
            
            
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputNewPassword">New Password</label>
                    <input type="password" class="form-control"  name="np1" placeholder="*********************">
                </div>
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputConfirmNewPassword">Confirm New Password</label>
                    <input type="password" class="form-control"  name="np2" placeholder="*********************">
                </div> 
                    <h2>${model.pass}</h2>
              </div>
             
			     <div class="form-group text-left">
                <button type="submit" class="templatemo-blue-button"> Change Password</button>
                <button type="reset" class="templatemo-white-button">Reset</button>
              </div> <br>
               </form>
        <form action="ChangePic" class="templatemo-login-form" method="post" enctype="multipart/form-data">
			 <div class="row form-group">
			 <div class="col-lg-12">
					<h2 class="margin-bottom-10">Change Profile Image</h2>
					<p>Image size upto 1MB</p>
			<label class="control-label templatemo-block">File Input</label> 
                  <!-- <input type="file" name="fileToUpload" id="fileToUpload" class="margin-bottom-10"> -->
                  <input type="file" name="photo" id="photo" class="filestyle" data-buttonName="btn-primary" data-buttonBefore="true" data-icon="false">
                                  
                </div>  
              </div>
              <div class="form-group text-left">
                <button type="submit" class="templatemo-blue-button">Update Profile</button>
                <button type="reset" class="templatemo-white-button">Reset</button>
                   <h2>${model.name}</h2>
              </div>                           
        </form>
          </div>
          <footer class="text-right">
            <p>Copyright &copy; E-INDIAS 
            | Designed by <a href="" target="_parent">E-india</a></p>
          </footer>
        </div>
      </div>
    </div>

    <!-- JS -->
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>        <!-- jQuery -->
    <script type="text/javascript" src="js/bootstrap-filestyle.min.js"></script>  <!-- http://markusslima.github.io/bootstrap-filestyle/ -->
    <script type="text/javascript" src="js/templatemo-script.js"></script>        <!-- Templatemo Script -->
  </body>
</html>
