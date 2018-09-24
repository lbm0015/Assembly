
/*****************************************************************************\
 * Programming Assignment COMP 3350                                             *
 * Author: Saad Biaz                                                           *
 * Date  : May 22, 2018                                                   *
 \*****************************************************************************/

/*****************************************************************************\
 *                             Global system headers                           *
 \*****************************************************************************/
#include <stdio.h>
#include <stdlib.h>



/*****************************************************************************\
 *                             Global data types                               *
 \*****************************************************************************/



/*****************************************************************************\
 *                             Global definitions                              *
 \*****************************************************************************/




/*****************************************************************************\
 *                            Global data structures                           *
 \*****************************************************************************/




/*****************************************************************************\
 *                                  Global data                                *
 \*****************************************************************************/



/*****************************************************************************\
 *                               Function prototypes                           *
 \*****************************************************************************/

unsigned int         hexaDigit2Value(char whichCharacter);


/*****************************************************************************\
 * function: main()                                                            *
 * usage:    command line with no parameter - main tries 3 fi=unctions         *
 *******************************************************************************
 * Inputs: ANSI flat C NO command line parameters                              *
 * Output: None                                                                *
 *                                                                             *
 
 \*****************************************************************************/

int main () {
    char digit;
    int value;
    printf("Enter a hexadecimal digit: ");
    scanf("%c", &digit);
    value = hexaDigit2Value(digit);
    if (value == -1) {
        printf("The character %c is invalid: %c is not a hexadecimal digit", digit, digit);
    }
    else {
        printf("hexaDigit2Value %d\n",value);
    }
} /* end of main function */

/***********************************************************************\
 * Input : hexadecimal digit (character)                                 *
 * Output: value of the digit                                            *
 * Function: returns value of binary digit                               *
 \***********************************************************************/
unsigned int         hexaDigit2Value(char whichCharacter){
    unsigned int value;
    if (whichCharacter >= 0x30 && whichCharacter <= 0x39) {
        value = whichCharacter & 0x0F;
        return value;
    }
    if (whichCharacter >= 0x41 && whichCharacter <= 0x46) {
        value = whichCharacter - 0x37;
        return value;
    }
    return -1;
}

