<%-- 
    Document   : forgot-capcha
    Created on : Nov 2, 2019, 9:59:33 PM
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
        <div id="re-capcha">
            <h6>Enter your verification code:</h6>
            <p class="w-100"></p>
            <div class="input-group-prepend">
                <span class="input-group-text"><img src="img/passicon.png" width="24" height="24"/></span>
            </div>
            <input type="text" class="form-control" placeholder="Code" name="code" required />
        </div>
        <input type="hidden" name="action" value="" />
        <p class="col-9"></p>
        <button type="submit" class="btn btn-block btn-success mb-3">Next</button>
    </body>
</html>
