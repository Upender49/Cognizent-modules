import java.util.*;
import java.util.concurrent.*;

public class CallableDemo {
    public static void main(String[] args) throws Exception {
        try (ExecutorService executor = Executors.newFixedThreadPool(3)) {
            List<Callable<Integer>> tasks = new ArrayList<>();
            for (int i = 1; i <= 5; i++) {
                final int n = i;
                tasks.add(() -> {
                    TimeUnit.MILLISECONDS.sleep(100);
                    return n * n;
                });
            }

            List<Future<Integer>> results = executor.invokeAll(tasks);
            for (Future<Integer> f : results) {
                System.out.println("Result: " + f.get());
            }
        }
    }
}
