import java.util.List;

public class StreamDemo {
    public static void main(String[] args) {
        List<Integer> numbers = List.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

        List<Integer> evens = numbers.stream()
                .filter(n -> n % 2 == 0)
                .toList();

        List<Integer> doubled = numbers.stream()
                .map(n -> n * 2)
                .toList();

        System.out.println("Evens: " + evens);
        System.out.println("Doubled: " + doubled);
    }
}
