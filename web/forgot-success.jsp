<%-- 
    Document   : forgot-success
    Created on : Nov 5, 2019, 11:31:18 AM
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
        <jsp:include page="newHeader.jsp" />
        <div class="container col-4 pt-5">
            <div id="form-1"  class="rounded shadow d-flex flex-column align-items-center justify-content-center" style="background-color: whitesmoke;height: 325px">
                <h3 class="">Restore Password Succeed</h3>
                <a href="login.jsp">Click Here To Login</a>
                <div class="pb-3">
                    <!--<a class="p-1 pl-5 light-silver" href="">Forgot your pasword?</a>-->
                    <div class="w-100"></div>
                    <a class="text-center pl-5 p-1 light-silver mb-5"  href="">Don't have a account? Register Now!!!</a>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
