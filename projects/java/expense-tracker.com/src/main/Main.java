import java.util.*;
import java.time.LocalDate;

public class Main {
    public static void main (String args[]){
        Scanner scan = new Scanner(System.in);
        LocalDate today = LocalDate.now();

        System.out.println("Today's date is: " + today);
        System.out.println("Enter the expense category:\n\n\t 1.Grocery\n\t 2.Rent\n\t 3.Utilities\n\t");

        double expenseAmount = Double.valueOf(scan.nextDouble());

        


        
    }
}