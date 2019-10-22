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
        <div class="container d-flex bg-light col-lg-6">
            <div class="info-tab-column col-lg-3 p-0">
                <div class="info-sub-tab d-flex border-left border-bottom p-2">
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
                <div class="info-sub-tab d-flex border p-2">
                    <a href="info-uploaded.jsp"><span>
                            <img src="img/usericon.png" width="48" height="48" />
                            Song uploaded
                        </span></a>
                </div>
            </div>
            <div class="info-tab-detail border-right border-bottom p-3 col-lg-9">
                <h4>Login Information</h4>
                <table border="1">
                    <tr><td>Username: </td><td>${sessionScope.logStatus.username}</td></tr>
                    <tr><td>Email: </td><td>${sessionScope.logStatus.email}</td>   <td><a href="">Update</a></tr>
                    <tr><td>Phone: </td><td>${sessionScope.logStatus.phone}</td>   <td><a href="">Update</a></tr>
                    <tr><td>Password </td><td>********</td> <td><a href="">Update</a></tr>

                </table>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
