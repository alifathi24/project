// TODO: import scanner.
import java.util.Scanner;

public class Calculator {
  public static void main(String[] args) {
    Scanner scan = new Scanner(System.in);
    int firstNumber = scan.nextInt();
    int secondNumber = scan.nextInt();
    scan.nextLine();
    String operation = scan.nextLine();

    if (operation.equals("add")) {
      System.out.println(firstNumber + " + " + secondNumber + " = " + (firstNumber + secondNumber));

    } else if (operation.equals("subtract")) {
      if (firstNumber > secondNumber) {
        System.out.println(firstNumber + " - " + secondNumber + " = " + (firstNumber - secondNumber));
      }

      else {
        System.out.println(secondNumber + " - " + firstNumber + " = " + (secondNumber - firstNumber));
      }

    } else if (operation.equals("divide")) {
      System.out.println(firstNumber + " / " + secondNumber + " = " + (firstNumber / secondNumber));
    } else if (operation.equals("multiply")) {
      System.out.println(firstNumber + " * " + secondNumber + " = " + (firstNumber * secondNumber));
    } else {
      System.out.println("Invalid number: try again!");
    }
    scan.close();
  }

}
