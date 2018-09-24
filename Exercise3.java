import java.util.Scanner;

/*
 * Programming Assignment2 COMP 3350
 * Author: Laney Martin
 * Date: September 20,2018
 */
 
 public class Exercise3 {
 
   /**
    * Main method asks user to enter an integer.
    */
   public static void main(String[] args) {
      Scanner scan = new Scanner(System.in);
      System.out.println("Enter a positive integer between 0 and 4294967295: ");
      int integer = scan.nextInt();
      System.out.println("Value of the binary number: " + integer2String(integer));
   }
   
   /**
    * integer2String method converts integer to equivalent binary string.
    */
   public static String integer2String(int integer) {
      char[] cArray = new char[32];
      int i = 0;
      int place = 0;
      int value = 0;
      
      for (i = 31; i > -1; i--) {
         value = integer & 1;
         integer = integer >> 1;
         cArray[i] = (char) (value | 0x30);
         place++;
      }
      return new String(cArray);
   }
 }
