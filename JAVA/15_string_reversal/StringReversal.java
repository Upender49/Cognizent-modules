import java.util.Scanner;

public class StringReversal {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter a string: ");
        String input = sc.nextLine();

       
        String reversed = new StringBuilder(input).reverse().toString();
        System.out.println("Reversed: " + reversed);

       
        StringBuilder manual = new StringBuilder();
        for (int i = input.length() - 1; i >= 0; i--) {
            manual.append(input.charAt(i));
        }
        System.out.println("Manual reversed: " + manual);
    }
}
