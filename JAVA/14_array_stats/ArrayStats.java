import java.util.Scanner;

public class ArrayStats {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Number of elements: ");
        int n = sc.nextInt();
        int[] arr = new int[n];

        System.out.println("Enter elements:");
        for (int i = 0; i < n; i++) arr[i] = sc.nextInt();

        int sum = 0;
        for (int val : arr) sum += val;
        double avg = (double) sum / n;

        System.out.println("Sum: " + sum);
        System.out.println("Average: " + avg);
    }
}
