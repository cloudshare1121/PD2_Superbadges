({    
    handleAddItem : function(component, event, helper) {                                
        //helper.createItem(component); 
        console.log("here in handleAddItem");
        var updatedItem = event.getParam("item");        
        console.log("here in handleAddItem1: "+JSON.stringify(updatedItem));
        var action = component.get("c.saveItem");
        action.setParams({
            "campingListItem": updatedItem
        });
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
})