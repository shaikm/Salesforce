public class OpportunityTriggerHandler {
    public static void handleClosedWonOpportunity(List<Opportunity> newList, Map<Id, Opportunity> oldMap) {
        for (Opportunity opp : newList) {
            if (oldMap.get(opp.Id).StageName == 'Closed Won') {
                opp.addError('Can not update a Closed Opportunity...');
            }
        }
    }
}