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
        <div class="container-fluid bg-light-blue" style="height: 50px">          
        </div>
        <div class="container d-flex col-lg-6 bg-light p-0">
            <jsp:include page="info-submenu.jsp" />
            <div class="info-tab-detail border-right border-bottom p-3 col-lg-9">
                <div class="d-flex">
                    <h4>Artists Information</h4>
                    <button class="btn btn-success ml-auto" id="add-btn">Add</button>
                </div>
                <div class="info-artist">
                    <table class="table table-dark">
                        <tr><th>ID</th><th>Artist Name</th><th>Birth Date</th><th>Address</th></tr>
                                <c:forEach var="w" items="${artist.artists}" >
                            <tr><td>${w.ID}</td><td>${w.name}</td><td>${w.birthDate}</td><td>${w.address}</td></tr>
                        </c:forEach>
                    </table>
                    <ul class="pagination">
                        <li class="page-item ${(param.page-1)>1 ? '':'disabled'}">
                            <a class="page-link" href="info-artist.jsp?page=${param.page-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach var="i" begin="${(param.page <= 1 || empty param.page) ? 1:param.page-1}" end="${(param.page+1) < artist.pages ? (param.page+1):artist.pages}" step="1" >
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
                <div class="add-artist hidden">
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
                        <div class="col">
                            <input id="submit" type="button" value="Save" class="btn btn-success"/>
                            <button class="btn btn-danger" type="button">Cancel</button>
                        </div>
                        <input type="hidden" name="action" value="add-artist" />
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
        <script>
            function popUp() {
                $('div.info-artist').toggleClass('hidden');
                $('div.add-artist').toggleClass('hidden');
            }
            $('#add-btn').click(popUp);
            $('#submit').on('click', function () {
                //send ajax
                $.ajax({
                    url: '/PRJ321_FINAL_PROJECT/artist.do',
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json;charset=UTF-8',
                    mimeType: 'application/json',
                    data: JSON.stringify($('#add-form').serializeJSON()),
                    success: function (responseText) {
                        window.location.reload();
                    }
                });
            });
        </script>
    </body>
</html>
