import java.util.*;
import java.time.LocalDate;

public class Main {
    public static void main (String args[]){
        Scanner scan = new Scanner(System.in);
        LocalDate today = LocalDate.now();
        System.out.println("Welcome to CLI expense tracker");
        System.out.println("======================================");
        System.out.println("\n\tToday's date is: " + today);
        System.out.println("======================================");
        System.out.println("\tEnter the expense category:\n\n\t 1.Grocery\n\t 2.Rent\n\t 3.Utilities\n\t 4.Internet and Substription\n\t 5.Phone\n\t 6.Transportation\n\t 7.Other\n");

        int expenseCategory = Integer.valueOf(scan.nextInt());
        double expenseAmount = Double.valueOf(scan.nextDouble());
        System.out.println("Category is: " + expenseCategory);
        System.out.println("Expense amount is $" + expenseAmount);
        
        switch (expenseCategory) {
            case 1:
                System.out.println("Expense is: " + expenseCategory);
                System.out.println("Its cost is: $" + expenseAmount);
                
                break;
        
            default:
                break;
        }


        
    }
}