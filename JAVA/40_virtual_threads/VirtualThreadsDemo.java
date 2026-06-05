import java.time.Duration;
import java.time.Instant;

public class VirtualThreadsDemo {
    public static void main(String[] args) {
        Instant start = Instant.now();

        for (int i = 0; i < 100_000; i++) {
            final int id = i;
            Thread.startVirtualThread(() -> {
                if (id == 0) System.out.println("Running on " + Thread.currentThread());
            });
        }

        try { Thread.sleep(2000); } catch (InterruptedException e) {}

        System.out.println("Time: " + Duration.between(start, Instant.now()).toMillis() + "ms");
    }
}
