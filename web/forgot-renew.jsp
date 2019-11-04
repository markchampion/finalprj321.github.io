<%-- 
    Document   : forgot-renew
    Created on : Nov 2, 2019, 9:59:44 PM
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
        <div id="re-pass">
            <div class="input-group mb-3 d-flex">
                <div class="input-group-prepend">
                    <span class="input-group-text"><img src="img/usericon.png" width="24" height="24"/></span>
                </div>
                <input type="text" class="form-control" placeholder="Your username" value="${cookie['username'].getValue()}" name="username" required />
            </div>
            <div class="input-group mb-3">
                <div class="input-group-append">
                    <span class="input-group-text"><img src="img/passicon.png" width="24" height="24"/></span>
                </div>
                <input type="password" class="form-control" placeholder="Your Password"value="${cookie['password'].getValue()}" name="password" required />
            </div>
            <input type="hidden" name="action" value="" />
            <p class="col-9"></p>
            <button type="submit" class="btn btn-block btn-success mb-3">Next</button>
        </div>
    </body>
</html>
