<%-- 
    Document   : DisplayImage
    Created on : Sep 21, 2015, 5:40:45 AM
    Author     : harshal
--%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%!
public Blob image = null;
Connection con = null;
public byte[ ] imgData = null ;
public OutputStream o;
%>


 <%    Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eindia","root","");
            Statement statement = con.createStatement(); 
            String username=session.getAttribute("username").toString();
            ResultSet resultset = statement.executeQuery("select photo from documents where uname='"+username+"';") ; 
            if(!resultset.next()) {
                out.println("Sorry, could not find that publisher. ");
            } else {                
    image = resultset.getBlob(1);
    imgData = image.getBytes(1,(int)image.length());
       o = response.getOutputStream();%>
<table>
    
    <tr><td><img src="<%response.setContentType("image/jpg");
                 o.write(imgData);
                 o.close();%>"> </td></tr>
    
</table>
<BR>
       <% 
           } 
       %>
        </BODY>
</HTML>