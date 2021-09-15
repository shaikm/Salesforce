public class OrderTriggerHandler {
    public static void appendOrder(List<Order> newList) {
        for (Order o: newList) {
            o.Name = 'Fissionlabs ' + o.Name;
        }
    }
    
    public static void checkClosedOrders(List<Order> newList) {
       	List<Order> filterdOrders = new List<Order>();
        for (Order o: newList) {
            if (o.Status == 'Activated') {
            	filterdOrders.add(o);
            }
        }
        
        for (Order o: newList) {
            o.addError('Can not delete an activated order');
        }
    }
}