/**
 * Created on 20/03/2019.
 */
({
    doSearch: function (component, event, helper) {
        var formDataParams = event.getParam('arguments');//all arguments passed from the c:FormSubmit event
        component.set('v.boatTypeId',formDataParams.boatTypeId);
        helper.onSearch(component, event, helper);
    },

    onBoatSelect: function(component, event, helper) {
        var boatId = event.getParams('boatId');
        console.log('boatId: '+JSON.stringify(boatId));
        component.set('v.selectedBoatId', boatId.boatId);

    },
})