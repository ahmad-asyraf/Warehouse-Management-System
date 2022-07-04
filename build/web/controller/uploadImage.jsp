<%-- 
    Document   : uploadImage
    Created on : 8 Jun 2022, 12:39:34 pm
    Author     : Asyraf
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.io.*"%>
<%@page import="model.connectionDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            String type = request.getParameter("imageType");
            String uid = request.getParameter("uid");  
            String myloc = request.getParameter("profilePicture");
            
            connectionDao con = new connectionDao();
            File image = new File(myloc);
            
            String sql = "INSERT INTO images(imageName,imageType,userid) VALUES(?,?,?)";
            PreparedStatement ps = con.getConnection().prepareStatement(sql);
            ps.setString(2, type);
            ps.setString(3, uid);
            FileInputStream fis = new FileInputStream(image);
            ps.setBinaryStream(1, (InputStream) fis, (int)(image.length()));
            
            int count = ps.executeUpdate();
            if(count > 0) {
                out.print("Image insert success");
            }
            else {
                out.print("Failed to insert image");
            }
        %>
        <%--
            String saveFile = "";
            String contentType = request.getContentType();
            String type = request.getParameter("imageType");
            String uid = request.getParameter("uid");
            
            if((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
                DataInputStream in = new DataInputStream(request.getInputStream());
                int formDataLength = request.getContentLength();
                byte dataBytes[] = new byte[formDataLength];
                int byteRead = 0;
                int totalBytesRead = 0;
                while(totalBytesRead < formDataLength) {
                    byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                    totalBytesRead += byteRead;
                }
                
                String file = new String(dataBytes);
                saveFile = file.substring(file.indexOf("filenme=\"") + 10);
                saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
                int lastIndex = contentType.lastIndexOf("=");
                String boundary = contentType.substring(lastIndex + 1, contentType.length());
                
                int pos;
                pos = file.indexOf("filename=\"");
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                
                int boundaryLocation = file.indexOf(boundary, pos) - 4;
                int startPos = ((file.substring(0, pos)).getBytes()).length;
                int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
                
                File ff = new File("C:/Users/aimas/OneDrive - umt.edu.my/Documents/CSA3999/Warehouse/web/images/" + saveFile);
                FileOutputStream fileOut = new FileOutputStream(ff);
                fileOut.write(dataBytes, startPos, (endPos - startPos));
                fileOut.flush();
                fileOut.close();
                
                connectionDao con = new connectionDao();
            
                String sql = "INSERT INTO images(imageName,imageType,userid) VALUES(?,?,?)";
                PreparedStatement ps = con.getConnection().prepareStatement(sql);
                ps.setString(1, ff.getPath());
                ps.setString(2, type);
                ps.setString(3, uid);
                
                int result = ps.executeUpdate();
                if(result > 0) {
                    out.print("Image upload success");
                }
                else {
                    out.print("Failed to upload image!");
                }
            }
        %>
        
        <%= saveFile %>
        --%>
    </body>
</html>
