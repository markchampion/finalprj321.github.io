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
        <%@include file="newHeader.jsp" %>
        <div class="container-fluid bg-light-blue" style="height: 50px">          
        </div>
        <div class="container d-flex">
            <div class="info-tab-column">
                <div class="info-sub-tab d-flex border p-2">
                     <a href="infosetting.jsp"><span>
                        <img src="img/usericon.png" width="48" height="48" />
                        Personal information
                        </span></a>
                </div>
                <div class="info-sub-tab d-flex border p-2">
                     <a href="info-security.jsp"> <span>
                        <img src="img/passicon.png" width="48" height="48" />
                        Security
                        </span></a>
                </div>
                <div class="info-sub-tab d-flex border-left border-bottom p-2">
                    <a href="info-uploaded.jsp"><span>
                        <img src="img/usericon.png" width="48" height="48" />
                        Song uploaded
                        </span></a>
                </div>
            </div>
            <div class="info-tab-detail border-right border-bottom p-3 col-lg-9">
                <h4>Uploaded Songs</h4>
                <table>
                    <tr><td>Username: </td><td>....</td><td><a href="">Update</a></tr>
                    <tr><td>Email: </td><td>....</td>   <td><a href="">Update</a></tr>
                    <tr><td>Phone: </td><td>....</td>   <td><a href="">Update</a></tr>
                    <tr><td>Password </td><td>....</td> <td><a href="">Update</a></tr>
                </table>
                <a href="info-addsong.jsp"><button>Add Song</button></a>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
