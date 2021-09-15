public class BillDetailTriggerHandler {
    public static void rollupFields(Set<Id> billIds) {
        if (billIds != null && billIds.size() > 0) {
            Map<Id, Bill__c> billMap = new Map<Id, Bill__c>();
            
            for (Id billId: billIds) {
                billMap.put(billId, new Bill__c(ID= billId, Total_Price__c = 0,Min_Price__c = 0,Max_Price__c = 0,Total_Count__c = 0 ));
            }
            
            if (!billMap.isEmpty()) {
                for(AggregateResult aRes : [SELECT Bill__c, max(price__c) maxPrice, min(price__c) minPrice, sum(price__c) totalPrice, count(price__c) totalCount FROM Bill_Detail__c where Bill__c IN :billMap.keySet() group by Bill__c]) {
                    ID billID= (ID) aRes.get('Bill__c');
                    if (billMap.containsKey(billID)) {
                        billMap.get(billID).Max_Price__c = (Double) aRes.get('maxPrice');
                        billMap.get(billID).Min_Price__c = (Double) aRes.get('minPrice');
                        billMap.get(billID).Total_Price__c = (Double) aRes.get('totalPrice');
                        billMap.get(billID).Total_Count__c = (Double) aRes.get('totalCount');
                    }
                }
                
                try{
                    update billMap.values();
                }catch(DmlException de){
                    System.debug(de);
                }
            }
        }
    }
}