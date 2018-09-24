import java.util.Scanner;

/*
 * Programming Assignment2 COMP 3350
 * Author: Laney Martin
 * Date: September 20,2018
 */
 
 public class Assignment2 {
   
  /** Main method to get input */
   public static void main(String[] args) {
      Scanner scan = new Scanner(System.in);
      System.out.println("Enter a 16-bit binary number: ");
      String binary = scan.next();
      System.out.println("Value of the binary number: " + binaryString2Decimal(binary));
   }
   
  /** Converts a binary string to decimal int */
   public static int binaryString2Decimal(String binary) {
      int finalValue = 0;
      char[] cArray = binary.toCharArray();
      int place = 0;
      
      for (int i = cArray.length-1; i >= 0; i--) {
         finalValue = finalValue & 0x01;
         finalValue = finalValue | (cArray[i] << place);
         place++;
      }
      return finalValue;
   }
 }
