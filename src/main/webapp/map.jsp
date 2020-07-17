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
				
					mapas: L.tileLayer.wms('http://${pro.ip.geo.server}:${pro.port.geo.server}/geoserver/dce/wms?', {
				        layers: 'dce:vialidades_colonia<%= request.getParameter("entidad") %>,dce:vialidades_colonia15,dce:colonia_a15,dce:colonia_a<%= request.getParameter("entidad") %>,dce:seccion15,dce:seccion<%= request.getParameter("entidad") %>,dce:manzana<%= request.getParameter("entidad") %>,dce:manzana15,dce:ne<%= request.getParameter("entidad") %>,dce:ne15,dce:pasto<%= request.getParameter("entidad") %>,dce:pasto15,dce:adoquin<%= request.getParameter("entidad") %>,dce:adoquin15,dce:servicios<%= request.getParameter("entidad") %>,dce:servicios15'
				    }),	
				    			
				    vialidad: L.tileLayer.wms('http://${pro.ip.geo.server}:${pro.port.geo.server}/geoserver/dce/wms?', {
				        layers: 'dce:vialidades_colonia<%= request.getParameter("entidad") %>'
				    }),

				    colonia: L.tileLayer.wms('http://${pro.ip.geo.server}:${pro.port.geo.server}/geoserver/dce/wms?', {
				        layers: 'dce:colonia_a<%= request.getParameter("entidad") %>'
				    }),			        

				    seccion: L.tileLayer.wms('http://${pro.ip.geo.server}:${pro.port.geo.server}/geoserver/dce/wms?', {
				        layers: 'dce:seccion<%= request.getParameter("entidad") %>'
				    }),		

				    manzana: L.tileLayer.wms('http://${pro.ip.geo.server}:${pro.port.geo.server}/geoserver/dce/wms?', {
				        layers: 'dce:manzana<%= request.getParameter("entidad") %>'
				    }),				    

				    num_ext: L.tileLayer.wms('http://${pro.ip.geo.server}:${pro.port.geo.server}/geoserver/dce/wms?', {
				        layers: 'dce:ne<%= request.getParameter("entidad") %>'
				    }),				    

				    pasto: L.tileLayer.wms('http://${pro.ip.geo.server}:${pro.port.geo.server}/geoserver/dce/wms?', {
				        layers: 'dce:pasto<%= request.getParameter("entidad") %>'
				    }),		
				    
				    adoquin: L.tileLayer.wms('http://${pro.ip.geo.server}:${pro.port.geo.server}/geoserver/dce/wms?', {
				        layers: 'dce:adoquin<%= request.getParameter("entidad") %>'
				    }),	
				    
				    servicios: L.tileLayer.wms('http://${pro.ip.geo.server}:${pro.port.geo.server}/geoserver/dce/wms?', {
				        layers: 'dce:servicios<%= request.getParameter("entidad") %>'
				    })

			};	
			L.control.layers(basemaps).addTo(map);
			basemaps.mapas.addTo(map);
			L.marker([<%= request.getParameter("lat") %>,<%= request.getParameter("long") %>]).addTo(map);
            </script>
		</div>		
	</body>
</html>