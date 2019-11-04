<%-- 
    Document   : info-writer
    Created on : Oct 25, 2019, 10:17:36 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="artist" class="com.mark.dao.ArtistDAO" />
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
                <div class="info-tab-detail border-right border-bottom p-3 col-lg-9">
                    <form action="/PRJ321_FINAL_PROJECT/artist.do" method="post" enctype="multipart/form-data"> 
                        <div class="form-group row">
                            <label for="inputID3" class="col-sm-3 col-form-label">ID: </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="ID" id="inputID3" value="${artist.getArtist(param.id).ID}" placeholder="ID...">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputName3" class="col-sm-3 col-form-label">Name: </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="name" value="${artist.getArtist(param.id).name}" id="inputName3" placeholder="Name..." >
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputName3" class="col-sm-3 col-form-label">Nick Name: </label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="nickName" value="${artist.getArtist(param.id).nickName}" id="inputName3" placeholder="Nick Name..." >
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputBirth3" class="col-sm-3 col-form-label">Birth date:</label>
                            <div class="col-sm-9">
                                <input type="date" name="birthDate" value="${artist.getArtist(param.id).birthDate}" class="form-control" id="inputBirth3">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputAddress3" class="col-sm-3 col-form-label">Address:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" value="${artist.getArtist(param.id).address}" name="address" id="inputAddress3">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputBirth3" class="col-sm-3 col-form-label">Description:</label>
                            <div class="col-sm-9">
                                <textarea name="description" class="form-control" rows="4">${artist.getArtist(param.id).description}</textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputBirth3" class="col-sm-3 col-form-label">Avatar:</label>
                            <div class="col-sm-9">
                                <img src="${artist.getArtist(param.id).avatar}" height="48" width="48" />
                                <input type="file" accept=".jpg,.pnf" name="avatar" value="" class="form-control" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="col">
                            <input id="submit" type="submit" value="Save" class="btn btn-success"/>
                            <button class="btn btn-danger" type="button">Cancel</button>
                        </div>
                        <input type="hidden" name="action" value="update" />
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
    </body>
</html>
