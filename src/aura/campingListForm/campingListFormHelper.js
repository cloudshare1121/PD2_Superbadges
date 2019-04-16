({
    createItem : function(component) {
        var broadcastEvent = component.getEvent("addItem");
        broadcastEvent.setParams({"item":component.get("v.newItem")});
        broadcastEvent.fire();           
        component.set("v.newItem","{'sobjectType': 'Camping_Item__c','Quantity__c':'0', 'Price__c':'0'}");
    },
})