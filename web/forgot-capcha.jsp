<%-- 
    Document   : forgot-capcha
    Created on : Nov 2, 2019, 9:59:33 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cookie c[] = request.getCookies();
    boolean found = false;
    for (Cookie e : c) {
        if (e.getName().equals("forgotEmail")) {
            if (!e.getValue().isEmpty()) {
                found = true;
            }
        }
    }
    if (!found) {
        response.sendRedirect("/PRJ321_FINAL_PROJECT/forgot.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="newHeader.jsp" />
        <div class="container col-4 pt-5">
            <div id="form-1"  class="rounded shadow" style="background-color: whitesmoke;">
                <h3 class="pl-3 pt-4 m-0 text-center">Forgot Account</h3>
                <form class="row pt-5 pl-5 pr-5 pb-1" id="sign-in" method="post">
                    <div id="re-capcha">
                        <h6>Enter your verification code:</h6>
                        <p class="w-100"></p>
                        <div class="input-group-prepend">
                            <span class="input-group-text"><img src="img/passicon.png" width="24" height="24"/></span>
                        </div>
                        <input type="text" id="capcha" class="form-control" placeholder="Code" name="code" required />
                    </div>
                    <input type="hidden" name="action" value="" />
                    <p class="col-9"></p>
                    <button type="button" id="submit" class="btn btn-block btn-success mb-3" onclick="submitCapcha()">
                        <span id="loading" style="display: none">
                            <span class='spinner-border spinner-border-sm' role='status' aria-hidden='true'></span>Loading...       
                        </span>
                        <span id="idle">
                            Next
                        </span>
                    </button>
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
            function submitCapcha() {
                var post = $('#capcha').val();
                $('#loading').css('display', '');
                $('#idle').css('display', 'none');
                $('#submit').attr('disabled', true);
                $.post(
                        '/PRJ321_FINAL_PROJECT/verify.do',
                        {capcha: post, from: 'capcha'},
                        (responseText) => {
                        console.log(responseText);
                    if (responseText === 'success') {
                        window.location.href = '/PRJ321_FINAL_PROJECT/forgot-renew.jsp';
                    } else {
                        $('#wrong-email').text('Your capcha is not correct');
                    }
                }
                );
            }

        </script>
    </body>
</html>
