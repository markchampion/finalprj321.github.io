<%-- 
    Document   : info-writer
    Created on : Oct 25, 2019, 10:17:36 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="writer" class="com.mark.bean.PagingWriters" />
<jsp:useBean id="updateWriter" class="com.mark.dao.WriterDAO" scope="page" />
<jsp:setProperty name="updateWriter" property="ID" value="${param.id}" />
<jsp:setProperty name="writer" property="*" />
<c:set var="update" value="${updateWriter.writer}" scope="page"/>
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
                <jsp:include page="../page-user/info-submenu.jsp" />
                <div class="info-tab-detail border-right border-bottom p-3 col-lg-9">
                    <form id="add-form">
                        <div class="form-group row">
                            <label for="inputID3" class="col-sm-3 col-form-label">ID: </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="ID" id="inputID3"  value="${update.ID}" placeholder="ID...">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputName3" class="col-sm-3 col-form-label">Name: </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="name" value="${update.name}" id="inputName3"  placeholder="Name..." >
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputBirth3" class="col-sm-3 col-form-label">Birth date:</label>
                            <div class="col-sm-9">
                                <input type="date" name="birthDate"class="form-control" value="${update.birthDate}" id="inputBirth3">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputAddress3" class="col-sm-3 col-form-label">Address:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" value="${update.address}"  name="address" id="inputAddress3">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputBirth3" class="col-sm-3 col-form-label">Description:</label>
                            <div class="col-sm-9">
                                <textarea name="description" class="form-control" rows="3">${update.description}</textarea>
                            </div>
                        </div>
                        <div class="col">
                            <input id="submit" type="button" value="Save" class="btn btn-success"/>
                            <button class="btn btn-danger" type="button" onclick="window.location.href = '/PRJ321_FINAL_PROJECT/page-admin/info-writer.jsp'">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
        <script>
            $('#submit').on('click', function () {
                //send ajax
                $.ajax({
                    url: '/PRJ321_FINAL_PROJECT/writer.do',
                    type: 'POST',
                    dataType: false,
                    data: {obj: JSON.stringify($('#add-form').serializeJSON()), action: 'update'},
                    success: function () {
                        window.location.href = '/PRJ321_FINAL_PROJECT/page-admin/info-writer.jsp';
                    }
                });
            });
        </script>
    </body>
</html>
