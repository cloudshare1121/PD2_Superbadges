({
    jsLoaded: function(component) {
        component.set("v.jsLoaded", true);
    },

    onPlotMapMarker: function(component, event, helper) {
        var sObjectId = event.getParam('sObjectId');
        var lat = event.getParam('lat');
        var long = event.getParam('long');
        var label = event.getParam('label');
        console.log('latitude: '+lat);
        component.set("v.location", {'lat' : lat, 'long' : long});
    }
})