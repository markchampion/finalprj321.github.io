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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../newHeader.jsp" %>
        <div class="container bg-light p-0 shadow rounded col-9" style="height: 500px">
            <div class="sub-container p-5 row">
                <jsp:include page="info-submenu.jsp" />
                <div class="info-tab-detail p-3 col-9">
                    <div class="d-flex align-items-center">
                        <h4>Login Information</h4>
                        <p class="mb-0 ml-auto"><button id="btn-update" class="btn btn-success">Update</button></p>
                    </div>
                    <table id="table-info" class="table">
                        <tr><td>First Name:  </td><td>${sessionScope.logStatus.firstName}</td></tr>
                        <tr><td>Last Name: </td><td>${sessionScope.logStatus.lastName}</td>  </tr>
                        <tr><td>Phone: </td><td>${sessionScope.logStatus.phone}</td>  </tr>
                        <tr><td>Address: </td><td>${sessionScope.logStatus.address}</td> </tr>
                        <tr><td>Avatar </td><td><img class="rounded-circle" src="${sessionScope.logStatus.avatar}" width="48" height="48"/>
                            </td></tr>
                    </table>
                    <form id="table-update" method="post" style="display: none" enctype="multipart/form-data" action="/PRJ321_FINAL_PROJECT/update.do">
                        <table class="table">
                            <tr><td>First Name:  </td><td><input class="form-control col-5" type="text" value="${sessionScope.logStatus.firstName}" name="firstname"/></td></tr>
                            <tr><td>Last Name: </td><td><input class="form-control col-5" type="text" value="${sessionScope.logStatus.lastName}" name="lastname"/></td></tr>
                            <tr><td>Phone: </td><td><input class="form-control col-5"type="text" value="${sessionScope.logStatus.phone}" name="phone" /></td></tr>
                            <tr><td>Address: </td><td><input class="form-control col-5" type="text" value="${sessionScope.logStatus.address}" name="address"/></td></tr>
                            <tr><td>Avatar </td><td><img class="rounded-circle" src="${sessionScope.logStatus.avatar}" width="48" height="48"/>
                                    <label for="avatar" class="btn btn-success">Change avatar</label>
                                    <input id="avatar" style="opacity: 0;position: absolute; z-index: -1" type="file" accept=".jpg,.png" name="fileavatar"/> 
                                </td></tr>
                        </table>
                            <input class="btn btn-success" type="submit" value="Save" />
                            <button type="button" id="cancel" class="btn btn-danger">Cancel</button>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="../footer.jsp" %>
        <script>
            $('input[type=file]').change(function () {
    console.log(this.files[0].mozFullPath);
});
            $('#btn-update').click(function() {
                $('#table-info').css('display','none');
                $('#table-update').css('display','');
            });
            $('#cancel').click(function() {
                $('#table-info').css('display','');
                $('#table-update').css('display','none');
            });
        </script>
    </body>
</html>
