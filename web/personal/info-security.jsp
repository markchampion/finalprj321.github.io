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
        <div class="container-fluid bg-light-blue" style="height: 50px">          
        </div>
        <div class="container d-flex bg-light col-lg-6 p-0">
            <jsp:include page="info-submenu.jsp" />
            <div class="info-tab-detail border-right border-bottom p-3 col-lg-9">
                <h4>Login Information</h4>
                <table>
                    <tr><td>Username: </td><td>${sessionScope.logStatus.username}</td><td><a href="">Update</a></tr>
                    <tr><td>Email: </td><td>${sessionScope.logStatus.email}</td>   <td><a href="">Update</a></tr>
                    <tr><td>Role: </td><td>${sessionScope.logStatus.username}</td>   <td><a href="">Update</a></tr>
                    <tr><td>Password </td><td>*********</td> <td><a href="">Update</a></tr>
                </table>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
    <!--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>-->
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>-->
        <!--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>-->
    </body>
</html>
