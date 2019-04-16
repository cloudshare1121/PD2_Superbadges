/**
 * Created on 23/03/2019.
 */
({
    onBoatClick: function (component, event, helper) {
        var boatSelectEvent = component.getEvent('boatselect');
        boatSelectEvent.setParam("boatId",component.get("v.boat.Id"));
        boatSelectEvent.fire();

        var boatSelectedEvent = $A.get('e.c:BoatSelected');
        boatSelectedEvent.setParam("boat",component.get("v.boat"));
        boatSelectedEvent.fire();

        var plotmarker = $A.get('e.c:PlotMapMarker');
        var boat = component.get('v.boat');
        plotmarker.setParams({
            "lat"   : boat.Geolocation__Latitude__s,
            "long"  : boat.Geolocation__Longitude__s,
            "label" : boat.Name,
            "SObjectId" : boat.Id
        })
        plotmarker.fire();
    },

})