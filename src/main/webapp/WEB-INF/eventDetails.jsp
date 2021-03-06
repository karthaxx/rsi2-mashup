<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Zajevents</title>
    <meta name="description" content="Zajevents - wydarzenia dla Ciebie">
    <meta name="author" content="Andrzej Trzaska Rafał Szypulewski">
    <meta name="keywords" content="Zajevents, events, mashup"/>
    <link type="image/ico" rel="icon" href="/favicon.ico" />

    <!-- Le Stylesheets -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />
</head>

<body>
    <div class="main">
        <div class="page">
            <div class="header"><img src="res/header.jpg" alt="" height="304" width="998"/></div>
            <div class="content">
                <div class="leftpanel">
                    <h2>Main Menu</h2>
                    <ul>
                        <li style="border-top: medium none;"><a href="index.jsp">Strona główna</a></li>
                        <li><a href="popularEvents">Popularne wydarzenia</a></li>
                        <li><a href="scanLocation.jsp">Wydarzenia w twoim regionie</a></li>
                    </ul>
                </div> <!-- .leftpanel -->

                <div class="rightpanel">

                    <h1 class="title">Szczegóły dla ${event.title}</h1>
                    <div id="content">
                        <br>
                        <div id="yt-player">
                            <img src="res/yt.jpg"/>

                            <c:forEach var="video" items="${videos}">
                                <iframe width="560" height="315" src="//www.youtube.com/embed/${video.id.videoId}" frameborder="0" allowfullscreen></iframe>
                            </c:forEach>

                        </div>
                        <img src="res/google_maps.jpg" width="500px"/>
                        <div id="mapcanvas">
                        </div>
                        </br>
                        <br>

                        <img src="res/info.jpg" width="150px"/>
                        <div id="eventdetails">
                            <div>Tytuł: ${event.title}</div>
                            <div>Wystąpią:
                                <c:forEach var="performer" items="${event.performers}">
                                    ${performer.name}<br />
                                </c:forEach>
                            </div>
                            <div>Czas rozpoczęcia: ${event.startTime}</div>
                            <div>Kraj: ${event.venueCountry}</div>
                            <div>Miasto: ${event.venueCity}</div>
                            <div>Adres: ${event.venueAddress}</div>
                            <div>Nazwa miejsca: ${event.venueName}</div>
                            <div id="event_pictures">
                                <c:forEach var="image" items="${event.images}">
                                    <img class="event-thumbnail" src="${image.url}" />
                                </c:forEach>
                            </div>
                            <div>Opis: ${event.description}</div>
                        </div>
                        </br>
                    </div>

                </div> <!-- .rightpanel -->
            </div> <!-- #content -->
            <!--DO NOT Remove The Footer Links-->
            <div class="footer">&copy; 2010 zajevents.com Designed by <a
                class="footer-link" target="_blank"
                href="http://www.htmltemplates.net/">htmltemplates.net</a>
               <!--DO NOT Remove The Footer Links-->
            </div> <!-- .footer -->
        </div> <!-- #page -->
    </div> <!-- #main -->

    <!-- Le Javascripts -->

    <!-- Le HTML5 shim and Respond.js, for IE6-8 support of HTML elements and media queries -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <script type="text/javascript" src="js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

    <script>
        $(function() {
            var latlng = new google.maps.LatLng(${event.venueLatitude}, ${event.venueLongitude});

            var myOptions = {
                zoom: 15,
                center: latlng,
                mapTypeControl: false,
                navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            var map = new google.maps.Map(document.getElementById("mapcanvas"), myOptions);

            var marker = new google.maps.Marker({
                position: latlng,
                map: map,
                title:"You are here!"
            });
        });
    </script>
</body>
</html>
