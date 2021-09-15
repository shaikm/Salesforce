public class OpportunityTriggerHandler {
    public static void handleClosedWonOpportunity(List<Opportunity> newList) {
        for (Opportunity opp : newList) {
            if (opp.StageName == 'Closed Won') {
                opp.addError('Can not update a Closed Opportunity...');
            }
        }
    }
}