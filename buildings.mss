@building-fill: rgba(217,208,201,0.6); //Lch(84, 5, 70)
@building-line: darken(@building-fill, 5%);
@building-low-zoom: lighten(@building-fill, 5%);

@building-major-fill: darken(@building-fill, 15%);
@building-major-line: darken(@building-major-fill, 10%);

@building-minor-fill: rgba(217,208,201,0.4); //Lch(84, 5, 70)
@building-minor-line: darken(@building-minor-fill, 5%);

@building-retail-fill: desaturate(darken(@retail, 4%), 20%);
@building-retail-line: darken(@building-retail-fill, 5%);

@building-commercial-fill: desaturate(darken(@commercial, 4%), 20%);
@building-commercial-line: darken(@building-commercial-fill, 3%);

@building-school-fill: desaturate(darken(@societal_amenities, 10%), 30%);
@building-school-line: darken(@building-school-fill, 10%);

@building-medical-fill: desaturate(darken(@societal_amenities, 15%), 30%);
@building-medical-line: darken(@building-medical-fill, 10%);

@entrance-permissive: darken(@building-line, 15%);
@entrance-normal: @building-line;


#buildings {
  [zoom >= 14] {
    polygon-fill: @building-low-zoom;
    polygon-clip: false;
    line-width: 0;
    [zoom >= 15] {
      polygon-fill: @building-fill;
      line-color: @building-line;
      line-width: .75;
      line-clip: false;
    }
    [amenity = 'place_of_worship'],
    [aeroway = 'terminal'],
    [aerialway = 'station'],
    [building = 'train_station'],
    [building = 'public'],
    [building = 'civic'],
    [building = 'church'],
    [building = 'chapel'],
    [building = 'cathedral'],
    [building = 'musholla'],
    [building = 'mosque'],
    [building = 'temple'],
    [public_transport = 'station'],
    [amenity = 'town_hall'] {
      polygon-fill: @building-major-fill;
      line-color: @building-major-line;
    }
    [building = 'garage'],
    [building = 'carport'],
    [building = 'shed'],
    [building = 'shelter'],
    [building = 'toilets'],
    [building = 'kitchen'],
    [building = 'roof'],
    [building = 'hut'],
    [building = 'ger'],
    [building = 'tent'],
    [building = 'static_caravan'],
    [building = 'greenhouse'],
    [building = 'farm_auxiliary'],
    [building = 'granary'],
    [building = 'agricultural'],
    [building = 'stable'],
    [building = 'cowshed'],
    [building = 'service'],
    [building = 'storage_tank'],
    [building = 'slurry_tank'],
    [building = 'barn'],
    [building = 'silo'],
    [building = 'abandoned'],
    [building = 'collapsed'],
    [building = 'ruins'],
    [building = 'construction'] {
      polygon-fill: @building-minor-fill;
      line-color: @building-minor-line;
    }
    [building = 'retail'],
    [building = 'supermarket'],
    [building = 'kiosk'],
    [building = 'mall'] {
      polygon-fill: @building-retail-fill;
      line-color: @building-retail-line;
    }
    [building = 'commercial'],
    [building = 'office'],
    [building = 'government_office'],
    [building = 'government'],
    [building = 'commercial;residential'] {
      polygon-fill: @building-commercial-fill;
      line-color: @building-commercial-line;
    }
    [building = 'school'],
    [building = 'university'],
    [building = 'college'],
    [building = 'kindergarten'],
    [building = 'education'],
    [amenity = 'kindergarten'] {
      polygon-fill: @building-school-fill;
      line-color: @building-school-line;
    }
    [building = 'hospital'],
    [building = 'clinic'],
    [amenity = 'hospital'],
    [amenity = 'clinic'] {
      polygon-fill: @building-medical-fill;
      line-color: @building-medical-line;
    }
  }
}

#bridge {
  [zoom >= 12] {
    polygon-fill: #B8B8B8;
  }
}

#entrances {
  [zoom >= 18]["entrance" != null]  {
    marker-fill: @entrance-normal;
    marker-allow-overlap: true;
    marker-ignore-placement: true;
    marker-file: url('symbols/rect.svg');
    marker-width: 5.0;
    marker-height: 5.0;
    marker-opacity: 0.0;
    ["entrance" = "main"] {
      marker-opacity: 1.0;
      marker-file: url('symbols/square.svg');
    }
  }
  [zoom >= 19]["entrance" != null] {
    ["entrance" = "yes"],
    ["entrance" = "main"],
    ["entrance" = "home"],
    ["entrance" = "service"],
    ["entrance" = "staircase"] {
      marker-opacity: 1.0;
      marker-width: 6.0;
      marker-height: 6.0;
      ["entrance" = "service"] {
        marker-file: url('symbols/corners.svg');
      }
    }
    ["access" = "yes"],
    ["access" = "permissive"] {
      marker-fill: @entrance-permissive;
    }
    ["access" = "no"] {
      marker-fill: @entrance-normal;
      marker-file: url('symbols/rectdiag.svg');
    }
  }
  [zoom >= 20]["entrance" != null] {
    marker-width: 8.0;
    marker-height: 8.0;
  }
}
