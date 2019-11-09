<%-- 
    Document   : info-writer
    Created on : Oct 25, 2019, 10:17:36 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="writer" class="com.mark.bean.PagingWriters" scope="page"/>
<jsp:setProperty name="writer" property="*" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="../newHeader.jsp" />

        <div class="container bg-light p-0 shadow rounded col-9">
            <div class="sub-container pt-5 pl-5 pr-5 pb-2 row">
                <jsp:include page="info-submenu.jsp" />
                <div class="info-tab-detail border-right border-bottom p-3 col-lg-9 pb-5">
                    <div class="d-flex">
                        <h4>Writers Information</h4>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">
                            Add
                        </button>
                    </div>
                    <div class="info-writer">
                        <table class="table table-dark">
                            <tr><th>ID</th><th>Writer Name</th><th>Birth Date</th><th>Address</th></tr>
                                    <c:forEach var="w" items="${writer.writers}" >
                                <tr><td>${w.ID}</td><td>${w.name}</td><td>${w.birthDate}</td><td>${w.address}</td>
                                    <td>
                                        <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">...</button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="/PRJ321_FINAL_PROJECT/personal/info-update-writer.jsp?id=${w.ID}">Update</a>
                                            <a class="dropdown-item" href="/PRJ321_FINAL_PROJECT/writer.do?id=${w.ID}&action=delete">Delete</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>

                    </div>
                    <!-- Button trigger modal -->


                    <!-- Modal -->
                    <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Add Writer</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form id="add-form" method="post">
                                        <div class="form-group row">
                                            <label for="inputID3" class="col-sm-3 col-form-label">ID: </label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" onchange="checkExist()" name="ID" id="inputID3" placeholder="ID..." required/> 
                                                <span id="writer-exist"></span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputName3" class="col-sm-3 col-form-label" >Name: </label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" required="" name="name" id="inputName3" placeholder="Name..." />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputBirth3" class="col-sm-3 col-form-label" >Birth date:</label>
                                            <div class="col-sm-9">
                                                <input type="date" name="birthDate"class="form-control" required="" id="inputBirth3"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputAddress3" class="col-sm-3 col-form-label" >Address:</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control"  name="address" required id="inputAddress3"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputBirth3" class="col-sm-3 col-form-label">Description:</label>
                                            <div class="col-sm-9">
                                                <textarea name="description" class="form-control" rows="3" required></textarea>
                                            </div>
                                        </div>
                                        <input type="hidden" name="action" value="add-writer" />
                                        <div class="modal-footer">
                                            <button  type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button id="submit" type="submit" value="Save" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <ul class="pagination" style="margin-top: -3em; padding-left: 18em">
                    <li class="page-item ${(param.page-1)>1 ? '':'disabled'}">
                        <a class="page-link" href="info-writer.jsp?page=${param.page-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:set var="begin" value="${empty param.page||param.page==1 ? 1:(param.page > 1 ? param.page-1:param.page)}" />
                    <c:set var="end" value="${begin + 2 < writer.pages ? begin+2:writer.pages}" />
                    <c:forEach var="i" begin="${begin}" end="${end}" step="1" >
                        <c:url value="info-writer.jsp" var="next" >
                            <c:param name="page" value="${i}" />
                        </c:url>
                        <li class="page-item ${param.page == i ? 'active':''}"><a class="page-link" href="${next}">${i}</a></li>
                        </c:forEach>
                    <li class="page-item ${param.page+2 < writer.pages ? '':'disabled'}">
                        <a class="page-link" href="info-writer.jsp?page=${param.page+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
        <script>
            function checkExist() {
                var post = $('#inputID3').val();
                $.post(
                        '/PRJ321_FINAL_PROJECT/verify.do',
                        {writerid: post, from: 'writer'},
                        (responseText) => {
                    $('#writer-exist').text(responseText);
                });
            }
            $("#add-form").validate({
                rules: {
                    ID: "required",
                    name: "required",
                    birthDate: "required",
                    address: {
                        required: true,
                        minlength: 5
                    }
                },
                messages: {
                    ID: "Please fill in ID",
                    name: "Please fill in writer's name",
                    address: {
                        required: "Please fill in address",
                        minlength: "Địa chỉ ngắn vậy, chém gió ah?"
                    }
                },
                submitHandler: function (form) {
                    $.ajax({
                        url: '/PRJ321_FINAL_PROJECT/writer.do',
                        type: 'POST',
                        dataType: 'json',
                        contentType: 'application/json;charset=UTF-8',
                        mimeType: 'application/json',
                        data: JSON.stringify($('#add-form').serializeJSON()),
                        success: function () {
                            window.location.reload();
                        },
                        error: function () {
                            window.location.reload();
                        },
                        complete: function () {
                            window.location.reload();
                        }
                    });
                }
            });
        </script>
    </body>
</html>
