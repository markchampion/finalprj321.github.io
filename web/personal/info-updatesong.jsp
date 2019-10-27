<%-- 
    Document   : personalpage
    Created on : Oct 11, 2019, 7:35:50 AM
    Author     : PC
--%>

<%@page import="com.mark.model.Song"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<jsp:useBean id="artist" class="com.mark.dao.ArtistDAO" />
<jsp:useBean id="writer" class="com.mark.dao.WriterDAO" />
<jsp:useBean id="songs" class="com.mark.dao.SongDAO" scope="application" />
<%
    for (Song s : songs.getSongs()) {
        if (request.getParameter("id").equals(s.getID() + "")) {
            request.setAttribute("song_update", s);
            break;
        }
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="crossorigin="anonymous"></script>
        <script>
            $(document).ready(function(){
                $('#inner-form').hide();
                $('#update-toggle').click(() => {
                    $('#inner-form').show();
                    $('#outer-form').hide();
                });
                $('#update-cancel').click(() => {
                    $('#inner-form').hide();
                    $('#outer-form').show();
                });
            });
        </script>
    </head>
    <body>
        <%@include file="../newHeader.jsp" %>
        <div class="container-fluid bg-light-blue" style="height: 50px">          
        </div>
        <div class="container d-flex col-lg-6 bg-light p-0">
            <jsp:include page="info-submenu.jsp" />
            <div class="info-tab-detail border-right border-bottom p-3 col-lg-9">
                <div class="d-flex">
                    <h4>Upload Songs</h4>
                    <button class="btn btn-success ml-auto" id="update-toggle">Update</button>
                </div>
                <table id="outer-form">
                    <tr><td>Name: </td><td><strong>${song_update.name}</strong></td></tr>
                    <tr><td>Author: </td><td>${song_update.writer}</td></tr>
                    <tr>
                        <td>Artist: </td>
                        <td>
                            <t:ArtistTag songID="${song_update.ID}"/>
                        </td>
                    </tr>
                    <tr><td>Genre:  </td><td>${song_update.genre}</td></tr>
                    <tr><td>Lyrics:  </td><td>${song_update.lyrics}</td></tr>
                    <tr><td>Avatar: </td><td><img src="${song_update.avatar}" width="48" height="48"/></td></tr>
                </table>
                <div id="inner-form">
                <form  action="upload" method="post" enctype="multipart/form-data">
                    <table>
                        <tr><td>Song name: </td><td><input type="text" name="name" value="${song_update.name}" required/></td></tr>
                        <tr><td>Author name: </td>
                            <td><select name="writer">
                                    <c:forEach var="a" items="${writer.writers}" >
                                        <option value="${a.ID}" ${song_update.writer == a.name ? 'selected' : ''}>
                                            ${a.name}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td></tr>
                        <tr><td>Artist name: </td>
                            <td style="overflow-y: scroll; height: 100px">
                                <!--<select name="artist">-->
                                <c:forEach var="a" items="${artist.artists}" >
                                    <input type="checkbox" name="artists" value="${a.ID}" >
                                    ${a.name}
                                    </checkbox><br/>
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
                                <textarea class="form-control" name="lyrics" id="exampleFormControlTextarea1" rows="3" value="${song_update.lyrics}"></textarea>
                            </td></tr>
                        <tr><td>Mp3 file: </td><td><input type="file" name="fileattach" value="${song_update.downLink}" required/></td></tr>
                        <tr><td>Avatar: </td><td><input type="file" name="fileavatar" value="${song_update.avatar}"required/></td></tr>
                    </table>
                    <input type="submit" class="btn btn-success" name="action" value="Save"/>
                    <input type="hidden" name="userid" value="${sessionScope.logStatus.ID}"/>
                </form>
                    <button class="btn btn-danger" id="update-cancel">Cancel</button>
                </div>
            </div>
        </div>
        <%@include file="../footer.jsp" %>

    </body>
</html>
