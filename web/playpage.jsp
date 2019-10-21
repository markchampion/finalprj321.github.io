<%-- 
    Document   : playpage
    Created on : Oct 18, 2019, 9:38:04 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/playpage.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="newHeader.jsp" %>
        <div class="container p-3">
            <div class="inside-1-1 bg-light">
                <audio controls>
                    <source src="${playsong.downLink}" type="audio/mpeg"/>
                </audio>
            </div>
            <div class="inside-1-2 text-white bg-info text-center"> 
                <h3 class="pt-5">Suggestion Songs</h3>
                <h4>Login to create your own playlist</h4>
                <a href=""><button>Click Here</button></a>
            </div>
            <!-- UPLOADER AND OTHER OPTIONS BAR-->
            <div class="inside-2-1 text-white bg-info pt-1"> 
                <div class="uploader d-flex align-items-center bg-dark p-1">
                    <a href=""><img class="border rounded-circle" src="img/passicon.png" width="48" height="48"/></a>
                    <div class="uploader-info pl-1">
                        <p class="m-0">Upload by:</p>
                        <p class="m-0">Username</p>
                    </div>
                    <div class="download-btn">
                        <a href=""><img src="img/download.png" width="24" height="24"/><span class="pl-2">Download</span></a>
                    </div>
                    <div class="ml-5 add-fvt-button">
                        <a href=""><img src="img/favorite.png" width="20" height="20"/><span class="pl-2">Add to favorite</span></a>
                    </div>
                </div>
                <div class="lyrics-area p-1 border">
                    <h5>Lyrics for: ${playsong.name}</h5>
                    <p>Writer: </p>
                    <p>Artist: <t:ArtistTag songID="${playsong.ID}" /></p>
                    <hr/>
                    <pre>
                        Từng là hơi ấm bên đời
                        giờ là cơn gió ngang trời
                        Mọi người xung quanh thay nhau cho tôi biết
                        Cô Thắm không về nữa đâu
                        Đặt trọn niềm tin sai người
                        Giờ này ai khóc ai cười
                        Thề hẹn làm chi
                        Để rồi bỏ đi
                        Tôi cố đem tình vun đắp mây hoá ngang trời che lấp
                        Tôi vẫn nơi này đợi chờ cô về với tôi
                        Là vì tôi quá ngốc nghếch
                        Hay là do gia cảnh tôi nghèo
                        Gốc đa chỉ còn mình tôi ngồi nhìn trăng lên
                        Bao nhiêu kí ức một thời
                        Giờ thành cay đắng một đời
                        Nhà cao xe sang váy cưới lộng lẫy
                        Sớm tối có người đón đưa
                        Hình dung theo gió mây ngàn
                        Ngồi ôm thương nhớ bẽ bàng
                        Phận đời ngang trái
                        Giờ biết nói cùng với ai
                        Dẫu biết phận mình cay đắng
                        Nhưng cớ sao lòng vẫn buồn
                        Làm phu, làm thuê
                        Làm sao mơ cho được ngọc ngà
                        Cô Thắm ngày nào bên tôi
                        Nay khuất xa dần mất rồi
                        Đành thôi
                        Tôi phải quên . ..

                        Rap:
                        Tôi còn nhớ ngày cô đi
                        Mưa lâm râm nặng hạt
                        Cô vội trao chiếc nhẫn cỏ
                        Gương mặt cô lạnh nhạt
                        Thề hẹn xưa nay còn đâu
                        Khi tôi đã không còn cạnh cô
                        Áo gấm lụa đào
                        Cô cất bước đi giữa chốn phù phiếm nơi thành đô
                        Cô Thắm ơi! Mỗi 1 ngày thiếu điều
                        Tôi nhớ cô lắm
                        Ánh đèn vàng
                        Thành phố xa hoa đã cướp mất đi cô Thắm
                        Túp lều tranh
                        Nay chỉ lẻ bóng đơn điệu trong đó 1 trái tim
                        Chỉ biết đợi chờ cô về
                        Trong nổi tuyệt vọng bóng ai dưới mái hiên
                        Tui lau! Giọt nước mắt
                        Sau còn động 2 hàng mi
                        Đã bao lần
                        Tui nắm lấy thứ tình cảm phai tàn đi
                        Con sông xưa
                        Mà vẫn khúc Bồi, giờ đây lòng người chỉ Lỡ
                        Sao nỡ quên đi
                        Thứ ân tình xưa là cả 1 đời tui ghi nhớ
                        Chờ cô về, chờ chiếc hôn
                        Chờ 1 vòng tay ấm áp
                        Chờ cô nói: “Cô nhớ tui“ chỉ là câu nói thấm thoát
                        Câu hỏi đó, nợ tình duyên, liệu cô có trả lời?
                        Cô bắt tui chờ
                        Và chờ bao giờ hay tui phải chờ đến chờ đến cả đời</pre>
                </div>
            </div>
            <div class="inside-2-2 bg-primary">

            </div>
        </div>


        <!--        <div class="audio-player" >
                    <button id="pButton" class="play" onclick="playAudio()"></button>
                    
                    <div class="volume-control">
                        <label id="rngVolume-label" for="rngVolume">Volume: </label>
                        <input type="range" onchange="setVolume(this.value)" value="1" id="rngVolume" min="0" max="1" step="0.01" />
                    </div>
                </div>-->

        <%@include file="footer.jsp" %>
    </body>
</html>
