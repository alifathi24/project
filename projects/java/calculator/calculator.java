package calculator;
import java.util.*;

public class Calculator {
   public static void main(String arg[]){
      Scanner scan = new Scanner(System.in);
      // String addition = "+";
      // String substraction = "-";
      // String mutliplication = "*";
      // String divition = "/";
     
      System.out.println("Welcome to CLI calculator: ");
      System.out.println("Please enter the first number: ");
    double firstDigit = scan.nextDouble();
      System.out.println("Please enter the second number: ");
      
    double secondDigit = scan.nextDouble();
      System.out.println("Enter an operation, +, -, /, *");
      String operation = scan.next();

      // System.out.println("Operation is " + operation);
      // System.out.println(firstDigit);
      // System.out.println(secondDigit);
      if (secondDigit == 0) {
         System.out.println("Erro division by zero.");
      }

      else  if (operation.equals("+")) {
         System.out.println(firstDigit + " + " + secondDigit + " = " + (firstDigit + secondDigit));
    }
      else if (operation.equals("-")) {
         System.out.println(firstDigit + " - " + secondDigit + " = " + (firstDigit - secondDigit));
      }
    else if (operation.equals("*")) {
         System.out.println(firstDigit + " * " + secondDigit + " = " + (firstDigit * secondDigit));
    }
    else if (operation.equals("/")) {
         System.out.println(firstDigit + " / " + secondDigit + " = " + (firstDigit / secondDigit));
    }

    else {
      System.out.println("Invalid operation");
    }

    scan.close();
   } 
}
