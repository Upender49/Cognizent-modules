public class PatternMatchingSwitch {
    static String describe(Object obj) {
        return switch (obj) {
            case null -> "It's null";
            case Integer i when i > 0 -> "Positive integer: " + i;
            case Integer i -> "Integer: " + i;
            case String s when s.isEmpty() -> "Empty string";
            case String s -> "String: " + s;
            case Double d -> "Double: " + d;
            default -> "Unknown type";
        };
    }

    public static void main(String[] args) {
        System.out.println(describe(42));
        System.out.println(describe("Hello"));
        System.out.println(describe(3.14));
        System.out.println(describe(-5));
        System.out.println(describe(null));
    }
}
