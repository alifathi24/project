package calculator;
import java.util.*;
public class CalculatorV4 {
    public static void main(String args[]) {
        Scanner scan = new Scanner(System.in);

        // welcome
        System.out.println("Welcome to CLI Calculator!");
    
        System.out.println("Please type first number: ");
        double firstDigit = scan.nextDouble();
        System.out.println("Please type second number: ");
        double secondDigit = scan.nextDouble();
        System.out.println("Please type an operation to used on numbers, +, -, /, * : ");
        String operation = scan.next();
        

        try {
            double result = calculate(firstDigit, secondDigit, operation);
            System.out.println("Result: " + result);
        } catch (IllegalArgumentException e){
            System.out.println("Error:" + e.getMessage());
        }
        
        scan.close();
    }

    public static double calculate(double firstDigit, double secondDigit, String operation) {

        switch (operation) {
            case "+":
                return firstDigit + secondDigit;

            case "-":
                return firstDigit - secondDigit;

            case "*":
                return firstDigit * secondDigit;
        
                
            case "/":
                if (secondDigit == 0){
                    throw new IllegalArgumentException("Division by zero");
                }

                return firstDigit / secondDigit;

            default:
                throw new IllegalArgumentException("Invalid operation");
        }
    
    }

   
}
