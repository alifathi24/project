package calculator;
import java.util.*;

public class calculator {
   public static void main(String arg[]){
    Scanner scan = new Scanner(System.in);
    System.out.println("Welcome to CLI calculator: ");
    System.out.println("Please enter the first number: ");
    int firstDigit = scan.nextInt();
   System.out.println("Please enter the second number: ");
    int secondDigit = scan.nextInt();
    System.out.println("Enter an operation, +, -, /, *");
    String operation = scan.next();

    System.out.println("Operation is " + operation);
    System.out.println(firstDigit);
    System.out.println(secondDigit);
    
   } 
}
