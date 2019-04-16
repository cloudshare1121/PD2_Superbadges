({
    doInit : function(component, event, helper){
        var action = component.get("c.getItems");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items", items);
            }
        });
        $A.enqueueAction(action);            
    },        
    
    clickCreateItem : function(component, event, helper) {                
        var validitem = component.find('campingItemForm').reduce(function (validSoFar, inputCmp) {            
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        
        if(validitem){  
            helper.createItem(component);               
        }
    },
})