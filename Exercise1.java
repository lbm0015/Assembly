import java.util.Scanner;

/*
 * Programming Assignment2 COMP 3350
 * Author: Emma Wells and Laney Martin
 * Date: September 20,2018
 */
 
 public class Exercise1 {
 
   /**
    * Main method asks user to enter a binary number.
    */
   public static void main(String[] args) {
      Scanner scan = new Scanner(System.in);
      System.out.println("Enter a 16-bit binary number: ");
      String binary = scan.next();
      System.out.println("Value of the binary number: " + binaryString2Decimal(binary));
   }
   
   /**
    * binaryString2Decimal method converts a binary string to the equivalent integer.
    */
   public static int binaryString2Decimal(String binary) {
      int finalValue = 0;
      char[] cArray = binary.toCharArray();
      int place = 0;
      
      for (int i = cArray.length-1; i >= 0; i--) {
         int value = cArray[i] & 0x0F;
         finalValue = finalValue | value << place;
         place++;
      }
      return finalValue;
   }
 }