
#include <iostream>
#include <iomanip>
#include <cstdlib>
using namespace std; 

enum Cities {

    CITY_AUBURN,

    CITY_ATLANTA,

    CITY_ATHENS,

};

 

void printCity(Cities city) {

    switch(city) {
    case 0: cout << "Auburn";
        break;

    case 1: cout << "Atlanta";
        break;

    case 2:  cout << "Athens";
        break;
    default:
        cout << "Unknown";
    }
}

int main() {
   /* for (int n = 0; n < 300; n = n + 100) {
        cout << "X\n";
        if (n == 0) {
            n = 100;
        }
    } */

    int n = 100;
    do {
        cout << "X\n";
        n = n + 100;
       }
    while (n < 300);
}