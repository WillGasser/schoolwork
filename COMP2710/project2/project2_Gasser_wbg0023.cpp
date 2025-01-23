// Will Gasser, wbg0023, project2_Gasser_wbg0023, g++ -o main.exe project2_Gasser_wbg0023.cpp, ./main.exe
// Date: 09/20/2023
// Course: COMP 2710 (Software Construction)

#include <stdio.h>
#include <iostream>
#include <iomanip>
# include <stdlib.h>
# include <assert.h>
# include <ctime>

using namespace std;

// ALL FUNCTION HEADERS AND CASES WERE TAKEN FROM THE DOCUMENT PROVIDED ON CANVAS

// randNum is the placeholder variable used to compare to Aaron's and Bob's probabilities.
int randNum = 0;

// Constants for amount of runs on each strategy, Aaron's probability, and Bob's probablity
// aProb and bProb are integers and not fractional because the rand() function
const int runs = 10000;
const int aProb = 33;
const int bProb = 50;

// This function detects if at least two of the players are still alive
bool at_least_two_alive(bool A_alive, bool B_alive, bool C_alive) {
    if ((A_alive + B_alive + C_alive) >= 2) {
        return true;
    }   
    return false;
}

// This function takes two boolean inputs and changes the status of B or C with a call by reference
// The rand function is used to compare to the constant probability
// Also the if statements insure targeting precedence of the other person with the highest accuracy
void Aaron_shoots1(bool& B_alive, bool& C_alive) {
    if (C_alive) {
        randNum = rand() % 100;
        if (randNum < aProb) {
            C_alive = false;
        }
    }
    else if (B_alive) {
        randNum = rand() % 100;
        if (randNum < aProb) {
            B_alive = false;
        }
    }
    
}

// This function is the same as the previous but for Bob's probabiltiy
void Bob_shoots(bool& A_alive, bool& C_alive) {
    if (A_alive && !C_alive) {
        randNum = rand() % 100;
        if (randNum < bProb) {
            A_alive = false;
        }
    }
    if (C_alive == true) {
        randNum = rand() % 100;
        if (randNum < bProb) {
            C_alive = false;
        }
    }
}


// This function is different in that Charlie never misses 
void Charlie_shoots(bool& A_alive, bool& B_alive) {
    if (A_alive && !B_alive) {
        A_alive = false;
    }
    if (B_alive == true) {
        B_alive = false;
    }
 }

// This is the exact same as Aaron_shoots1 except an external if statement is only met after Aaron's first turn
// This means Aaron will miss his first shot in this function
void Aaron_shoots2(bool& B_alive, bool& C_alive) {
    if (!B_alive || !C_alive) { 
        if (C_alive) {
            randNum = rand() % 100;
            if (randNum < aProb) {
                C_alive = false;
            }
        }
        else if (B_alive) {
            randNum = rand() % 100;
            if (randNum < aProb) {
                B_alive = false;
            }
        }
    }
}

// This is the test driver for at_least_two_alive() and goes through each case using the assert function
void test_at_least_two_alive(void) {
    cout << "Unit Testing 1: Function – at_least_two_alive()\n";
    cout << "\tCase 1: Aaron alive, Bob alive, Charlie alive\n";
    assert(true == at_least_two_alive(true, true, true));
    cout << "\tCase passed ...\n";

    cout << "\tCase 2: Aaron dead, Bob alive, Charlie alive\n";
    assert(true == at_least_two_alive(false, true, true));
    cout << "\tCase passed ...\n";

    cout << "\tCase 3: Aaron alive, Bob dead, Charlie alive\n";
    assert(true == at_least_two_alive(true, false, true));
    cout << "\tCase passed ...\n";

    cout << "\tCase 4: Aaron alive, Bob alive, Charlie dead\n";
    assert(true == at_least_two_alive(true, true, false));
    cout << "\tCase passed ...\n";

    cout << "\tCase 5: Aaron dead, Bob dead, Charlie alive\n";
    assert(false == at_least_two_alive(false, false, true));
    cout << "\tCase passed ...\n";

    cout << "\tCase 6: Aaron dead, Bob alive, Charlie dead\n";
    assert(false == at_least_two_alive(false, true, false));
    cout << "\tCase passed ...\n";

    cout << "\tCase 7: Aaron alive, Bob dead, Charlie dead\n";
    assert(false == at_least_two_alive(true, false, false));
    cout << "\tCase passed ...\n";

    cout << "\tCase 8: Aaron dead, Bob dead, Charlie dead\n";
    assert(false == at_least_two_alive(false, false, false));
    cout << "\tCase passed ...\n";
}

