<%-- 
    Document   : DisplayImage
    Created on : Sep 21, 2015, 5:40:45 AM
    Author     : harshal
--%>

<%@page import="java.security.Signature"%>
<%@page import="java.security.PublicKey"%>
<%@page import="java.security.KeyFactory"%>
<%@page import="java.security.spec.X509EncodedKeySpec"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%!
public Blob image = null;
Connection con = null;
public byte[ ] imgData = null ;
public OutputStream o;
File signature=null;
File public_ke=null;
File doc=null;
%>
<%!
   public boolean verify(File data_file,File public_key,File signature){
       boolean verifies=false; 
       try {
BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
FileInputStream keyfis = new FileInputStream(public_key);
byte[] encKey = new byte[keyfis.available()];  
keyfis.read(encKey);

keyfis.close();
X509EncodedKeySpec pubKeySpec = new X509EncodedKeySpec(encKey);
KeyFactory keyFactory = KeyFactory.getInstance("DSA", "SUN");
PublicKey pubKey =
    keyFactory.generatePublic(pubKeySpec);

FileInputStream sigfis = new FileInputStream(signature);
byte[] sigToVerify = new byte[sigfis.available()]; 
sigfis.read(sigToVerify);
sigfis.close();
Signature sig = Signature.getInstance("SHA1withDSA", "SUN");
sig.initVerify(pubKey);

FileInputStream datafis = new FileInputStream(data_file);
BufferedInputStream bufin = new BufferedInputStream(datafis);

byte[] buffer = new byte[1024];
int len;
while (bufin.available() != 0) {
    len = bufin.read(buffer);
    sig.update(buffer, 0, len);
};

bufin.close();
verifies = sig.verify(sigToVerify);

//System.out.println("signature verifies: " + verifies);
        } catch (Exception e) {
            System.err.println("Caught exception " + e.toString());
        }return verifies;
    }

    %>

 <%    Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eindia","root","");
            Statement statement = con.createStatement(); 
            String username=session.getAttribute("sub").toString();
            String parameter=request.getParameter("documents");
           
          
          
       
        String sig=parameter+"_sig";
        String p_key=parameter+"_public_key";
        try {
            Class.forName("com.mysql.jdbc.Driver");
              con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eindia","root","admin");
             statement = con.createStatement(); 
              ResultSet resultset = statement.executeQuery("select "+parameter+","+sig+","+p_key+" from documents where uname='"+username+"';") ; 
            if(!resultset.next()) {
          
            } else {   
                byte[] sig1=resultset.getBytes(2);
                signature=File.createTempFile("signature", ".txt");
                FileOutputStream os1 = new FileOutputStream(signature);
                os1.write(sig1);
                os1.close();
          
           byte[] public_key=resultset.getBytes(3);
     public_ke=File.createTempFile("public_ke", ".txt");
      FileOutputStream os2 = new FileOutputStream(public_ke);
          os2.write(public_key);
          os2.close();
           byte[] f=resultset.getBytes(1);
     doc=File.createTempFile("doc", ".jpg");
      FileOutputStream os3 = new FileOutputStream(doc);
          os3.write(f);
          os3.close();
        boolean b=verify(doc, public_ke, signature);
      
      out.print(b);
        if(b=true)
        { image = resultset.getBlob(1);
    imgData = image.getBytes(1,(int)image.length());
       o = response.getOutputStream();
        
      
       
 %>
<table>
    
    <tr><td><img src="<%response.setContentType("image/jpg");
                 o.write(imgData);
                 o.close();%>"> </td></tr>
    
</table>
<BR>
       <% }
         }
        }  catch (ClassNotFoundException ex) {
       
        } catch (SQLException ex) {
       
    }
        
       %>
        </BODY>
</HTML>
