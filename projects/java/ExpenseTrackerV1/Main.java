

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        ArrayList<Expense> expenses = new ArrayList<>();

        System.out.println("Welcome to CLI Expense Tracker");
        System.out.println("===================================");
        while (true) {
            System.out.println("\n1) Add expense");
            System.out.println("2) List expenses");
            System.out.println("3) Show totals");
            System.out.println("4) Exit");
            System.out.println("Select: ");
            
            int menu = readInt(scan, 1, 4);

            if (menu == 1){
                addExpense(scan, expenses);
            }
        }
    }
}