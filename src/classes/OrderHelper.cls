public class OrderHelper {

    /**
     * @name AfterUpdate
     * @description 
     * @param List<Order> newList
     * @param List<Order> oldList
     * @return void
    **/
    public static void AfterUpdate(List<Order> newList, List<Order> oldList){
        Set<Id> orderIds = new Set<Id>();
        for ( Integer i=0; i<newList.size(); i++ ){
            if ( (newList[i].Status != null
                    && oldList[i].Status != null)
                    && newList[i].Status == Constants.ACTIVATED_ORDER_STATUS
                    && oldList[i].Status != Constants.ACTIVATED_ORDER_STATUS ){
                orderIds.add(newList[i].Id);
            }
        }
        RollUpOrderItems(orderIds);
    }

    /**
     * @name RollUpOrderItems
     * @description Given a set of Activated Order ids, query the child Order Items and related Products to calculate Inventory levels
     * @param Set<Id> activatedOrderIds
     * @return void
    **/
    public static void RollUpOrderItems(Set<Id> activatedOrderIds){
        Map<Id,Product2> productMap = new Map<Id,Product2>();
        List<Id> productIds = new List<Id>();

        for(OrderItem item : [Select id,quantity,Product2Id from OrderItem where orderId in :activatedOrderIds]) {
            productIds.add(item.Product2Id);
        }

        productMap = new Map<Id,Product2>([Select id,Quantity_Ordered__c from product2 where id in :productIds]);
        AggregateResult[] aggreResult = [Select Product2Id,sum(Quantity) totalQuantity from OrderItem where product2Id in :productMap.keySet() group by product2Id];

        for(AggregateResult result : aggreResult) {

            productMap.get((String)result.get('Product2Id')).Quantity_Ordered__c = Integer.valueOf(result.get('totalQuantity'));
        }

        if(productMap!=null && productMap.size() > 0) {
            update productMap.values();
        }
    }
}