class Casa
  constructor: () ->
  vars:
  init: () ->
    this.ui.build()
    # this.listen()
  listen: () ->
    google.maps.event.addDomListener(window, 'load', this.map.init)
  ui:
    build: () ->
      this.sticky()
    sticky: () ->
      $('#navigation').sticky
        mode: 'fixed',
        offset: 45,
        onStick: ()->
          $('#navigation').find('.branding').css('opacity', 1)
        onStop: ()->
          $('#navigation').find('.branding').css('opacity', 0)
  map: {
    init: ()->
      styles = [
        {
          stylers: [
            { hue: "#352200" },
            { saturation: 100 },
            { lightness: 15 }
          ]
        },{
          featureType: "road",
          elementType: "geometry",
          stylers: [
            { lightness: 100 },
            { visibility: "simplified" }
          ]
        },{
          featureType: "road",
          elementType: "labels",
          stylers: [
            { visibility: "off" }
          ]
        }
      ]
      styledMap = new google.maps.StyledMapType(styles,
      {name: "Styled Map"})
      coord = new google.maps.LatLng(14.952391,120.064618)
      mapOptions = {
        zoom: 13
        center: coord,
        scrollwheel: false
        mapTypeId: google.maps.MapTypeId.ROADMAP
      }
      map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions)
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(14.952391,120.064618)
        map: map
      })

      map.mapTypes.set('map_style', styledMap)
      map.setMapTypeId('map_style')
  }

casa = new Casa
$(document).on 'ready', () ->
  casa.init()

window.addEventListener('DOMContentLoaded', () -> 
  casa.init()
)
