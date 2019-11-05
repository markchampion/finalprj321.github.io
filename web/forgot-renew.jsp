<%-- 
    Document   : forgot-renew
    Created on : Nov 2, 2019, 9:59:44 PM
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
                    <div class="input-group mb-3 d-flex">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><img src="img/usericon.png" width="24" height="24"/></span>
                        </div>
                        <input type="text" class="form-control" placeholder="Your Old Pass"  name="oldPass" required />
                        <span id="errorLog"></span>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-append">
                            <span class="input-group-text"><img src="img/passicon.png" width="24" height="24"/></span>
                        </div>
                        <input type="password" class="form-control newPass" placeholder="Your New Password" name="newPass" required />
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-append">
                            <span class="input-group-text"><img src="img/passicon.png" width="24" height="24"/></span>
                        </div>
                        <input type="password" class="form-control" placeholder="Re - Password" name="cfnewPass" required />
                    </div>
                    <input type="hidden" name="email" value="${sessionScope.forgotEmail}" />
                    <input type="hidden" name="action" value="renewPass" />
                    <p class="col-9"></p>
                    <button type="submit" id="submit" class="btn btn-block btn-success mb-3">
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
            $('#sign-in').validate({
                rules: {
                    newPass: {
                        minlength: 6
                    },
                    cfnewPass: {
                        equalTo: '.newPass'
                    }
                },
                submitHandler: function () {
                    $('#loading').css('display', '');
                    $('#idle').css('display', 'none');
                    $('#submit').attr('disabled', true);
                    $.ajax({
                        url: "/PRJ321_FINAL_PROJECT/verify.do",
                        type: 'POST',
                        dataType: 'json',
                        contentType: 'application/json;charset=UTF-8',
                        mimeType: 'application/json',
                        data: {obj: $('#add-form').serialize(), from: 'renewPass'},
                        success: function (status) {
                            if (status === 200) {
                                document.cookie = "forgotEmail =;expires=Thu, 01 Jan 1970 00:00:01 GMT;";
                                window.location.href = '/PRJ321_FINAL_PROJECT/forgot-success.jsp';
                            } else if (status === 401) {
                                $('#errorLog').text('Your password is not correct!!!');
                            }
                        },
                        error: function (status) {
                        }
                    });
                }
            });

        </script>
    </body>
</html>
