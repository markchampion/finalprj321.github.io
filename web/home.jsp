<%-- 
    Document   : home.jsp
    Created on : Sep 21, 2019, 11:50:35 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<jsp:useBean id="songDAO" class="com.mark.dao.SongDAO" scope="application" />
<jsp:useBean id="artistDAO" class="com.mark.dao.ArtistDAO" scope="application" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/home.css" />
        <link rel="stylesheet" href="css/swiper.min.css">
        <script src="js/swiper.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="t-mp3-pageWrapper">
            <jsp:include page="newHeader.jsp" />
            <div class="t-mp3-body">
                <div class="t-mp3-body-inner">
                    <div class="t-mp3-body-main t-mp3-body-main--withSidebar">
                        <div class="t-mp3-body-content">
                            <!-- Begin mainContent Code Here -->
                            <div class="t-slider">
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
                            <div class="t-new-today" >
                                <div class="t-title-wrapper">
                                    <h3 class="t-new-today-title">WHAT'S NEW?</h3>
                                    <div class="t-slider-direction">
                                        <span class="t-previous-button"><i class="fas fa-angle-left"></i></span>
                                        <span class="t-next-button"><i class="fas fa-angle-right"></i></span>
                                    </div>
                                </div>
                                <div class="swiper-container">

                                    <div class="swiper-wrapper t-new-item-list">
                                        <c:forEach var="s" items="${songDAO.songsByDate}" begin="0" end="9">
                                            <div class="swiper-slide t-new-item">
                                                <img src="${s.avatar}"/>  
                                                <a href="t-item-song-name">${s.name}</a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <script>
                                        var swiper = new Swiper('.swiper-container', {
                                            slidesPerView: 5,
                                            spaceBetween: 20,
                                            slidesPerGroup: 5,
                                            loop: true,
                                            loopFillGroupWithBlank: true,
                                            navigation: {
                                                nextEl: '.t-next-button',
                                                prevEl: '.t-previous-button',
                                            },
                                            breakpoints: {
                                                320: {
                                                    slidesPerView: 2,
                                                    spaceBetween: 20,
                                                },
                                                480: {
                                                    slidesPerView: 3,
                                                    spaceBetween: 20,
                                                },
                                                640: {
                                                    slidesPerView: 3,
                                                    spaceBetween: 20,
                                                },
                                                900: {
                                                    slidesPerView: 4,
                                                    spaceBetween: 20,
                                                },
                                                1024: {
                                                    slidesPerView: 5,
                                                    spaceBetween: 20,
                                                },
                                            }
                                        });
                                    </script>
                                </div>
                            </div>
                            <div class="t-famous-singer">
                                <h4 class="t-new-today-title">Famous Singer</h4>
                                <div class="inside-2-1-1 d-flex">
                                    <c:forEach var="s" items="${artistDAO.artistByView}" >
                                        <div class="d-flex flex-column align-items-center">
                                            <img class="p-1 grow"src="${s.avatar}" width="156" height="156"/>  
                                            <a href="/PRJ321_FINAL_PROJECT/artist-page.jsp?artistID=${s.ID}">
                                                <span class="pb-1 pl-1">${s.nickName}</span>
                                            </a>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div> 
                            <!-- End mainContent Code Here-->
                        </div>
                        <div class="t-mp3-body-sidebar">
                            <!-- Begin sideBar Code Here -->
                            <div class="t-music-chart">
                                <h4 class="t-new-today-title">#T-Chart</h4>         
                                <c:forEach var="s" items="${songs}" begin="0" step="1" varStatus="i" end="9">
                                    <div class="vertical-song-card d-flex ${i.count==1 ? 'bg-light-red':(i.count==2?'bg-gold':(i.count==3?'bg-purple':(i.count==4?'bg-blue':'bg-green')))}">
                                        <div class="card-order pt-3 pl-3 mr-3"><span>${i.count}</span></div>
                                        <a class="img-title mr-3" href="play?id=${s.ID}">
                                            <img src="${s.avatar}" width="56px" height="56px" />
                                        </a>
                                        <div class="singer-title lightest-blue">
                                            <a href="play?id=${s.ID}" class="song-name m-0 text-light">${s.name}</a>
                                            <p class="singer-name"><t:ArtistTag songID="${s.ID}" /></p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="t-hot-genre">
                                <h4 class="t-new-today-title">Hot Genre</h4>
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
                        </div>
                        <!-- End sideBar Code Here-->
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </div>
</body>
</html>
