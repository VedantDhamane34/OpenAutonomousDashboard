<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Traffic Light Map</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <style>
        #map {
            height: 100vh;
            width: 100%;
        }
    </style>
</head>
<body>
<div id="map"></div>

<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
<script>
    var map = L.map('map').setView([18.5204, 73.8567], 13); // Default coordinates and zoom level

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    // Define a custom icon for the marker
    var trafficLightIcon = L.icon({
        iconUrl: 'https://i.imgur.com/tZliTQN.png',
        iconSize: [48, 48], // size of the custom image
        iconAnchor: [24, 48], // point of the icon which will correspond to marker's location
        popupAnchor: [-3, -48] // point from which the popup should open relative to the iconAnchor
    });

    // JSTL to add markers to the map
    <c:forEach var="place" items="${places}">
        var iconUrl = 'https://i.imgur.com/tZliTQN.png';
        var marker = L.marker([${place.getLatitude()}, ${place.getLongitude()}], {
            icon: L.icon({
                iconUrl: iconUrl,
                iconSize: [48, 48],
                iconAnchor: [24, 48],
                popupAnchor: [-3, -48]
            })
        }).addTo(map);

        marker.bindPopup("<b>Traffic Light:</b> ${place.getName()}<br><b>Status:</b> ${place.getWorking()}");
    </c:forEach>
</script>
</body>
</html>
