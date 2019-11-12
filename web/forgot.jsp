<%-- 
    Document   : forgot
    Created on : Nov 2, 2019, 9:40:36 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .hidden{
                display:none;
            }
        </style>
    </head>
    <body>
       <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/login.css" />
    </head>
    <body>
        <jsp:include page="newHeader.jsp" />
        <div class="t-login-form mt-5 mb-5">
            <div id="form-1"  class="t-login-form-inner" style="background-color: whitesmoke;">
                <h3 class="mt-3 mb-3 text-center">Forgot Password</h3>
                <div class="avatar text-center" style="background: #ffc107;">
                    <img src="img/forgot.png" width="150px"/>
                </div>
                <form class="row m-3" id="sign-in" method="post">
                    <div class="input-group mb-1 d-flex" id="re-email">
                        <h5>Enter your registered Email:</h5>
                        <p class="w-100"></p>
                        <div class="input-group-prepend">
                            <span class="input-group-text"><img src="img/email.png" width="24" height="24"/></span>
                        </div>
                        <input type="email" class="form-control" placeholder="Your email" id="email" name="email" required />
                    </div>
                    <span id="wrong-email" style="color: red"></span>
                    <input type="hidden" name="action" value="" />
                    <p class="col-9"></p>
                    <button type="button" id="submit" class="btn btn-block btn-success mb-1" onclick="submitEmail()">
                        <span id="loading" style="display: none">
                            <span class='spinner-border spinner-border-sm' role='status' aria-hidden='true'></span>Loading...       
                        </span>
                        <span id="idle">
                            Next
                        </span>
                    </button>
                    <a class="btn btn-primary btn-block text-light"  href="login.jsp">Login</a>
                    <a class="btn btn-warning btn-block text-light"  href="register.jsp">Register</a>
                </form>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
        <script>
            function submitEmail() {
                var post = $('#email').val();
                $('#loading').css('display', '');
                $('#idle').css('display', 'none');
                $('#submit').attr('disabled', true);
                $.ajax({
                    url: "/PRJ321_FINAL_PROJECT/verify.do",
                    type: 'POST',
                    dataType: false,
                    data: {email: post, from: 'forgot'},
                    success: function (responseText) {
                        if (responseText === 'success') {
                                window.location.href = '/PRJ321_FINAL_PROJECT/forgot-capcha.jsp';
                        } else {
                            $('#wrong-email').text('Your email is not correct');
                            $('#submit').attr('disabled', false);
                            $('#loading').css('display', 'none');
                            $('#idle').css('display', '');
                        }
                    },
                    complete: function () {
                        $('#loading').css('display', 'none');
                        $('#idle').css('display', '');
                    }
                });
            }
        </script>
    </body>
</html>
