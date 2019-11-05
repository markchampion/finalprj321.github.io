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
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="../newHeader.jsp" />
        <div class="container bg-light p-0 shadow rounded col-9" style="height: 500px">
            <div class="sub-container p-5 row">
                <jsp:include page="info-submenu.jsp" />
                <div class="info-tab-detail border-right border-bottom p-3 col-lg-9">
                    <h4>Login Information</h4>
                    <table class="table">
                        <tr><td>Username: </td><td>${sessionScope.logStatus.username}</td></tr>
                        <tr><td>Password </td><td>*********</td> <td><a href="">Update</a></tr>
                        <tr><td>Phone</td><td>${sessionScope.logStatus.phone}</td><td><a href="">Update</a></td></tr>
                        <tr><td>Email: </td><td>${sessionScope.logStatus.email}</td><td><a href="">Update</a></tr>
                    </table>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
        
    </body>
</html>
