<%-- 
    Document   : register
    Created on : Nov 3, 2019, 6:44:37 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/footer.css" />
        <link rel="stylesheet" href="css/login.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="newHeader.jsp" %>
        <div class="t-login-form mt-5 mb-5">
            <div id="form-1 row rounded shadow" class="t-login-form-inner">
                <h3 class="m-3 text-center">Register</h3>
                <div class="avatar">
                    <img src="img/register.png" width="150px"/>
                </div>
                <form class="m-3" id="sign-up" action="signin.do" method="post">
                    <div class="input-group mb-3 d-flex">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><img src="img/usericon.png" width="24" height="24"/></span>
                        </div>
                        <input type="text" class="form-control" placeholder="Your First Name" name="firstname" required />
                    </div>
                    <div class="input-group mb-3 d-flex">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><img src="img/usericon.png" width="24" height="24"/></span>
                        </div>
                        <input type="text" class="form-control" placeholder="Your Last Name" name="lastname" required />
                    </div>
                    <div class="input-group mb-3 d-flex">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><img src="img/usericon.png" width="24" height="24"/></span>
                        </div>
                        <input type="text" class="form-control" placeholder="Your username" name="username" onchange="checkUserExist(this.value)" required />
                        <span id="user-exist"></span>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-append">
                            <span class="input-group-text"><img src="img/passicon.png" width="24" height="24"/></span>
                        </div>
                        <input type="password" class="form-control" id="password" placeholder="Your Password" name="password" required />
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-append">
                            <span class="input-group-text"><img src="img/passicon.png" width="24" height="24"/></span>
                        </div>
                        <input type="password" class="form-control" id="cfpassword" placeholder="Re-enter Password" name="cfpassword" required />
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-append">
                            <span class="input-group-text"><img src="img/passicon.png" width="24" height="24"/></span>
                        </div>
                        <input type="email" class="form-control" placeholder="Your Email" name="email" required onchange="checkMailExist(this.value)" />
                        <span id="email-exist"></span>
                    </div>
                    <input type="hidden" name="action" value="register" />
                    <button type="submit" class="btn btn-success btn-block mb-3">Register</button>
                    <a class="btn btn-block btn-primary" href="/PRJ321_FINAL_PROJECT/login.jsp">Login</a>
                </form>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
        <script>
            $('#sign-up').submit(function (e) {
                var test1 = $('#email-exist').text();
                var test2 = $('#user-exist').text();
                if (test1 || test2) {
                    return false;
                } else return true;
            });
            $('#sign-up').validate({
                rules: {
                    password: {
                        minlength: 6
                    },
                    cfpassword: {
                        equalTo: '#password'
                    }
                }
            });
            function checkMailExist(email) {
                $.post(
                        'verify.do',
                        {email: email, from: 'registerEmail'},
                        (responseText) => {
                    $('#email-exist').text(responseText);
                });
            }
            function checkUserExist(email) {
                $.post(
                        'verify.do',
                        {user: email, from: 'registerUser'},
                        (responseText) => {
                    $('#user-exist').text(responseText);
                });
            }
        </script>
    </body>
</html>
