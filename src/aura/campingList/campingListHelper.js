({
	createItem : function(component){
        var action = component.get("c.saveItem");
        action.setParams({
            "campingListItem": component.get("v.newItem")
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