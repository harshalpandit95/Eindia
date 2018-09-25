<% int incre=0;
    if (session.getAttribute("username") == null && session.getAttribute("password") == null ) 
    {
     response.sendRedirect("index.jsp");
    }
    %>
<%@page import="java.util.List"%>
<%@page import="model.Types"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
  <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
     <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
 <style>
.well { display: table; width: 100%; }
.row { display: table-row; font-size: 17px;}
.block_inline { display: table-cell; width: 25%; }
</style>

  <script>
function resoudre(elem) {

    var myModal = $("#myModal");

// now get the values from the table
    var uname= $(elem).closest("tr").find("td.uname").html();
    var name= $(elem).closest("tr").find("td.name").html();
    var date= $(elem).closest("tr").find("td.date").html();
    var address= $(elem).closest("tr").find("td.address").html();
    var pin= $(elem).closest("tr").find("td.pin").html();
    var state= $(elem).closest("tr").find("td.state").html();
    var district= $(elem).closest("tr").find("td.district").html();
    var city= $(elem).closest("tr").find("td.city").html();
    var email= $(elem).closest("tr").find("td.email").html();
    var phone= $(elem).closest("tr").find("td.phone").html();
    var gender= $(elem).closest("tr").find("td.gender").html();
    var caste= $(elem).closest("tr").find("td.caste").html();
    var create= $(elem).closest("tr").find("td.create").html();
    
$(".uname").text(uname); 
$(".name").text(name);
$(".date").text(date);
$(".address").text(address);
$(".state").text(state);
$(".district").text(district);
$(".city").text(city);
$(".pin").text(pin);
$(".email").text(email);
$(".gender").text(gender);
$(".phone").text(phone);
$(".create").text(create);
$(".caste").text(caste);
}
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
            <li><a href="create.jsp"><i class="fa fa-user-plus fa-fw"></i>CREATE USER</a></li>
            <li><a href="setting.jsp"><i class="fa fa-sliders fa-fw"></i>SETTINGS</a></li>
            <li><a href="DisplayLog" class="active"><i class="fa fa-sliders fa-fw"></i>UPLOAD LOG </a></li>
            <li><a href="logout"><i class="fa fa-eject fa-fw"></i>LOG OUT</a></li>
          </ul>
        </nav>
      </div>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">
       
        <div class="templatemo-content-container">
          <div class="templatemo-content-widget no-padding">
            <div class="panel panel-default table-responsive">
         
                <table class="table table-striped table-bordered templatemo-user-table">
                <thead>
                  <tr>
                    <td># </td>
                    <td>User Name </td>
                    <td>NAME</td>
                    <td><a href="" class="white-text templatemo-sort-by">UPLOAD LOG<span class="caret"></span></a></td>
                    <td>DOCUMENTS</td>
                    <td>PROFILE</td>
                  
                 
                  </tr>
                </thead>
         
                <%
  List<Types> styles = (List<Types>) request.getAttribute("styles");
  if(styles!=null){
    for(Types type: styles){
      // out.println("<br/>" + type.getName());
  incre++;
%>
                <tbody>
                  <tr>
                      <td class="uname" style="display:none"><%=type.getUname()%></td>
                      <td class="date" style="display:none"><%=type.getDate()%></td>
                      <td class="pin" style="display:none"><%=type.getPin()%></td>
                      <td class="state" style="display:none"><%=type.getState()%></td>
                      <td class="city" style="display:none"><%=type.getCity()%></td>
                      <td class="district" style="display:none"><%=type.getDistrict()%></td>
                      <td class="email" style="display:none"><%=type.getEmail()%></td>
                      <td class="name" style="display:none"><%=type.getFname()%> <%=type.getMname()%> <%=type.getLname()%></td>
                      <td class="gender" style="display:none"><%=type.getGender()%></td>
                      <td class="phone" style="display:none"><%=type.getPhone()%></td>              
                      <td class="caste" style="display:none"><%=type.getCaste()%></td> 
                      <td class="address" style="display:none"><%=type.getAddress()%></td>
                      <td><%=incre%></td>
                    <td><%=type.getUname()%></td>
                    <td><%=type.getFname()%>  <%=type.getMname()%> <%=type.getLname()%>  </td>
                    <td><%=type.getCreated()%></td>
                    <td><%=type.getCount()%></td>
                    <td><a href=""  data-toggle="modal" data-target="#myModal" class="templatemo-edit-btn" onclick="resoudre(this)">View</a></td>
                  
             
                  </tr>
              
                
                
                
                
                  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" onClick="window.location.reload()">&times;</button>
          <h2> PROFILE OF USER :-<div1 class="uname"></div1> </b></h2>
         </div>          
       
          
           <div class='well'>

		<div class="row">
              <div class='block_inline'> Name:- </div> 
              <div class='block_inline'><div class="name"></div></div>
         </div> 
          <div class="row">
              <div class='block_inline'>Date of Birth:-</div> 
              <div class='block_inline'><div class="date"></div></div>
         </div> 
          <div class="row">
              <div class='block_inline'> Gender:-</div> 
              <div class='block_inline'> <div class="gender"></div></div>
         </div> 
          <div class="row">
              <div class='block_inline'>Caste:-</div>
              <div class='block_inline'><div class="caste"></div></div>
         </div> 
          <div class="row">
              <div class='block_inline'>  Address:-</div>
              <div class='block_inline'><div class="address"></div></div>
         </div> 
          <div class="row">
              <div class='block_inline'> City:-</div> 
              <div class='block_inline'><div class="city"></div></div>
         </div> 
          <div class="row">
              <div class='block_inline'>  District:-</div>
              <div class='block_inline'><div class="district"></div></div>
         </div> 
          <div class="row">
              <div class='block_inline'>State:-</div>
              <div class='block_inline'><div class="state"></div></div>
         </div> 
          <div class="row">
              <div class='block_inline'> Pin:-</div> 
              <div class='block_inline'><div class="pin"></div></div>
         </div> 
          <div class="row">
              <div class='block_inline'>Email-id:-</div>
              <div class='block_inline'><div class="email"></div></div>
         </div> 
		 
		 


</div>
         
         
  	
      </div>
    </div>  
</div>
                
                  <%  }}%>
                 
                </tbody>
</table>   
             
 </div>                          
  </div>          
        
          <footer class="text-right">
            <p>Copyright &copy;  
            |  <a href="http://www.eindia.com" target="_parent">E-India</a></p>
          </footer>         
        </div>
      </div>
    </div>
    
    <!-- JS -->
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->
    <script>
   
    </script>
  </body>
</html>