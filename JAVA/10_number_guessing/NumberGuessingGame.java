import java.util.Scanner;
import java.util.Random;

public class NumberGuessingGame {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Random rand = new Random();
        int target = rand.nextInt(100) + 1;
        int guess, attempts = 0;

        System.out.println("Guess the number (1-100):");
        do {
            guess = sc.nextInt();
            attempts++;
            if (guess > target) System.out.println("Too high!");
            else if (guess < target) System.out.println("Too low!");
        } while (guess != target);

        System.out.println("Correct! You guessed it in " + attempts + " attempts.");
    }
}
