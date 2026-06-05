import java.util.List;

record Person(String name, int age) {
    Person {
        if (age < 0) throw new IllegalArgumentException("Age cannot be negative");
    }
}

public class RecordDemo {
    public static void main(String[] args) {
        List<Person> people = List.of(
            new Person("Alice", 30),
            new Person("Bob", 17),
            new Person("Charlie", 25)
        );

        people.stream()
              .filter(p -> p.age() >= 18)
              .forEach(System.out::println);
    }
}
