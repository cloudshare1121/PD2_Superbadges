/**
 * Created on 26/03/2019.
 */
({
    onInit: function(component, event, helper){
        console.log('here: '+component.get('v.boat.Id'));
        var action = component.get("c.getAll");
        action.setParams({
            "boatId": component.get('v.boat.Id')
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            var opts = [];
            console.log('state: '+state);
            if (state === "SUCCESS") {
                component.set('v.boatReviews',response.getReturnValue());
                console.log('v.boatReviews: '+component.get('v.boatReviews'));
            }
        })
         $A.enqueueAction(action);
    },
})