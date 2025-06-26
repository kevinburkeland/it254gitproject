// CS131 Lab8.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <cstring>
#include <string>
using namespace std;

const uint16_t LIMIT = 24;
//const string VOWELS = "aeiou";


int main()
{
    char s1[LIMIT];
    int Cvowels = 0;
    string A_string;
    int string_Vowels = 0;
    //ask user for a word with max characters of 24
    cout << "Input at word with a limit of " << LIMIT << " characters and I will tell you how many vowels there are (Not Y)" << endl;
  
    cin.getline(s1, LIMIT);

    for (int i = 0; s1[i]; ++i) {
        if (s1[i] == 'a' || s1[i] == 'e' || s1[i] == 'i' || s1[i] == 'o' || s1[i] == 'u') {   // For loop that counts the number of vowels
            ++Cvowels;
        }
        
    }
    cout << "There are " << Cvowels << " vowels in the Cstring" << endl;

    cin.clear();
    fflush(stdin);
    cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');




    cout << "\n\n" << "Input sentence and I will tell you how many vowels there are " << endl;
    getline(cin, A_string);
   


    for (int i = 0; A_string[i]; ++i) {
         if (A_string[i] == 'a' || A_string[i] == 'e' || A_string[i] == 'i' || A_string[i] == 'o' || A_string[i] == 'u') { // For loop that counts the number of vowels
             ++string_Vowels;
         }

    }
    cout << "There are " << string_Vowels << " vowels in the String" << endl;
    

}

