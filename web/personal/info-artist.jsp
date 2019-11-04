<%-- 
    Document   : info-writer
    Created on : Oct 25, 2019, 10:17:36 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="artist" class="com.mark.bean.PagingArtists" />
<jsp:setProperty name="artist" property="*" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .hidden {
                display:none;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../newHeader.jsp" />
        <div class="container bg-light p-0 shadow rounded col-9">
            <div class="sub-container p-5 row">
                <jsp:include page="info-submenu.jsp" />
                <div class="info-tab-detail border-right border-bottom p-3 col-lg-9" style="height: 520px">
                    <div class="d-flex">
                        <h4>Artists Information</h4>
                        <button type="button" class="btn btn-primary ml-auto" data-toggle="modal" data-target="#exampleModalScrollable">
                            Add
                        </button>
                    </div>
                    <div class="info-artist">
                        <table class="table table-dark">
                            <tr><th>Avatar</th><th>ID</th><th>Artist Name</th><th>Birth Date</th><th>Address</th></tr>
                                    <c:forEach var="w" items="${artist.artists}" >
                                <tr>
                                    <td><img class="rounded-circle" src="${w.avatar}" height="48" width="48" /></td>
                                    <td>${w.ID}</td><td>${w.nickName}</td><td>${w.birthDate}</td><td>${w.address}</td>
                                    <td>
                                        <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">...</button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="/PRJ321_FINAL_PROJECT/personal/info-update-artist.jsp?id=${w.ID}">Update</a>
                                            <a class="dropdown-item" href="/PRJ321_FINAL_PROJECT/artist.do?id=${w.ID}&action=delete">Delete</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-scrollable" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalScrollableTitle">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="/PRJ321_FINAL_PROJECT/artist.do" method="post" id="add-form" enctype="multipart/form-data">
                                        <div class="form-group row">
                                            <label for="inputID3" class="col-sm-3 col-form-label">ID: </label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="ID" onchange="checkExist()" id="inputID3" placeholder="ID..."/>
                                                <span id="artist-exist"></span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputName3" class="col-sm-3 col-form-label">Name: </label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="name" id="inputName3" placeholder="Name..." />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputName3" class="col-sm-3 col-form-label">Nickname: </label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="nickName" id="inputNickName3" placeholder="Nick Name..."/> 
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputBirth3" class="col-sm-3 col-form-label">Birth date:</label>
                                            <div class="col-sm-9">
                                                <input type="date" name="birthDate"class="form-control" id="inputBirth3"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputAddress3" class="col-sm-3 col-form-label">Address:</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control"  name="address" id="inputAddress3" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputBirth3" class="col-sm-3 col-form-label">Description:</label>   
                                            <div class="col-sm-9">
                                                <textarea name="description" id="description" class="form-control" rows="3" /></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="custom-file pl-5 pr-5">
                                                 <label  for="inputBirth3" class="custom-file-label">Avatar:</label>
                                                <div class="col-sm-9">
                                                    <input type="file" name="avatar" id="avatar" class="custom-file-input" accept=".jpg,.png"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-success">Save changes</button>
                                        </div>
                                        <input type="hidden" name="action" value="add-artist" />
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>   

                </div>
                <ul class="pagination" style="margin-top: -3em; padding-left: 18em">
                    <li class="page-item ${(param.page-1)>1 ? '':'disabled'}">
                        <a class="page-link" href="info-artist.jsp?page=${param.page-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach var="i" begin="${(param.page <= 1 || empty param.page) ? 1:param.page-1}" end="${empty param.page ? 3:((param.page+1) < artist.pages ? (param.page+1):artist.pages)}" step="1" >
                        <c:url value="info-artist.jsp" var="next" >
                            <c:param name="page" value="${i}" />
                        </c:url>
                        <li class="page-item ${param.page == i ? 'active':''}"><a class="page-link" href="${next}">${i}</a></li>
                        </c:forEach>
                    <li class="page-item ${param.page+2 < artist.pages ? '':'disabled'}">
                        <a class="page-link" href="info-artist.jsp?page=${param.page+1}" aria-label="Next">
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
                        {artistid: post, from: 'artist'},
                        (responseText) => {
                    $('#artist-exist').text(responseText);
                });
            }

            $("#add-form").validate({
                rules: {
                    ID: "required",
                    name: "required",
                    nickName: "required",
                    birthDate: "required",
                    address: {
                        required: true,
                        minlength: 5
                    }
                },
                messages: {
                    ID: "Please fill in ID",
                    name: "Please fill in artist's name",
                    nickName: "Please fill in nickname",
                    address: {
                        required: "Please fill in address",
                        minlength: "Địa chỉ ngắn vậy, chém gió ah?"
                    }
                }
            });
        </script>
    </body>
</html>
