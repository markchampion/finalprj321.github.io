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
        <div class="container bg-light p-0 shadow rounded col-9" style="height: 500px">
            <div class="sub-container p-5 row">
                <jsp:include page="info-submenu.jsp" />
                <div class="info-tab-detail border-right border-bottom p-3 col-lg-9">
                    <h4>Login Information</h4>
                    <table class="table" id="pass-info">
                        <tr><td>Username: </td><td>${sessionScope.logStatus.username}</td></tr>

                        <tr id="phone-info"><td>Phone:</td><td id="updated-phone">${sessionScope.logStatus.phone}</td><td>
                                <button onclick="hideAndShow('phone', false)" id="up-phone" class="btn btn-success">Update</button></td></tr>

                        <!--phone update-->
                        <tr id="phone-update" style="display: none"><td>Phone:</td><td>
                                <input type="text" id="re-phone" value="${sessionScope.logStatus.phone}" class="form-control" name="phone" pattern="\d{10}" /></td>
                            <td><button id="save-phone" class="btn btn-success" onclick="submitData('phone', $('#re-phone').val())">Save</button>
                            <button onclick="hideAndShow('phone', true)" type="button" id="cancel-pass" class="btn btn-danger">Cancel</button>
                            </td></tr>
                        <!--email update-->
                        <tr id="email-info"><td>Email: </td><td id="updated-email">${sessionScope.logStatus.email}</td><td>
                                <button onclick="hideAndShow('email', false)" id="up-email" class="btn btn-success">Update</button></tr>
                        <tr id="email-update" style="display: none"><td>New Email:</td><td>
                                <input type="email" id="re-email" class="form-control" name="email" />
                                <span id="status-email" style="display:none">Your email has been used</span>
                            </td>
                            <td><button id="save-email" class="btn btn-success" onclick="submitData('email', $('#re-email').val())">Save</button>
                            <button onclick="hideAndShow('email', true)" type="button" id="cancel-pass" class="btn btn-danger">Cancel</button>
                            </td></tr>

                        <!--pass update-->
                        <tr><td>Password </td><td>*********</td> <td><button onclick="hideAndShow('pass', false)" id="up-pass" class="btn btn-success">Update</button></tr>
                    </table>
                    <form id="pass-update" method="post" style="display: none" action="/PRJ321_FINAL_PROJECT/verify.do">
                        <table class="table">
                            <tr><td>Your old-password:  </td><td><input class="form-control col-5" type="password" name="oldPass"/><span id="status-pass" style="display:none">Your old-password is incorrect</span></td></tr>
                            <tr><td>New password: </td><td><input id="newpass" class="form-control col-5" type="password" name="newPass"/></td></tr>
                            <tr><td>Re-new Password: </td><td><input class="form-control col-5"type="password"  name="renewPass" /></td></tr>
                        </table>
                        <input class="btn btn-success" onclick="submitChangePass()()" type="button" value="Save" />
                        <button onclick="hideAndShow('pass', true)" type="button" id="cancel-pass" class="btn btn-danger">Cancel</button>
                        <input type="hidden" name="from" value="changePass" />
                        <input type="hidden" name="username" value="${sessionScope.logStatus.username}" />
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
        <script>
            function submitChangePass() {
                $.post(
                        '/PRJ321_FINAL_PROJECT/verify.do',
                        $('#pass-update').serialize(),
                        (status) => {
                        if (status === 'false') {
                            $('#status-pass').css('display', '');
                        } else {
                            $('#pass-update').trigger('reset');
                            hideAndShow('pass', true);
                        }
                    }
                );
            }
            function submitData(fieldName, value) {
                $.post(
                        '/PRJ321_FINAL_PROJECT/verify.do',
                        {fieldName: fieldName, data: value, username: '${sessionScope.logStatus.username}', from: 'security'},
                        (status) => {
                        if (status === 'true'){
                            hideAndShow(fieldName, true);
                            $('#re-'+fieldName).val('');
                            $('#updated-'+fieldName).html(value)
                        }
                        else {
                            $('#status-email').show();
                        }
                    }
                );
            }
            function hideAndShow(prefix, reverse) {
                if (!reverse) {
                    $('#' + prefix + '-info').fadeToggle(1);
                    $('#' + prefix + '-update').fadeToggle(500);
                } else {
                    $('#' + prefix + '-info').fadeToggle(500);
                    $('#' + prefix + '-update').fadeToggle(1);
                }
            }
//            $('#up-phone').on('click', hideAndShow('phone'));
//            $('#up-pass').on('click', hideAndShow('table'));
//            $('#cancel-pass').on('click', hideAndShow('table'));
        </script>
    </body>
</html>
