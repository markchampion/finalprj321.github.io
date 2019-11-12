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
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../newHeader.jsp" %>
        <div class="container bg-light p-0 shadow rounded col-9">
            <div class="sub-container p-5 row">
                <jsp:include page="../page-user/info-submenu.jsp" />
                <div class="info-tab-detail border-right border-bottom p-3 col-lg-9">
                    <h4>Upload Songs</h4>
                    <form action="/PRJ321_FINAL_PROJECT/upload" method="post" enctype="multipart/form-data">
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
                            <tr><td>Mp3 file: </td><td>
                                        <input id="mp3" type="file" class="btn btn-success" accept=".mp3,.mp4" name="fileattach">
                                </td></tr>
                            <tr><td>Avatar: </td><td>
                                        <input id="ava" type="file" name="fileavatar" class="btn btn-success" accept=".jpg,.png">
                                </td></tr>
                        </table>
                        <input type="submit" name="action" value="Add song"/>
                        <input type="hidden" name="userid" value="${sessionScope.logStatus.ID}"/>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="../footer.jsp" %>
        <script>
             function isSelected(id) {
                if($('#'+id).val()){
                    $('#'+id).prop('disabled', true);
                } else
                    $('#'+id).prop('disabled', false);
            }
        </script>
    </body>
</html>
