<%-- 
    Document   : personalpage
    Created on : Oct 11, 2019, 7:35:50 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%--<%@include file="../header.jsp" %>--%>
        <div class="container-fluid bg-light-blue" style="height: 50px">          
        </div>
        <div class="container d-flex">
            <div class="info-tab-column">
                <div class="info-sub-tab d-flex border p-2">
                    <span>
                        <img src="img/usericon.png" width="48" height="48" />
                        Personal information
                    </span>
                </div>
                <div class="info-sub-tab d-flex border p-2">
                    <span>
                        <img src="img/passicon.png" width="48" height="48" />
                        Security
                    </span>
                </div>
                <div class="info-sub-tab d-flex border-left border-bottom p-2">
                    <span>
                        <img src="img/usericon.png" width="48" height="48" />
                        Song uploaded

                    </span>
                </div>
            </div>
            <div class="info-tab-detail border-right border-bottom p-3 col-lg-9">
                <h4>Upload Songs</h4>
                <form action="list" method="post" enctype="multipart/form-data">
                    <table>
                        <tr><td>Song name: </td><td><input type="text" name="name" /></td></tr>
                        <tr><td>Author name: </td><td><input type="text" name="author" /></td></tr>
                        <tr><td>Singer name: </td><td><input type="text" name="singer" /></td></tr>
                        <tr><td>Genre: </td><td><input type="text" name="genre" /></td></tr>
                        <tr><td>Lyrics: </td><td><textarea cols="30"></textarea></td></tr>
                        <tr><td>Attach file: </td><td><input type="file" name="fileattach"/></td></tr>
                    </table>
                    <input type="submit" name="action" value="Add Song" />
                </form>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
