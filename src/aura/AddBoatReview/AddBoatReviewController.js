/**
 * Created on 25/03/2019.
 */
({
    doInit: function(component, event, helper) {
        helper.onInit(component, event, helper);
    },

    onSave: function(component,event,helper){
        var service = component.find("service");
        service.saveRecord($A.getCallback(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                var resultsToast = $A.get("e.force:showToast");
                if(resultsToast != undefined)
                {
                    resultsToast.setParams({
                    "title": "Saved",
                    "message": "The record was saved."
                    });
                    resultsToast.fire();
                }
                else{
                    alert('SUCCESS');
                }
            }
            else{
                var resultsToast = $A.get("e.force:showToast");
                if(resultsToast != undefined)
                {
                    resultsToast.setParams({
                    "title": "Error",
                    "message": "The record was not saved: "+JSON.stringify(saveResult.error)
                    });
                    resultsToast.fire();
                }
                else{
                    alert('ERROR');
                }
            }
        }));
        console.log('boatreviewevent');
                var boatreviewadded = component.getEvent("boatreviewadded");
                boatreviewadded.fire();

    },

    onRecordUpdated:  function(component,event,helper){
        console.log('boatreviewevent');
        var boatreviewadded = component.getEvent("boatreviewadded");
        boatreviewadded.fire();
    },
})