<%-- 
    Document   : info-writer
    Created on : Oct 25, 2019, 10:17:36 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="writer" class="com.mark.bean.PagingWriters" />
<jsp:setProperty name="writer" property="*" />
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
        <div class="container-fluid bg-light-blue" style="height: 50px">          
        </div>
        <div class="container d-flex col-lg-6 bg-light p-0">
            <jsp:include page="info-submenu.jsp" />
            <div class="info-tab-detail border-right border-bottom p-3 col-lg-9">
                <div class="d-flex">
                    <h4>Writers Information</h4>
                    <button class="btn btn-success ml-auto" id="add-btn">Add</button>
                </div>
                <div class="info-writer">
                    <table class="table table-dark">
                        <tr><th>ID</th><th>Writer Name</th><th>Birth Date</th><th>Address</th></tr>
                                <c:forEach var="w" items="${writer.writers}" >
                            <tr><td>${w.ID}</td><td>${w.name}</td><td>${w.birthDate}</td><td>${w.address}</td><td><a href="/PRJ321_FINAL_PROJECT/personal/info-update-writer.jsp?id=${w.ID}" class="btn btn-outline-warning">Update</a></td></tr>
                        </c:forEach>
                    </table>
                    <ul class="pagination">
                        <li class="page-item ${(param.page-1)>1 ? '':'disabled'}">
                            <a class="page-link" href="info-writer.jsp?page=${param.page-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach var="i" begin="${(param.page <= 1 || empty param.page) ? 1:param.page-1}" end="${(param.page+1) < writer.pages ? (param.page+1):writer.pages}" step="1" >
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
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">
                    Launch demo modal
                </button>

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
                                <form action="addwriter" id="add-form">
                                    <div class="form-group row">
                                        <label for="inputID3" class="col-sm-3 col-form-label">ID: </label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="ID" id="inputID3" placeholder="ID...">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputName3" class="col-sm-3 col-form-label">Name: </label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="name" id="inputName3" placeholder="Name..." >
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputBirth3" class="col-sm-3 col-form-label">Birth date:</label>
                                        <div class="col-sm-9">
                                            <input type="date" name="birthDate"class="form-control" id="inputBirth3">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputAddress3" class="col-sm-3 col-form-label">Address:</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control"  name="address" id="inputAddress3">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputBirth3" class="col-sm-3 col-form-label">Description:</label>
                                        <div class="col-sm-9">
                                            <textarea name="description" class="form-control" rows="3"></textarea>
                                        </div>
                                    </div>
<!--                                    <div class="modal-footer col">
                                        <input id="submit" type="button" value="Save" class="btn btn-primary"/>
                                        <button class="btn btn-secondary" type="button">Cancel</button>
                                    </div>-->
                                    <input type="hidden" name="action" value="add-writer" />
                                    <div class="modal-footer">
                                        <button id="submit" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="button" value="Save" class="btn btn-primary">Save changes</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
        <script>
            function popUp() {
                $('div.info-writer').toggleClass('hidden');
                $('div.add-writer').toggleClass('hidden');
            }



            $('#add-btn').click(popUp);
            $('#submit').on('click', function () {
                //send ajax
                $.ajax({
                    url: '/PRJ321_FINAL_PROJECT/writer.do',
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json;charset=UTF-8',
                    mimeType: 'application/json',
                    data: JSON.stringify($('#add-form').serializeJSON()),
                    success: function () {
                        console.log('123');
                        window.location.reload();
                    }
                });
            });
        </script>
    </body>
</html>
