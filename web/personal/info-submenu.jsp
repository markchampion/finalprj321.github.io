<%-- 
    Document   : info-submenu
    Created on : Nov 3, 2019, 5:10:46 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .info-sub-tab:hover {
                background-color: lightblue;
                cursor: pointer;
            }
            .activation {
                background-color: lightskyblue;
            }
            div.info-sub-tab a {
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="info-tab-column border-bottom col-3">
            <div id="infosetting" class="info-sub-tab d-flex border-bottom p-2 rounded" onclick="loadContent(this.id)">
                <span>
                    <img src="/PRJ321_FINAL_PROJECT/img/usericon.png" width="48" height="48" />
                    Personal information
                </span>
            </div>
            <div id="info-security" class="info-sub-tab d-flex border-bottom p-2 rounded" onclick="loadContent(this.id)">
                <span> <img src="/PRJ321_FINAL_PROJECT/img/passicon.png" width="48" height="48" />
                    Security
                </span>
            </div>
            <c:if test="${sessionScope.logStatus.role == 'admin'}">
                <div id="info-uploaded" class="info-sub-tab d-flex border-bottom p-2 rounded" onclick="loadContent(this.id)">
                    <span>
                        <img src="/PRJ321_FINAL_PROJECT/img/songicon.jpg" width="48" height="48" />
                        Song uploaded
                    </span>
                </div>
                <div id="info-artist" class="info-sub-tab d-flex border-bottom p-2 rounded" onclick="loadContent(this.id)">
                    <span>
                        <img src="/PRJ321_FINAL_PROJECT/img/artist-icon.jpg" width="48" height="48" />
                        Add new artist
                    </span>
                </div>
                <div id="info-writer" class="info-sub-tab d-flex border-bottom p-2 rounded" onclick="loadContent(this.id)">
                    <span>
                        <img src="/PRJ321_FINAL_PROJECT/img/writer-icon.png" width="48" height="48" />
                        Add new writer
                    </span>
                </div>
            </c:if>
        </div>
        <script>
            function loadContent(id) {
                var item = document.getElementById(id);
                var itemlist = document.getElementsByClassName('info-sub-tab');
                for (var i = 0; i < itemlist.length; i++) {
                    itemlist[i].classList.remove('bg-lightest-blue');
                }
                item.classList.add('bg-lightest-blue');
                window.location.href = '/PRJ321_FINAL_PROJECT/personal/' + id + '.jsp';
//                $('#song-content').load(, function () {}).hide().fadeIn();
//                window.history.pushState("object or string", "Title", '/PRJ321_FINAL_PROJECT/personal_content/' + id + '.jsp');
            }
        </script>
    </body>
</html>
