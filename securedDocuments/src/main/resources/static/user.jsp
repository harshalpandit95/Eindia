<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
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
    <title>Visual Admin Dashboard - Home</title>
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
            <li><a href="user.jsp" class="active"><i class="fa fa-home fa-fw"></i>PROFILE</a></li>
            <li><a href="user-setting.jsp"><i class="fa fa-user-plus fa-fw"></i>SETTINGS</a></li>
            <li><a href="documents.jsp"><i class="fa fa-user-plus fa-fw"></i>DOCUMENTS</a></li>
            
            <li><a href="logout"><i class="fa  fa-sign-out fa-fw"></i>LOG OUT</a></li>
          </ul>
        </nav>
      </div>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">
     
		<div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">Welcome User</h2>
            <p>USER PROFILE DISPLAYED HERE</p>
        
<%
    session.setAttribute("set", "user");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eindia","root","");
Statement statement = con.createStatement(); 
String username=session.getAttribute("username").toString();
String query="select * from info where uname='"+username+"';";
ResultSet rs=statement.executeQuery(query);
String firstname=null;
String dob=null;
String gender=null;
String caste;
String address;
String city;
String district;
String state;
String pin;
String email;
while(rs.next())
{
firstname=rs.getString(1);
dob=rs.getString(6);
gender=rs.getString(9);
caste=rs.getString(10);
address=rs.getString(11);
state=rs.getString(12);
district=rs.getString(13);
pin=rs.getString(14);
email=rs.getString(7);

%>
  <table>  
      <tbody>   <tr>
              <td><label>Name:- <%=firstname%></label></td> 
             <td><div class="name"></div></td>
         </tr> 
         <tr>
             <td><label>Date of Birth:-<%=dob%></td> 
             <td><div class="date"></div></td>
         </tr> 
         <tr>
             <td><label> Gender:-<%=gender%></td> 
             <td> <div class="gender"></div></td>
         </tr> 
         <tr>
             <td><label>Caste:-<%=caste%></td>
             <td><div class="caste"></div></td>
         </tr> 
         <tr>
             <td> <label> Address:-<%=address%></td>
             <td><div class="address"></div></td>
         </tr> 
         <tr>
             <td><label> City:-</td> 
             <td><div class="city"></div></td>
         </tr> 
         <tr>
             <td> <label> District:-<%=district%></td>
             <td><div class="district"></div></td>
         </tr> 
         <tr>
             <td><label>State:-<%=state%></td>
             <td><div class="state"></div></td>
         </tr> 
         <tr>
             <td><label> Pin:-<%=pin%></td> 
             <td><div class="pin"></div></td>
         </tr> 
         <tr>
             <td><label>Email-id:-<%=email%></td><%}%>
             <td><div class="email"></div></td>
         </tr> </tbody>
         </table>     
                 </div>          
        </div>             
        </div>
          <footer class="text-right">
            <p>Copyright &copy; E-INDIA 
            | Designed by <a href="" target="_parent">E-INDIA</a></p>
          </footer>        
      
    
    <!-- JS -->
    <script src="js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script src="js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
    <script src="https://www.google.com/jsapi"></script> <!-- Google Chart -->
    <script>
      /* Google Chart 
      -------------------------------------------------------------------*/
      // Load the Visualization API and the piechart package.
      google.load('visualization', '1.0', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.setOnLoadCallback(drawChart); 
      
      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Topping');
          data.addColumn('number', 'Slices');
          data.addRows([
            ['Mushrooms', 3],
            ['Onions', 1],
            ['Olives', 1],
            ['Zucchini', 1],
            ['Pepperoni', 2]
          ]);

          // Set chart options
          var options = {'title':'How Much Pizza I Ate Last Night'};

          // Instantiate and draw our chart, passing in some options.
          var pieChart = new google.visualization.PieChart(document.getElementById('pie_chart_div'));
          pieChart.draw(data, options);

          var barChart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));
          barChart.draw(data, options);
      }

      $(document).ready(function(){
        if($.browser.mozilla) {
          //refresh page on browser resize
          // http://www.sitepoint.com/jquery-refresh-page-browser-resize/
          $(window).bind('resize', function(e)
          {
            if (window.RT) clearTimeout(window.RT);
            window.RT = setTimeout(function()
            {
              this.location.reload(false); /* false to get page from cache */
            }, 200);
          });      
        } else {
          $(window).resize(function(){
            drawChart();
          });  
        }   
      });
      
    </script>
    <script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->
  </body>
</html>
