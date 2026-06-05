class Car {
    String make;
    String model;
    int year;

    Car(String make, String model, int year) {
        this.make = make;
        this.model = model;
        this.year = year;
    }

    void displayDetails() {
        System.out.println(year + " " + make + " " + model);
    }

    @Override
    public String toString() {
        return "Car{make='" + make + "', model='" + model + "', year=" + year + "}";
    }
}

public class CarDemo {
    public static void main(String[] args) {
        Car c1 = new Car("Toyota", "Camry", 2023);
        Car c2 = new Car("Honda", "Civic", 2022);
        c1.displayDetails();
        System.out.println(c2);
    }
}
