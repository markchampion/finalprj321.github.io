<%-- 
    Document   : header
    Created on : Sep 22, 2019, 12:07:46 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://unpkg.com/tachyons@4.10.0/css/tachyons.min.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Mansalva&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/header.css" type="text/css" />
        <script type="text/javascript" src="header.js"></script>
    </head>
    <body>
        
        <div class="site-header d-flex">
            <nav class="main-menu-bar">
                <div class="site-tag-name">
                    <h3>Tripple Mark mp3</h3>
                </div>
                <ul class="main-nav-bar">   
                    <li class="item"><a href="#">HOME</a></li>
                    <li class="item"><a href="#">TOP CHART</a></li>
                    <li class="item"><a href="#">STYLE</a></li>
                    <li class="item"><a href="#">SINGERS</a></li>
                    <li class="item"><a href="#">PERSONAL</a></li>
                </ul>
                <div class="search-form align-self-center">
                    <form class="d-flex align-items-center">
                        <input class="search-text bw0 br2 pl-1 pr-1" type="text" name="search-text" />
                        <button class="btn-search-icon search-form-icon br3" type="submit" value="submit"></button>
                    </form>
                </div>
                <div class="login-system d-flex align-items-center">
                    <a href="#" class="d-flex align-items-center">
                        <img src="img/usericon.png" width="32" height="32" class=" mr-3"/>
                        <p class="m-0 login-text"> Login </p>
                    </a>
<!--                    <a href="#" class="d-flex align-items-center">
                        <img src="img/usericon.png" width="48" height="48" class=" mr-3"/>
                        <div>
                            <p class="m-0 login-text"> Username </p>
                            <p class="m-0 p-0"> Account type</p>
                        </div>
                    </a>
                    <i class="icon-go-down" id="icon-go-down">&#9660</i>
                    <i class="icon-go-down drop-hide" id="icon-go-up">&#9650</i>
                    <div class="drop-down-login d-flex pt-3 pb-3 drop-hide" id="drop-down-login">
                        <ul class="drop-down-login-option m-0">
                            <li class="drop-down-options p-3"><a href="">Personal information</a></li>
                            <li class="drop-down-options p-3"><a href="">Logout</a></li>
                        </ul>
                    </div>-->
                </div>
            </nav>
        </div>
        <script>
            var drop = document.getElementById("icon-go-down");
            var drop_up = document.getElementById("icon-go-up");
            drop.addEventListener('click', (e) => {
                document.getElementById("drop-down-login").classList.toggle('drop-hide');
                drop_up.classList.toggle('drop-hide');
                drop.classList.toggle('drop-hide');
            });
            drop_up.addEventListener('click', (e) => {
                document.getElementById("drop-down-login").classList.toggle('drop-hide');
                drop_up.classList.toggle('drop-hide');
                drop.classList.toggle('drop-hide');
            });
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    </body>
</html>
