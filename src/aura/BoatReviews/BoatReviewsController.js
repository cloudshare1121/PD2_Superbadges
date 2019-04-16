/**
 * Created  on 26/03/2019.
 */
({
    doInit: function(component, event, helper) {
        helper.onInit(component, event, helper);
    },

    onUserInfoClick : function(component,event,helper){
        var userId = event.currentTarget.getAttribute("data-userid");
        var redirectToUser = $A.get("e.force:navigateToSObject");
        redirectToUser.setParams({
            "recordId" : userId,
        });
        redirectToUser.fire()

    },
})