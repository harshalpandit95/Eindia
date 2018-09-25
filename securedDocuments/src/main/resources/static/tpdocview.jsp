
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>

<%
    if (session.getAttribute("username") == null && session.getAttribute("password") == null ) 
    {
     response.sendRedirect("index.jsp");
    }
    %>
<%!String sub;%>
<%
    Connection con=null;
Statement stmt=null;
ResultSet rs=null;
ArrayList<String> obj=null;
ArrayList<String> obj1=null;
Iterator<String> ii=null;
Iterator<String> ii1=null;
int count=0;
int incre=0;
    try
{

Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eindia","root","");
stmt=con.createStatement();
String aes=session.getAttribute("aes").toString();
//out.print(""+aes);
int start=aes.indexOf("E");
int last=aes.lastIndexOf("'");



sub=aes.substring(start, last);
String e=aes.substring(aes.lastIndexOf("EIN"));
out.print(""+sub);
session.setAttribute("sub", sub);
rs=stmt.executeQuery(aes);
byte iVal[];
String s=null;


List list =null;
obj=new ArrayList<String>();
obj1=new ArrayList<String>();
 ResultSetMetaData rsmd = rs.getMetaData();
if(rs.next()){
    for(int a=1;a<=rsmd.getColumnCount();a++){
        
iVal = rs.getBytes(a);
if(iVal==null){
  

}
 
else{

 s=rsmd.getColumnName(a);
 obj1.add(s);
if(s.equals("photo")){
    s="Photo";
}
else if(s.equals("pan_card")){
      s="Pan Card";
}
else if(s.equals("passport")){
      s="Passport";
}
else if(s.equals("vote_card")){
      s="Voting-Card";
}
else if(s.equals("caste_cert")){
      s="Caste Certificate";
}
else if(s.equals("electricity_bill")){
      s="Electricity Bill";
}
else if(s.equals("adhar_card")){
      s="Adhar Card";
}else if(s.equals("ration_card")){
      s="Ration Card";
}else if(s.equals("d_licence")){
      s="Driving Licence";
}else if(s.equals("birth_cert")){
      s="Birth Certificate";
}else if(s.equals("uncat_file")){
      s="Uncat File";
}

 obj.add(s);
ii=obj.iterator();
ii1=obj1.iterator();
 count++;
     

}
 
 }
  
}
  
}
catch(Exception e){}

   //String pattern = "[\\[\\]]";
       // String result = obj.toString().replaceAll(pattern, "");
    
    