// This is another test driver for the Aaron_shoots1() function: a loop is used to wait until Aaron hits
// a target in order to decipher who he is shooting at and compare it to the expected value with the asser() function
void test_Aaron_shoots1(void) {
    cout << "Unit Testing 2: Function – test_Aaron_shoots1(Bob_alive, Charlie_alive)\n";
    cout << "\tCase 1: Bob alive, Charlie alive\n";
    bool B = true; bool C = true;
    while (C && B) {
        Aaron_shoots1(B,C);
    }
    assert(!C && B);
    cout << "\t\tAaron is shooting at Charlie\n";

    cout << "\tCase 2: Bob dead, Charlie alive\n";
    B = false; C = true;
    while (C) {
        Aaron_shoots1(B,C);
    }
    assert(!C && !B);
    cout << "\t\tAaron is shooting at Charlie\n";

    cout << "\tCase 3: Bob alive, Charlie dead\n";
    B = true; C = false;
    while (B) {
        Aaron_shoots1(B,C);
    }
    assert(!C && !B);
    cout << "\t\tAaron is shooting at Bob\n";
}

// Test driver for Bob_shoots
void test_Bob_shoots(void) {
    cout << "Unit Testing 3: Function – test_Bob_shoots(Aaron_alive, Charlie_alive)\n";
    cout << "\tCase 1: Aaron alive, Charlie alive\n";
    bool A = true; bool C = true;
    while (C && A) {
        Aaron_shoots1(A,C);
    }
    assert(!C && A);
    cout << "\t\tBob is shooting at Charlie\n";

    cout << "\tCase 2: Aaron dead, Charlie alive\n";
    A = false; C = true;
    while (C) {
        Aaron_shoots1(A,C);
    }
    assert(!C && !A);
    cout << "\t\tBob is shooting at Charlie\n";

    cout << "\tCase 3: Aaron alive, Charlie dead\n";
    A = true; C = false;
    while (A) {
        Aaron_shoots1(A,C);
    }
    assert(!C && !A);
    cout << "\t\tBob is shooting at Aaron\n";
}

// Test driver for Charlie_shoots
void test_Charlie_shoots(void) {
    cout << "Unit Testing 4: Function – test_Charlie_shoots(Aaron_alive, Bob_alive)\n";
    cout << "\tCase 1: Aaron alive, Bob alive\n";
    bool A = true; bool B = true;
    Charlie_shoots(A,B);
    assert(!B && A);
    cout << "\t\tCharlie is shooting at Bob\n";

    cout << "\tCase 2: Aaron dead, Bob alive\n";
    A = false; B = true;
    Charlie_shoots(A,B);
    assert(!B && !A);
    cout << "\t\tCharlie is shooting at Bob\n";

    cout << "\tCase 3: Aaron alive, Bob dead\n";
    A = true; B = false;
    while (A) {
        Aaron_shoots1(A,B);
    }
    assert(!B && !A);
    cout << "\t\tCharlie is shooting at Aaron\n";
}

