public class AssignmentClass1 {
    
    public static String reverseString(String s1) {  
        if (String.isBlank(s1)) {
            return '';
        }
        
        String output = '';
        String[] wordArray = s1.split(' ');  
        Integer count = wordArray.size() - 1;
        for (Integer i=count; i >= 0 ; i--) {
            output += wordArray[i] + ' ';
        }
        return output.trim();
    }
    
    // S1 is the string to test value, S2 is the input value 
    public static Boolean checkString(String s1, String s2) {  
        if (s2.startsWith(s1)){
            return true;
        } else if (s2.endsWith(s1)){
            return true;
        } else if (s2.contains(s1)) {
            return true;
        } 
        
        return false;    
    }
    
    public static void getSmallAndLargeValue(List<Integer> arr) {
        if (arr!=null && !arr.isEmpty()) {
            arr.sort();
            System.debug('' + arr);
            System.debug('Smallet Number:: ' + arr[0]);
            System.debug('Largest Number:: ' + arr[arr.size() - 1]);
        }
    }
    
    public static void getSmallAndLargeValueWithOutSort(List<Integer> arr) {
        if (arr!=null && !arr.isEmpty()) {
            Integer small = arr[0], large = arr[0];
            
            for (Integer i = 1 ; i< arr.size(); i++) {
                if (large  < arr[i]) {
                    large = arr[i];
                }
                
                if (small > arr[i]) {
                    small = arr[i];
                }
            }
            System.debug('Smallet Number:: ' + small);
            System.debug('Largest Number:: ' + large);
        }
    }
    
    
    public static Integer countPairsSum() {
        Integer[] arr = new List<Integer> { 1,5,4,1};
            Integer sum = 6;
        Map<Integer, Integer> countMap = new Map<Integer, Integer>();
        
        for (Integer i = 0; i < arr.size(); i++) {
            if (!countMap.containsKey(arr[i]))
                countMap.put(arr[i], 0);
            
            countMap.put(arr[i], countMap.get(arr[i]) + 1);
        }
        
        System.debug('Count::' + countMap);
        
        Integer pairCount = 0;
        
        
        for (Integer i = 0; i < arr.size(); i++) {
            if (countMap.containsKey(sum - arr[i]))
                pairCount += countMap.get(sum - arr[i]);
            if (sum - arr[i] == arr[i])
                pairCount--;
        }
        
        return pairCount / 2;
    }
    
    public static void countWords(String input) {
        if (input != null && String.isNotEmpty(input)){
            
            Map<String, Integer> wordMap = new Map<String, Integer>();
            String[] wordArray = input.split(',');
            for (String s: wordArray) {
                if (!wordMap.containsKey(s.trim())) {
                    wordMap.put(s.trim(), 1);
                } else {
                    wordMap.put(s.trim(), wordMap.get(s.trim()) + 1);
                }
            }
            
            for (String key: wordMap.keySet()) {
                System.debug(key + ' occurs ' + wordMap.get(key) + ' times.');
            }
        }
        
    }
    
    
    public static Boolean checkAnagram(String input1,String input2) {    
        if (input1 == null || input2 == null) {
            return false;
        }
        if (input1.length() != input2.length())
            return false;
        
        Map<String,Integer> input1Map = new Map<String,Integer>();
        Map<String,Integer> input2Map = new Map<String,Integer>();
        
        String[] charArray1 = input1.split('');
        String[] charArray2 = input2.split('');
        
        for (String s: charArray1) {
            if (!input1Map.containsKey(s)) {
                input1Map.put(s, 1);
            } else {
                input1Map.put(s, input1Map.get(s) + 1);
            }
        }
        
        for (String s: charArray2) {
            if (!input2Map.containsKey(s)) {
                input2Map.put(s, 1);
            } else {
                input2Map.put(s, input2Map.get(s) + 1);
            }
        }
        
        System.debug('Map1::' + input1Map + 'Map2::' + input2Map);
        for (String key: input1Map.keySet()) {
            if (input1Map.get(key) != input2Map.get(key)){
                return false;
            }
        }
        
        return true;
        
    }
    
    public static List<Account> getAccountList(String searchTerm) {
        searchTerm = '%'+searchTerm + '%';
        return [Select Id, Name from Account where Name Like :searchTerm];
    }
    
    public static void showProfile() {
        System.debug(SystemAdminProfile__c.getInstance(UserInfo.getProfileId()).isadmin__c);
    }
    
}