/**
 * Created on 20/03/2019.
 */
({
    onSearch: function(component, event, helper){
            var action = component.get("c.getBoats");
            action.setParams({
                "boatTypeId": component.get('v.boatTypeId')=='ALL'?'':component.get('v.boatTypeId')
            });
            action.setCallback(this, function(response){
                var state = response.getState();
                if (state === "SUCCESS") {
                    //console.log('response: '+response.getReturnValue());
                    component.set('v.boats', response.getReturnValue());
                }
            });
            $A.enqueueAction(action);

        },
})