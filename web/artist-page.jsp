<%-- 
    Document   : artist-page
    Created on : Nov 4, 2019, 10:58:42 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="artist" class="com.mark.dao.ArtistDAO" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="newHeader.jsp" />
        <div class="container pl-0 pr-0 bg-light rounded shadow-lg ">
            <div class="bg-light-purple lightest-blue ">
            <span class="col-3"></span>
            <span class="col-6 text-center" style="font-family: Roboto,sans-serif">
                <h3>Artist Infomation</h3>
            </span>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
