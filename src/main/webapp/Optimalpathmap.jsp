<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Optimal Path</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <link rel="stylesheet" href="https://unpkg.com/leaflet-routing-machine/dist/leaflet-routing-machine.css" />
    <link rel="stylesheet" href="https://unpkg.com/leaflet-arrowheads/dist/leaflet.arrowheads.css" />
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
<script src="https://unpkg.com/leaflet-routing-machine/dist/leaflet-routing-machine.js"></script>
<script src="https://unpkg.com/leaflet-arrowheads/dist/leaflet.arrowheads.js"></script>

<script>
    var map = L.map('map').setView([18.5204, 73.8567], 13); // Default coordinates and zoom level

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    // Define a custom icon for the dustbin marker
    var dustbinIcon = L.icon({
        iconUrl: 'https://imgur.com/Uq575CF.png',
        iconSize: [48, 65], // size of the custom image
        iconAnchor: [24, 48], // point of the icon which will correspond to marker's location
        popupAnchor: [-3, -48] // point from which the popup should open relative to the iconAnchor
    });

    // Add markers for dustbins
    <c:forEach var="place" items="${dustbins}">
        var dustbin = L.marker([${place.getLatitude()}, ${place.getLongitude()}], { icon: dustbinIcon }).addTo(map);
        dustbin.bindPopup("<b>Smart Dustbin:</b> ${place.getPlaceName()}<br><b>Status:</b> ${place.isWorking()}<br><b>Fill level:</b> ${place.getFillLevel()}");
    </c:forEach>

    // Function to fetch and display route between two points
    function displayRoute(start, end) {
        L.Routing.control({
            waypoints: [
                L.latLng(start),
                L.latLng(end)
            ],
            lineOptions: {
                styles: [{color: 'black', opacity: 0.7, weight: 4 , dashArray: '5, 10' }], // solid line
                addWaypoints: false, // disable waypoints markers
                arrowheads: { // add arrowheads
                    frequency: '25%',
                    fillColor: 'orange',
                    size: '100px',
                    frequencyData: [{offset: '50%'}]
                }
            },
            router: new L.Routing.OSRMv1({
                serviceUrl: 'https://router.project-osrm.org/route/v1'
            })
        }).addTo(map);
    }

    // Connect dustbins with available roads
    <c:forEach var="index" begin="0" end="${dustbins.size() - 2}">
        displayRoute(
            [${dustbins[index].getLatitude()}, ${dustbins[index].getLongitude()}],
            [${dustbins[index + 1].getLatitude()}, ${dustbins[index + 1].getLongitude()}]
        );
    </c:forEach>

    // Add initial point marker (small red dot)
    var initialPoint = L.circleMarker([${dustbins[0].getLatitude()}, ${dustbins[0].getLongitude()}], { color: 'red', radius: 18 }).addTo(map);
    initialPoint.bindPopup("Initial Point");

    // Add end point marker (small green dot)
    var endLatitude = ${dustbins[dustbins.size() - 1].getLatitude()};
    var endLongitude = ${dustbins[dustbins.size() - 1].getLongitude()};
    var endPoint = L.circleMarker([endLatitude, endLongitude], { color: 'green', radius: 18 }).addTo(map);
    endPoint.bindPopup("End Point");
</script>
</body>
</html>