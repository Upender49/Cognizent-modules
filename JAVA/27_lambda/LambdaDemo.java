import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class LambdaDemo {
    public static void main(String[] args) {
        List<String> names = new ArrayList<>(List.of("Charlie", "Alice", "Bob"));
        Collections.sort(names, (a, b) -> a.compareTo(b));
        System.out.println("Ascending: " + names);

        Collections.sort(names, (a, b) -> b.compareTo(a));
        System.out.println("Descending: " + names);
    }
}
