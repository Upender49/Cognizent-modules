public class OperatorPrecedence {
    public static void main(String[] args) {
        int result = 10 + 5 * 2 - 8 / 4 + (12 % 5);
        
        System.out.println("Result: " + result); 

        boolean logic = 5 > 3 && 2 < 4 || 8 == 9;
       
        System.out.println("Logical: " + logic);
    }
}
