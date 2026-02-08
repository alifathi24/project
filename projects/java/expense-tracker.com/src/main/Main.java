import java.util.*;
import java.time.LocalDate;

public class Main {
    public static void main (String args[]){
        Scanner scan = new Scanner(System.in);
        LocalDate today = LocalDate.now();
        System.out.println("Welcome to CLI expense tracker");
        
        System.out.println("======================================");

        while (true) {
            System.out.println("\n\tToday's date is: " + today);
            System.out.println("What would like to today?");
            System.out.println("======================================");
            System.out.println("Please select from the following: ");
            System.out.println("\n\t1. Add expense");
            System.out.println("\n\t2. List expense");
            System.out.println("\n\t3. Show total");
            System.out.println("\n\t4. Exit");
            int menu = Integer.valueOf(scan.nextInt());

            if (menu == 1) {
                System.out.println("Adding expense ....");
            } else if (menu == 2) {
                System.out.println("Listing " + today +"s expense ....");
            } else if (menu == 3) {
                System.out.println("Total is %...");
            }
        }
        


        
    }
}