/**
 * Created on 23/03/2019.
 */
({
    onBoatSelected: function(component,event,helper){
      var boat = event.getParam("boat");
      component.set('v.id',boat.Id);
      component.find('service').reloadRecord(true);

    },

    onRecordUpdated: function(component,event,helper){
        var boatReviews = component.find("boatReviews");
        if(boatReviews!=undefined){
            boatReviews.refresh();
        }
    },

    onBoatReviewAdded: function(component,event,helper){
        var boatReviews = component.find("boatReviews");
        if(boatReviews!=undefined){
            boatReviews.refresh();
        }
        component.find("tabs").set("v.selectedTabId", "boatreviewtab");

    },
})