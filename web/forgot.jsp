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
        <jsp:include page="newHeader.jsp" />
        <div class="container col-4 pt-5">
            <div id="form-1"  class="rounded shadow" style="background-color: whitesmoke;">
                <h3 class="pl-3 pt-4 m-0 text-center">Forgot Account</h3>
                <form class="row pt-5 pl-5 pr-5 pb-1" id="sign-in" method="post">
                    <div class="input-group mb-3 d-flex" id="re-email">
                        <h5>Enter your registered Email:</h5>
                        <p class="w-100"></p>
                        <div class="input-group-prepend">
                            <span class="input-group-text"><img src="img/email.png" width="24" height="24"/></span>
                        </div>
                        <input type="text" class="form-control" placeholder="Your email" id="email" name="email" required />
                        <span id="wrong-email"></span>
                    </div>
                    <input type="hidden" name="action" value="" />
                    <p class="col-9"></p>
                    <button type="button" class="btn btn-block btn-success mb-3" onclick="submitEmail()">Next</button>
                </form>
                <div class="pb-3">
                    <!--<a class="p-1 pl-5 light-silver" href="">Forgot your pasword?</a>-->
                    <div class="w-100"></div>
                    <a class="text-center pl-5 p-1 light-silver mb-5"  href="">Don't have a account? Register Now!!!</a>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
        <script>
             function submitEmail() {
                var post = $('#email').val();
                $.post(
                        '/PRJ321_FINAL_PROJECT/verify.do',
                        {email: post, from: 'forgot'},
                        (responseText) => {
                            if(responseText == 'success'){
                                $('#sign-in').load('/PRJ321_FINAL_PROJECT/forgot-capcha.jsp', function () {}).hide().fadeIn();
                            } else {
                                $('#wrong-email').text('Your email is not correct');
                            }
                        });
            }
            
        </script>
    </body>
</html>
