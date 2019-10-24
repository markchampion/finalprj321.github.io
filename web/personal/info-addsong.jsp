<%-- 
    Document   : personalpage
    Created on : Oct 11, 2019, 7:35:50 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="artist" class="com.mark.dao.ArtistDAO" />
<jsp:useBean id="writer" class="com.mark.dao.WriterDAO" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../newHeader.jsp" %>
        <div class="container-fluid bg-light-blue" style="height: 50px">          
        </div>
        <div class="container d-flex col-lg-6 bg-light p-0">
            <jsp:include page="info-submenu.jsp" />
            <div class="info-tab-detail border-right border-bottom p-3 col-lg-9">
                <h4>Upload Songs</h4>
                <form action="upload" method="post" enctype="multipart/form-data">
                    <table>
                        <tr><td>Song name: </td><td><input type="text" name="name" required/></td></tr>
                        <tr><td>Author name: </td>
                            <td><select name="writer">
                                    <c:forEach var="a" items="${writer.writers}" >
                                        <option value="${a.ID}">
                                            ${a.name}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td></tr>
                        <tr><td>Artist name: </td>
                            <td style="overflow-y: scroll; height: 100px">
                                <!--<select name="artist">-->
                                <c:forEach var="a" items="${artist.artists}" >
                                    <input type="checkbox" name="artists" value="${a.ID}">
                                    ${a.name}
                                    <br/>
                                </c:forEach>
                                <!--</select>-->
                            </td>
                        </tr>
                        <tr>
                            <td>Genre: </td>
                            <td>
                                <select name="genre">
                                    <option value="Pop">Pop</option>
                                    <option value="Rock">Rock</option>
                                    <option value="Rap">Rap</option>
                                    <option value="HipHop">Hip hop</option>
                                    <option value="Country">Country</option>
                                    <option value="R&B">R&B</option>
                                    <option value="EDM">EDM</option>
                                </select>
                            </td>
                        </tr>
                        <tr><td>Lyrics: </td><td>
                                <textarea class="form-control" name="lyrics" id="exampleFormControlTextarea1" rows="3"></textarea>
                            </td></tr>
                        <tr><td>Mp3 file: </td><td><input type="file" name="fileattach" required/></td></tr>
                        <tr><td>Avatar: </td><td><input type="file" name="fileavatar" required/></td></tr>
                    </table>
                    <input type="submit" name="action" value="Add Song"/>
                    <input type="hidden" name="userid" value="${sessionScope.logStatus.ID}"/>
                </form>
            </div>
        </div>
        <%@include file="../footer.jsp" %>
        <!--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>-->
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>-->
        <!--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>-->
    </body>
</html>