package calculator;
import java.util.*;

public class CalculatorV3 {
    public static void main(String args[]) {
        Scanner scan = new Scanner(System.in);
        //welcome message
        System.out.println("Welcome to CLI calculator");
        // first digit 
        System.out.println("Please enter first digit: ");
        double firstDigit = scan.nextDouble();
        // second digit
        System.out.println("Please enter second digit: ");
        double secondDigit = scan.nextDouble();

        System.out.println("Please enter operation: +, -, /, *");
        String operation = scan.next();

        switch (operation) {
            case "+":
                System.out.println(firstDigit + " + " + secondDigit + " = " + (firstDigit + secondDigit));                
                break;

            case "-":
                System.out.println(firstDigit + " - " + secondDigit + " = " + (firstDigit - secondDigit));                
                break;

            case "/":
                System.out.println(firstDigit + " / " + secondDigit + " = " + (firstDigit / secondDigit));                
                break;

            case "*":
                System.out.println(firstDigit + " * " + secondDigit + " = " + (firstDigit * secondDigit));                
                break;
        
            default:
                System.out.println("Invalid operation");

                break;
        }

        scan.close();
    }


    
}
