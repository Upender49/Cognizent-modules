public class MethodOverloading {
    public static void main(String[] args) {
        System.out.println("(int, int): " + add(5, 10));
        System.out.println( "(double, double): " + add(5.5, 10.5));
        System.out.println("(int, int, int): " + add(5, 10, 15));
    }

    static int add(int a, int b) { return a + b; }
    static double add(double a, double b) { return a + b; }
    static int add(int a, int b, int c) { return a + b + c; }
}
"