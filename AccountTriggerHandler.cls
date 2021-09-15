public class AccountTriggerHandler {
    
    public static void updateRating(List<Account> newList) {
        for (Account a: newList) {
            updateRatingFiled(a);
        }
    }
    
    public static void updateRating(List<Account> newList,  Map<Id, Account> oldMap) {
        List<Account> filteredList = new List<Account>();
        for (Account a: newList) {
            Account oldAccount = oldMap.get(a.Id);
            if (a.Industry != oldAccount.Industry) {
                updateRatingFiled(a);   
            }
        }
    }
    
    private static void updateRatingFiled(Account a) {
        if (a.Industry == 'Agriculture') {
            a.Rating = 'Hot';
        } else if(a.Industry == 'Consulting') {
            a.Rating = 'Warm';
        } else if (a.Industry == 'Electronics') {
            a.Rating = 'Cold';
        } else {
            a.Rating = null;
        }
    }
}