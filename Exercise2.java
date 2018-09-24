import java.util.Scanner;

/*
 *
 */
 
 public class Assignment2 {
 
   public static void main(String[] args) {
      Scanner scan = new Scanner(System.in);
      System.out.println("Enter a 16-bit binary number: ");
      String binary = scan.next();
      System.out.println("Value of the binary number: " + binaryString2Decimal(binary));
   }
   
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