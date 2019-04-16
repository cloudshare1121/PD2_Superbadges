({
    init: function (cmp, event, helper) {
        helper.getBoatTypes(cmp);
        cmp.set('v.showNewButton', $A.get('e.force:createRecord'));

    },
    
    createNewBoatRecord: function (cmp, event, helper) {
        var selectedBoatType = cmp.get('v.selectedValue');
        var boatEvent = $A.get("event.force:createRecord");
        if (boatEvent) {
            if(selectedBoatType=='ALL'){
                boatEvent.setParams({
                    "entityApiName": "Boat__c"
                });
            }
            else
            {
                boatEvent.setParams({
                    "entityApiName": "Boat__c",
                    "defaultFieldValues": {
                        'BoatType__c' : selectedBoatType
                    }
                });
            }
            boatEvent.fire();
            console.log('finished1');
        }
        else{
            console.log('Account creation not supported');
            let button = cmp.find('btnNew');
            button.set('v.disabled',true);
        }
    },

    onFormSubmit: function (component, event, helper) {
        var boatTypeId = component.get("v.selectedValue");
        var formSubmitEvent = component.getEvent("formsubmit");
        var opts =  {"boatTypeId":boatTypeId};
        formSubmitEvent.setParams({
            "formData": opts
        });
        formSubmitEvent.fire();
    },

})