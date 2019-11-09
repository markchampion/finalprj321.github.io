<%-- 
    Document   : home.jsp
    Created on : Sep 21, 2019, 11:50:35 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<jsp:useBean id="songDAO" class="com.mark.dao.SongDAO" scope="application" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/home.css" />
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="newHeader.jsp" %>
        <div class="container rounded shadow-lg p-0">
            <div class="inside-1">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="https://avatar-nct.nixcdn.com/slideshow/2019/10/14/5/f/3/f/1571017006921_org.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="https://avatar-nct.nixcdn.com/slideshow/2019/10/06/3/3/e/3/1570338800356_org.jpg" class="d-block w-100 " alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="https://avatar-nct.nixcdn.com/slideshow/2019/10/16/f/d/7/1/1571188050529_org.jpg" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="inside-1-2 bg-light">
                <h4 class="text-center mt-1 georgia">Hot Music</h4>         
                <c:forEach var="s" items="${songs}" begin="0" step="1" varStatus="i">
                    <div class="vertical-song-card d-flex border-bottom ${i.count==1 ? 'bg-light-red':(i.count==2?'bg-gold':(i.count==3?'bg-purple':'bg-blue'))}">
                        <div class="card-order pt-3 pl-3 pr-3"><span>${i.count}</span></div>
                        <a class="img-title pr-3" href="play?id=${s.ID}">
                            <img src="${s.avatar}" width="52" height="52" />
                        </a>
                        <div class="singer-title lightest-blue">
                            <p class="song-name m-0">${s.name}</p>
                            <span class="singer-name"><t:ArtistTag songID="${s.ID}" /></span>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="inside-2-1 bg-light border-bottom" >
                <h3 class="text-dark ml-4 mt-1 border-bottom">What's new today</h3>
                <div class="inside-2-1-1">
                    <c:forEach var="s" items="${songDAO.songsByDate}" begin="0" end="3" >
                        <div class="d-flex flex-column align-items-center">
                            <img class="p-1 grow"src="${s.avatar}" width="156" height="156"/>  
                            <a href="">
                                <span class="pb-1 pl-1">${s.name}</span>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="inside-2-2 bg-light ">
                <h4 class="text-center mt-2 pb-1 border-bottom">Hot Genre</h4>
                <div class="d-flex justify-content-center mb-3 grow">
                    <a href="" class="genre-tag" title="Pop">
                        <img src="img/popmusic.jpg" width="300" height="150"/>
                    </a>
                </div>
                <div class="d-flex justify-content-center mb-3 grow">
                    <a href="" class="genre-tag" title="RnB">
                        <img src="img/rnbmusic.jpg" width="300" height="150"/>
                    </a>
                </div>
                <div class="d-flex justify-content-center mb-3 grow">
                    <a href="" class="genre-tag" title="EDM">
                        <img src="img/edmmusic.jpg" width="300" height="150"/>
                    </a>
                </div>
            </div>
            <div class="inside-3-1 bg-light">
                <h4 class="ml-4 border-bottom">Famous Singer</h4>
            </div>         
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
