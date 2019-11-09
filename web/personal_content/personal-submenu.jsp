<%-- 
    Document   : personal-submenu
    Created on : Nov 7, 2019, 9:50:50 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .option-item:hover {
                cursor: pointer;
            }
            .option-item:not(.bg-lightest-blue):hover {
                background-color: rgb(213, 240, 239);
            }
        </style>
    </head>
    <body>
        <div class="shadow col-3 p-0">
            <div class="option-list col p-0">
                <div id="favList" class="option-item p-3 border-bottom" onclick="loadContent(this.id)">
                    <a href="/PRJ321_FINAL_PROJECT/personal_content/favList.jsp"> <b>Favorite</b> </a>
                </div>
                <div id="playList" class="option-item p-3 border-bottom">
                    <a href="/PRJ321_FINAL_PROJECT/personal_content/playList.jsp"> <b>Playlist</b> </a>
                </div>
                <div id="htr" class="option-item p-3 border-bottom">
                    <b>History</b>
                </div>
                <div id="uld" class="option-item p-3 border-bottom">
                    <b>Uploaded</b>
                </div>
            </div>
        </div>
    </body>
</html>