%>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>Documents</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
     <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
   
  
   

  
  <script>
    
      function resoudre(elem) {
       $("a").click(function() {
    var id=this.id;
    switch(id){
        case "photo":
         $("#ViewPhoto").modal("show"); 
         break;
         
         case "pan_card":
         $("#ViewPan").modal("show"); 
          break;
          
          case "passport":
        $("#ViewPass").modal("show");  
          break;
          case "vote_card":
         $("#ViewVote").modal("show"); 
          break;  
      case "caste_cert":
           $("#ViewCaste").modal("show"); 
          break;
           case "electricity_bill":
               $("#ViewElectricity").modal("show"); 
          break;
           case "adhar_card":
               $("#ViewAdhar").modal("show"); 
          break;
           case "ration_card":
                $("#ViewRation").modal("show"); 
          break;
           case "d_licence":
               $("#ViewLicence").modal("show");
          break;
           case "birth_cert":
                 $("#ViewBC").modal("show"); 
          break;
          case "uncat_file":
             $("#ViewUncat").modal("show"); 
          break;
          
          
    }

      
        // or alert($(this).attr('id'));
});

   

// now get the values from the table
  
    
    // $("#ViewPhoto").modal("show");

   
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
     <li><a href="thirdparty.jsp"><i class="fa fa-home fa-fw"></i>PROFILE</a></li>
            <li><a href="scan.jsp"  class="active"><i class="fa fa-user-plus fa-fw"></i>Scan QRCODE</a></li>
            <li><a href="tpsetting.jsp"><i class="fa  fa-database fa-fw"></i>Setting</a></li>
            <li><a href="logout"><i class="fa  fa-sign-out fa-fw"></i>LOG OUT</a></li>
          </ul>  
        </nav>
      </div>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">
        
        <div class="templatemo-content-container">
            <div class="templatemo-content-widget white-bg">
                   <h2 class="margin-bottom-10">LIST OF DOCUMENTS</h2>
            <div class="panel panel-default table-responsive">
     
         
              <table class="table table-striped table-bordered templatemo-user-table">
                 
              <table class="table table-striped table-bordered templatemo-user-table">
                <thead>
                  <tr>
                    <td>#</td>
                    <td>Document Name</td>
                    <td>E-Signed</td>
                    <td>View</td>
                 
                  </tr>
                </thead>
                <tbody>    
                <%while(ii.hasNext() && ii1.hasNext())
                {Object element=ii.next(); Object element1=ii1.next(); incre++;%> <tr>
                    <td><%=incre%></td>
                    <td><%=element%></td>
                    <td>Yes</td>
                    <td><a class="templatemo-edit-btn" id="<%=element1%>"  onclick="resoudre(this);">View</a></td>
                    
                </tr>
                
                <%}%>
        
                </tbody>
              </table>  
               
           

                   </div>
               
                 <div class="col-lg-6 col-md-4 form-group">   
                 </div>   
         
            </div>          
 
          <footer class="text-right">
            <p>Copyright &copy;  
            |  <a href="http://www.eindia.com" target="_parent">E-India</a></p>
          </footer>         
        </div>
      </div>
    </div>
                 
                 
                 
                  <div class="container">
 

  <!-- Modal to display photo -->
  <div class="modal fade" id="ViewPhoto" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>                  
     <div class="modal-body">
         <center> <img src='userDisplay_1.jsp?documents=photo' height='300' width='300'>
          </center>
          </br>
      </div>   
    </div>
  </div>
</div>
  
<!-- to display pan card-->  
   <div class="modal fade" id="ViewPan" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>                  
     <div class="modal-body">
          <center> <img src='userDisplay_1.jsp?documents=pan_card' height='300' width='300'>
          </center>
          </br>
      </div>   
    </div>
  </div>
</div>
 <!-- to display passport-->  
   <div class="modal fade" id="ViewPass" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>                  
     <div class="modal-body">
          <center> <img src='userDisplay.jsp?documents=passport' height='300' width='300'>
          </center>
          </br>
      </div>   
    </div>
  </div>
</div> 
  <!-- Modal to display voter card -->
  <div class="modal fade" id="ViewVote" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>                  
     <div class="modal-body">
          <center> <img src='userDisplay.jsp?documents=vote_card' height='300' width='300'>
          </center>
          </br>
      </div>   
    </div>
  </div>
</div>
  <!-- Modal to display caste cert -->
  <div class="modal fade" id="ViewCaste" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>                  
     <div class="modal-body">
          <center> <img src='userDisplay_1.jsp?documents=caste_cert' height='300' width='300'>
          </center>
          </br>
      </div>   
    </div>
  </div>
</div>
  <!-- Modal to display electricity bill -->
  <div class="modal fade" id="ViewElectricity" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>                  
     <div class="modal-body">
          <center> <img src='userDisplay_1.jsp?documents=electricity_bill' height='300' width='300'>
          </center>
          </br>
      </div>   
    </div>
  </div>
</div>
   <!-- Modal to display Adhar -->
  <div class="modal fade" id="ViewAdhar" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>                  
     <div class="modal-body">
          <center> <img src='userDisplay_1.jsp?documents=adhar_card' height='300' width='300'>
          </center>
          </br>
      </div>   
    </div>
  </div>
  
  </div>
  <!-- Modal to display Ration Card -->
  <div class="modal fade" id="ViewRation" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>                  
     <div class="modal-body">
          <center> <img src='userDisplay_1.jsp?documents=ration_card' height='300' width='300'>
          </center>
          </br>
      </div>   
    </div>
  </div>
  
  </div>
    <!-- Modal to display licence -->
  <div class="modal fade" id="ViewLicence" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>                  
     <div class="modal-body">
          <center> <img src='userDisplay_1.jsp?documents=d_licence' height='300' width='300'>
          </center>
          </br>
      </div>   
    </div>
  </div>
  
  </div>
  
  <!-- Modal to birthcert -->
  <div class="modal fade" id="ViewBC" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>                  
     <div class="modal-body">
          <center> <img src='userDisplay_1.jsp?documents=birth_cert' height='300' width='300'>
          </center>
          </br>
      </div>   
    </div>
  </div>
  
  </div>
   <!-- Modal to uncat -->
  <div class="modal fade" id="ViewUncat" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>                  
     <div class="modal-body">
          <center> <img src='userDisplay_1.jsp?documents=uncat_file' height='300' width='300'>
          </center>
          </br>
      </div>   
    </div>
  </div>
  
  </div>
  
  
  
  
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
    
  
    </div>
 
 


    
    
    
  
     

    
    
    
    
    
    
    
    
     <c:if test="${sessionScope.message != null}">    
  <script>
  
    $("#myModal").modal("show");
    <%session.removeAttribute("message");%>
</script>
    
</c:if> 
    




  </body>
</html>