// Test driver for Aaron_shoots2
void test_Aaron_shoots2(void) {
    cout << "Unit Testing 5: Function – test_Aaron_shoots2(Bob_alive, Charlie_alive)\n";
    cout << "\tCase 1: Bob alive, Charlie alive\n";
    bool B = true; bool C = true;
    for (int i = 0; i < 15; i++) {
        Aaron_shoots2(B,C);
    }
    assert(C && B);
    cout << "\t\tAaron intentionally misses his first shot\n";
    cout << "\t\tBoth Bob and Charlie are alive.\n";

    cout << "\tCase 2: Bob dead, Charlie alive\n";
    B = false; C = true;
    while (C) {
        Aaron_shoots2(B,C);
    }
    assert(!C && !B);
    cout << "\t\tAaron is shooting at Charlie\n";

    cout << "\tCase 3: Bob alive, Charlie dead\n";
    B = true; C = false;
    while (B) {
        Aaron_shoots2(B,C);
    }
    assert(!C && !B);
    cout << "\t\tAaron is shooting at Bob\n";
}

// This function pauses the terminal and waits for the enter key to be pressed to resume
void wait() {
    cout << "Press enter to continue...\n";
    cin.ignore().get(); //Pause Command for Linux Terminal
}


// This is the duel function that simplifies all of the workings of the duel so
// the main driver is less cluttered. It uses an external loop that iterates based
// on the 'runs' constant. Within this loop, the duel is run so that Aaron, Bob, and
// Charlie take turns shooting in that order. When one is left alive a win
// added to their score. A percentage based on the total duels is calculated and output
// with proper formetting. This is done for both strategy 1 and 2.
 void duel() {
    
    bool A = true;
    bool B = true;
    bool C = true;

    int aWin = 0;
    int bWin = 0;
    int cWin = 0;

    float a1Percent = 0;
    float a2Percent = 0;

    cout << "Ready to test strategy 1 (run 10000 times):\n";
    wait();

    for (int i = 0; i <= runs; i++) {
        srand(time(0) + i * 200);
        while(at_least_two_alive(A, B, C)) {
            if (A) {
            Aaron_shoots1(B, C);
            }
            
            if (B) {
            Bob_shoots(A, C);
            }
            
            if (C) {
            Charlie_shoots(A, B);
            }
        }
        A ? aWin++ : (B ? bWin++ : cWin++);
        A = true;
        B = true; 
        C = true;

    }

    a1Percent = (float)aWin / runs * 100;
    float bPercent = (float)bWin / runs * 100;
    float cPercent = (float)cWin / runs * 100;

    printf("Aaron won %d/%d duels or %0.2f%%\n", aWin, runs, a1Percent);
    printf("Bob won %d/%d duels or %0.2f%%\n", bWin, runs, bPercent);
    printf("Charlie won %d/%d duels or %0.2f%%\n\n", cWin, runs, cPercent);

    cout << "Ready to test strategy 2 (run 10000 times):\n";
    wait();

    A = true;
    B = true;
    C = true;

    aWin = 0;
    bWin = 0;
    cWin = 0;

    for (int i = 0; i <= runs; i++) {
        srand(time(0) + i * 200);
        while(at_least_two_alive(A, B, C)) {
            if (A) {
            Aaron_shoots2(B, C);
            }
            
            if (B) {
            Bob_shoots(A, C);
            }
            
            if (C) {
            Charlie_shoots(A, B);
            }
        }
        A ? aWin++ : (B ? bWin++ : cWin++);
        A = true;
        B = true; 
        C = true;

    }

    a2Percent = (float)aWin / runs * 100;
    bPercent = (float)bWin / runs * 100;
    cPercent = (float)cWin / runs * 100;

    printf("Aaron won %d/%d duels or %0.2f%%\n", aWin, runs, a2Percent);
    printf("Bob won %d/%d duels or %0.2f%%\n", bWin, runs, bPercent);
    printf("Charlie won %d/%d duels or %0.2f%%\n\n", cWin, runs, cPercent);

    a2Percent > a1Percent ? cout << "Strategy 2 is better than strategy 1.\n" : cout << "Strategy 1 is better than strategy 2.\n"; 

 }

    
    
// Main driver

int main() {


    cout << "\n*** Welcome to Will's Duel Simulator ***\n";

    test_at_least_two_alive();
    wait();
    test_Aaron_shoots1();
    wait();
    test_Bob_shoots(); 
    wait();
    test_Charlie_shoots();
    wait();
    test_Aaron_shoots2();
    wait();

    duel();
    
   
}