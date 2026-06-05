import java.util.HashMap;
import java.util.Scanner;

public class HashMapDemo {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        HashMap<Integer, String> students = new HashMap<>();

        students.put(101, "Alice");
        students.put(102, "Bob");

        System.out.print("Enter ID to lookup: ");
        int id = sc.nextInt();
        String name = students.getOrDefault(id, "Student not found");
        System.out.println(name);
    }
}
