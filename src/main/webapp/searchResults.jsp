<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>vista geolocalizacion</title>
		<meta name="author" content="Jose Luis Machado Mendoza">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/x-icon" href="docs/images/favicon.ico" />
		<link rel="apple-touch-icon" href="/apple-touch-icon.png">	
	    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin=""/>
	    <script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js" integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og==" crossorigin=""></script>
	</head>
	<body>
		<div>
			<div id="mapid" align="center" style="width: 1000px; height: 500px;"></div>
			<script> 				
			var map = L.map('mapid', {center: [<%= request.getParameter("lat") %>,<%= request.getParameter("long") %>],zoom: 22});
			var basemaps = {
				
			    Combinado: L.tileLayer.wms('http://66.97.42.137:8081/geoserver/dce/wms?', {
			        layers: 'dce:vialidad09,dce:manzana09,dce:seccion09,dce:colonia09,colonia_puntual09'
			    }),	
			    				
			    Manzanas: L.tileLayer.wms('http://66.97.42.137:8081/geoserver/dce/wms?', {
			        layers: 'dce:manzana09'
			    }),
			
			    Vialidades: L.tileLayer.wms('http://66.97.42.137:8081/geoserver/dce/wms?', {
			        layers: 'dce:vialidad09'
			    }),
			    
			    	Colonias: L.tileLayer.wms('http://66.97.42.137:8081/geoserver/dce/wms?', {
			        layers: 'dce:colonia09'
			    }),
			    
			    ColoniaPuntual: L.tileLayer.wms('http://66.97.42.137:8081/geoserver/dce/wms?', {
			        layers: 'dce:colonia_puntual09'
			    }),	 
			    
			    Secciones: L.tileLayer.wms('http://66.97.42.137:8081/geoserver/dce/wms?', {
			        layers: 'dce:seccion09'
			    })
			    		    
			};	
			L.control.layers(basemaps).addTo(map);
			basemaps.Combinado.addTo(map);
			L.marker([<%= request.getParameter("lat") %>,<%= request.getParameter("long") %>]).addTo(map);
            </script>
		</div>		
	</body>
</html>