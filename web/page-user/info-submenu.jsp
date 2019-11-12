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
                background-color: #cdecff;
            }
            div.info-sub-tab a {
                text-decoration: none;
            }
            div.info-tab-detail {
                background-color: #cdecff;
            }
        </style>
    </head>
    <body>
        <div class="info-tab-column border-bottom col-3 p-0">
            <div id="infosetting" class="info-sub-tab d-flex border-bottom p-2 rounded" onclick="window.location.href = '/PRJ321_FINAL_PROJECT/page-user/infosetting.jsp';">
                <span>
                    <img src="/PRJ321_FINAL_PROJECT/img/usericon.png" width="48" height="48" />
                    Personal information
                </span>
            </div>
            <div id="info-security" class="info-sub-tab d-flex border-bottom p-2 rounded" onclick="window.location.href = '/PRJ321_FINAL_PROJECT/page-user/info-security.jsp';">
                <span> <img src="/PRJ321_FINAL_PROJECT/img/passicon.png" width="48" height="48" />
                    Security
                </span>
            </div>
            <c:if test="${sessionScope.logStatus.role == 'admin'}">
                <div id="info-uploaded" class="info-sub-tab d-flex border-bottom p-2 rounded" onclick="window.location.href = '/PRJ321_FINAL_PROJECT/page-admin/info-uploaded.jsp';">
                    <span>
                        <img src="/PRJ321_FINAL_PROJECT/img/songicon.jpg" width="48" height="48" />
                        Song uploaded
                    </span>
                </div>
                <div id="info-artist" class="info-sub-tab d-flex border-bottom p-2 rounded" onclick="window.location.href = '/PRJ321_FINAL_PROJECT/page-admin/info-artist.jsp';">
                    <span>
                        <img src="/PRJ321_FINAL_PROJECT/img/artist-icon.jpg" width="48" height="48" />
                        Add new artist
                    </span>
                </div>
                <div id="info-writer" class="info-sub-tab d-flex border-bottom p-2 rounded" onclick="window.location.href = '/PRJ321_FINAL_PROJECT/page-admin/info-writer.jsp';">
                    <span>
                        <img src="/PRJ321_FINAL_PROJECT/img/writer-icon.png" width="48" height="48" />
                        Add new writer
                    </span>
                </div>
            </c:if>
        </div>
        <script>
            var item = window.location.href.toString().split('/');
            var id = item[item.length - 1].split('.')[0];
            var itemlist = document.getElementsByClassName('info-sub-tab');
            for (var i = 0; i < itemlist.length; i++) {
                itemlist[i].classList.remove('bg-lightest-blue');
            }
                document.getElementById(id).classList.add('bg-lightest-blue');
        </script>
    </body>
</html>
