import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        System.out.println("Welcome to CLI Expense Tracker");
        System.out.println("======================================");

        while (true) {
            System.out.println("\n1) Add expense");
            System.out.println("2) List expenses");
            System.out.println("3) Show totals");
            System.out.println("4) Save");
            System.out.println("5) Exit");
            System.out.print("Select: ");

            int menu = readInt(scan, 1, 5);

            if (menu == 1) {
                System.out.println("TODO: Add expense");
            } else if (menu == 2) {
                System.out.println("TODO: List expenses");
            } else if (menu == 3) {
                System.out.println("TODO: Show totals");
            } else if (menu == 4) {
                System.out.println("TODO: Save");
            } else if (menu == 5) {
                System.out.println("Goodbye.");
                break;
            }
        }

        scan.close();
    }

    private static int readInt(Scanner scan, int min, int max) {
        while (true) {
            String input = scan.nextLine().trim();

            try {
                int value = Integer.parseInt(input);

                if (value < min || value > max) {
                    System.out.print("Enter a number " + min + " to " + max + ": ");
                    continue;
                }

                return value;

            } catch (NumberFormatException e) {
                System.out.print("Invalid input. Enter a number: ");
            }
        }
    }
}

