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
			<div id="mapid" align="center" style="width: <%= request.getParameter("width") %>px; height: <%= request.getParameter("height") %>px;"></div>
			<script> 				
			var map = L.map('mapid', {center: [<%= request.getParameter("lat") %>,<%= request.getParameter("long") %>],zoom: <%= request.getParameter("zoom") %>});
			var basemaps = {
					
				    Combinado: L.tileLayer.wms('http://66.97.42.137:8081/geoserver/dce/wms?', {
				        layers: 'dce:vialidad09,dce:manzana09,dce:seccion09,dce:colonia09,dce:colonia_puntual09,geoloc09:ne09,geoloc15:ne15,geoloc15:vialidad15,geoloc15:manzana15,geoloc15:seccion15,geoloc15:colonia15,geoloc15:colonia_puntual15'
				    }),	
				    			
				    Manzanas: L.tileLayer.wms('http://66.97.42.137:8081/geoserver/dce/wms?', {
				        layers: 'dce:manzana09'
				    }),
				        
					Numeros09: L.tileLayer.wms('http://66.97.42.137:8081/geoserver/dce/wms?', {
				        layers: 'geoloc09:ne09'
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
				    }),
				    
				    Manzanas2: L.tileLayer.wms('http://66.97.42.137:8081/geoserver/dce/wms?', {
				        layers: 'geoloc15:manzana15'
				    }),
				    
				    	Numeros15: L.tileLayer.wms('http://66.97.42.137:8081/geoserver/dce/wms?', {
				        layers: 'geoloc15:ne15'
				    }),		    
				
				    Vialidades2: L.tileLayer.wms('http://66.97.42.137:8081/geoserver/dce/wms?', {
				        layers: 'geoloc15:vialidad15'
				    }),
				    
				    	Colonias2: L.tileLayer.wms('http://66.97.42.137:8081/geoserver/dce/wms?', {
				        layers: 'geoloc15:colonia15'
				    }),
				    
				    ColoniaPuntual2: L.tileLayer.wms('http://66.97.42.137:8081/geoserver/dce/wms?', {
				        layers: 'geoloc15:colonia_puntual15'
				    }),	 
				    
				    Secciones2: L.tileLayer.wms('http://66.97.42.137:8081/geoserver/dce/wms?', {
				        layers: 'geoloc15:seccion15'
				    })
				    	
				};	
			L.control.layers(basemaps).addTo(map);
			basemaps.Combinado.addTo(map);
			L.marker([<%= request.getParameter("lat") %>,<%= request.getParameter("long") %>]).addTo(map);
            </script>
		</div>		
	</body>
</html>