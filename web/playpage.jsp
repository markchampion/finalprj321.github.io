<%-- 
    Document   : playpage
    Created on : Oct 18, 2019, 9:38:04 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/playpage.css"
        <title>JSP Page</title>
    </head>
    <body>
        <div class="audio-player" >
            <button id="pButton" class="play" onclick="playAudio()"></button>
            
            <div class="volume-control">
                <label id="rngVolume-label" for="rngVolume">Volume: </label>
                <input type="range" onchange="setVolume(this.value)" value="1" id="rngVolume" min="0" max="1" step="0.01" />
            </div>
        </div>
    </body>
</html>
