<%-- 
    Document   : home.jsp
    Created on : Sep 21, 2019, 11:50:35 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://unpkg.com/tachyons@4.10.0/css/tachyons.min.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://unpkg.com/tachyons@4.10.0/css/tachyons.min.css"/>
        <link rel="stylesheet" href="css/home.css" />
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="newHeader.jsp" %>
        <div class="container">
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
                            <img src="https://avatar-nct.nixcdn.com/slideshow/2019/10/06/3/3/e/3/1570338800356_org.jpg" class="d-block w-100" alt="...">
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
            <div class="inside-1-2 bg-light-blue">
                <h4>Hot Music</h4>
                <div class="vertical-song-card bg-light d-flex border-dark border-bottom ">
                    <div class="card-order pt-2 pl-3 pr-3"><span>1</span></div>
                    <a class="img-title pr-3" href="">
                        <img src="img/usericon.png" width="42" height="42" />
                    </a>
                    <div class="singer-title">
                        <p class="song-name m-0">Song name</p>
                        <span class="singer-name">Singer</span>
                    </div>
                </div>
            </div>
            <div class="inside-2-1 bg-light-blue" >
                <h3 class="text-white">What's new today</h3>
                <div class="inside-2-1-1">
                    <a>
                        <img class="p-1"src="https://avatar-nct.nixcdn.com/playlist/2019/10/14/6/2/5/3/1571048239090_300.jpg"/>  
                        <span class="pb-1 pl-1">Click to view</span>
                    </a>
                    <a>
                        <img class="p-1"src="https://avatar-nct.nixcdn.com/playlist/2019/10/14/6/2/5/3/1571048239090_300.jpg"/>  
                        <span class="pb-1 pl-1">Click to view</span>
                    </a>
                    <a>
                        <img class="p-1"src="https://avatar-nct.nixcdn.com/playlist/2019/10/14/6/2/5/3/1571048239090_300.jpg"/>  
                        <span class="pb-1 pl-1">Click to view</span>
                    </a>
                    <a>
                        <img class="p-1"src="https://avatar-nct.nixcdn.com/playlist/2019/10/14/6/2/5/3/1571048239090_300.jpg"/>  
                        <span class="pb-1 pl-1">Click to view</span>
                    </a>
                </div>
            </div>
            <div class="inside-2-2 bg-primary">

            </div>
            <div class="inside-3-1 bg-light">

            </div>
            <div class="song-list pt-5 pl-4 pr-4 m-auto">
                <c:forEach var="s" items="${songs}">
                    <div class="song-card d-flex bg-light-blue">
                        <div><img src="img/up-512.png" width="92" height="92"/></div>
                        <div class="song-card-info" >
                            <p><bold>${s.name}</bold></p>
                            <p>${s.signer}</p>
                        </div>
                        <audio controls>
                            <source src="${s.downLink}" type="audio/mp3" />
                        </audio>
                    </div>
                </c:forEach>
            </div>
        </div>
        <%--<%@include file="footer.jsp" %>--%>
        <jsp:include page="footer.jsp" />
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
