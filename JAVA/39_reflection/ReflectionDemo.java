import java.lang.reflect.*;

public class ReflectionDemo {
    public void sayHello(String name) {
        System.out.println("Hello, " + name);
    }

    public static void main(String[] args) throws Exception {
        Class<?> clazz = Class.forName("ReflectionDemo");
        Object instance = clazz.getDeclaredConstructor().newInstance();

        for (Method m : clazz.getDeclaredMethods()) {
            System.out.println("Method: " + m.getName());
        }

        Method method = clazz.getMethod("sayHello", String.class);
        method.invoke(instance, "Reflection");
    }
}
