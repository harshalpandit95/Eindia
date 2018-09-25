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
    <title>staff login</title>
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
            <h2 class="margin-bottom-10">USER INFORMATION</h2>
			
            
            <form action="AddToDb" onsubmit="return validate()" class="templatemo-login-form" name="myForm" method="post" >
              
                 <div class="row form-group">
                <div class="col-lg-4 col-md-4 form-group">                  
                    <label>Firstname</label>
                    <input type="text" class="form-control" maxlength="20" id="fn" name="fn" placeholder="Enter the Firstname" required>                  
                </div>     
                      <div class="col-lg-4 col-md-4 form-group">                  
                    <label>Middlename</label>
                    <input type="text" class="form-control" maxlength="20" id="mn" name="mn" placeholder="Enter the Middlename" required>                  
                </div> 
                      <div class="col-lg-4 col-md-4 form-group">                  
                    <label>Lastname</label>
                    <input type="text" class="form-control" maxlength="20" id="ln" name="ln" placeholder="Enter the Lastname" required>                  
                </div> 
              </div>          
<div class="row form-group">



<div class="col-lg-4 col-md-4 form-group"> 
                  <label class="control-label templatemo-block">Date of birth</label>                 
                  <select id="month" class="form-control" name="month" required>	  
  <option value="">Month</option>
  <option value="01" >
  January</option>
  <option value="02" >
  February</option>
  <option value="03" >
  March</option>
  <option value="04" >
  April</option>
  <option value="05" >
  May</option>
  <option value="06" >
  June</option>
  <option value="07" >
  July</option>
  <option value="08" >
  August</option>
  <option value="09" >
  September</option>
  <option value="10" >
  October</option>
  <option value="11" >
  November</option>
  <option value="12" >
  December</option>
  </select>
 
</div>
    <div class="col-lg-2 col-md-4 form-group"> 
  <label id="day-label" class="day"> Date</label>
  
  <input type="text" placeholder="enter date" class="form-control" name="day" id="day" required pattern="([1-9]|1[0-9]|2[0-9]|3[01])" title="This is an error message" >
     </div>
    <div class="col-lg-2 col-md-2 form-group"> 
  <label id="year-label" class="year">Year</label>
  <input type="text" placeholder="enter year" class="form-control"  name="year" id="year" required pattern="(19[2-9][0-9])|(200[0-9])">
  </div>     
  <div class="form-element multi-field birthday" id="birthday-form-element">  
  </div>
    <div class="col-lg-2 col-md-3 form-group">
<label id="f" class="gender">Gender</label>
   <select id="gender" name="gender" class="form-control" required>
  <option value="">Gender</option>
  <option value="01" >
  Male</option>
  <option value="02" >
  Female</option>
  <option value="03" >
  Others</option>
  </select>
</div>
      <div class="col-lg-2 col-md-3 form-group">  
                    <label>Caste</label>
                    <input type="text" class="form-control" maxlength="15" id="caste" name="caste" placeholder="Enter caste" required oninvalid="setCustomValidity('Plz enter ')" onchange="try{setCustomValidity('')}catch(e){}">
                </div>  
</div>
   <div class="row form-group">
                <div class="col-lg-5 col-md-4 form-group">                  
                    <label>Address</label>
                    <textarea rows="5" cols="50" class="form-control"  maxlength="150" id="address" name="address" placeholder="Enter the Address" required></textarea> 
					</div>
       
                    <div class="col-lg-3 col-md-3 form-group">  
                    <label>State</label>
                    <input type="text" class="form-control"  maxlength="15" id="state" name="state" placeholder="Enter State" required>
                </div> 
                    <div class="col-lg-3 col-md-3 form-group">  
                    <label>District</label>
                    <input type="text" class="form-control"  maxlength="15" id="district" name="district" placeholder="Enter District" required>
                </div> 
                    <div class="col-lg-3 col-md-3 form-group">  
                    <label>City</label>
                    <input type="text" class="form-control"  maxlength="15" id="city" name="city" placeholder="Enter City" required>
                </div> 
        <div class="col-lg-3 col-md-3 form-group">  
                    <label>Pincode</label>
                    <input type="number" class="form-control" min="100000" max="900000" id="pin" name="pin" placeholder="Enter Pincode"  required oninvalid="setCustomValidity('Enter valid pincode ')" onchange="try{setCustomValidity('')}catch(e){}" >
                </div>
       
   </div>
                
                
   <div class="row form-group">
                <div class="col-lg-5 col-md-4 form-group">                  
                    <label>Email id</label>
                    <input type="email" class="form-control"  maxlength="30" id="email" name="email" placeholder="Enter email id " required>
                </div>
                    <div class="col-lg-3 col-md-3 form-group">  
                    <label>Phone no</label>
                    <input type="number" class="form-control" min="7000000000"  max="9999999999" id="phone" name="phone" placeholder="Enter phone no" required  oninvalid="setCustomValidity('Enter valid Phone no ')" onchange="try{setCustomValidity('')}catch(e){}">
                </div> 
    
   </div>
            
			
			     <div class="form-group text-left">
                <button type="submit" class="templatemo-blue-button"><i class="fa fa-home fa-fw"></i>SUBMIT</button>
                <button type="reset" class="templatemo-white-button">RESET</button>
              </div> <br>
               </form>
          </div>
        </div>
      </div>
    </div>

    <!-- JS -->
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>       
    <script type="text/javascript" src="js/bootstrap-filestyle.min.js"></script> 
    <script type="text/javascript" src="js/templatemo-script.js"></script>       
  </body>
</html>
