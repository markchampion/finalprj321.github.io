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
        <%@include file="../newHeader.jsp" %>
        <div class="container-fluid bg-light-blue" style="height: 50px">          
        </div>
        <div class="container d-flex bg-light col-lg-6 p-0">
            <jsp:include page="info-submenu.jsp" />
            <div class="info-tab-detail border-right border-bottom p-3 col-lg-9">
                <div class="d-flex align-items-center">
                    <h4>Login Information</h4>
                    <p class="mb-0 ml-auto"><button id="btn-update">Update</button></p>
                </div>
                <table>
                    <tr><td>First Name:  </td><td>${sessionScope.logStatus.firstName}</td></tr>
                    <tr><td>Last Name: </td><td>${sessionScope.logStatus.lastName}</td>  </tr>
                    <tr><td>Phone: </td><td>${sessionScope.logStatus.phone}</td>  </tr>
                    <tr><td>Address: </td><td>${sessionScope.logStatus.address}</td> </tr>
                    <tr><td>Avatar </td><td><img src="${sessionScope.logStatus.avatar}" width="48" height="48"/></td></tr>
                </table>

            </div>
        </div>
        <%@include file="../footer.jsp" %>
    </body>
</html>
