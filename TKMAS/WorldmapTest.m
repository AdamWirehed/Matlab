% Map of Africa and India with major cities and populated places
  worldmap('Europe')
  land = shaperead('landareas.shp', 'UseGeoCoords', true);
  geoshow(land, 'FaceColor', [0.15 0.5 0.15])
  cities = shaperead('worldcities', 'UseGeoCoords', true);
  geoshow(cities, 'Marker', '.', 'Color', 'blue')