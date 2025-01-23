// Will Gasser, wbg0023, project4_Gasser_wbg0023, g++ -std=c++11 -o main.exe project4_Gasser_wbg0023.cpp, ./main.exe
// Date: 10/25/2023
// Course: COMP 2710 (Software Construction)

// I used some inspiration from the provided sample code


/////////////////////////////////////////////

// DEFINE THIS MACRO FOR DEBUGGING VERSION //

//#define Unit_Testing

// DEFINE THIS MACRO FOR DEBUGGING VERSION //

/////////////////////////////////////////////


#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <assert.h>

using namespace std;

struct triviaNode {
    string question;
    string answer;
    int pointVal;
    triviaNode* next;
    struct triviaNode* left;
    struct triviaNode* right;

    triviaNode(string q, string a, int p) {
        question = q;
        answer = a;
        pointVal = p;
        next = nullptr;
    }
};

 
// Recursive function for continually adding questions to the game.
void newQuiz(triviaNode* root) {
    triviaNode* iterator;
    string continVar;
    string question;
    string answer;
    int pointVal;
    cout << "Enter a question: ";
    getline(cin, question);
    cout << "Enter an answer: ";
    getline(cin, answer);
    cout << "Enter award points: ";
    cin >> pointVal;

    iterator = new triviaNode(question, answer, pointVal);
    root ->next = iterator;

    cout << "Continue? (Yes/No): ";
    cin.ignore();
    getline(cin, continVar);

    if (continVar == "Yes" || continVar == "yes") {
        newQuiz(iterator);
    }

}

// This method sets up the inital conditions and fills the user inputs by prompt.
triviaNode gameSetUp(bool test) {

    triviaNode* head = new triviaNode("How long was the shortest war on record? (Hint: how many minutes)", 
     "38", 100);

    head ->next = new triviaNode("What was Bank of America’s original name? (Hint: Bank of Italy or Bank of Germany)",
     "Bank of Italy", 50);

    head ->next ->next = new triviaNode("What is the best-selling video game of all time? (Hint: Call of Duty or Wii Sports)?",
     "Wii Sports", 20);

    if (!test) {
        newQuiz(head ->next ->next);
    }

    cout << endl;

    return *head;

}

int totalPoints = 0;

// This checks the answers and runs the game.
bool runGame(triviaNode list, int asked, bool test) {
    
    if (asked <= 0) {
        cout << "Warning - the number of trivia to be asked must equal to or be larger than 1.\n";
        return false;
    }
    
    int counter = 0;

    totalPoints = 0;
    
    string userAnswer = "";

    triviaNode* current = &list;
    
    while (current != nullptr) {
        if (counter == asked) {
            return true;
        }
        cout << "Question: " << current ->question  << endl;
        cout << "Answer: ";
        getline(cin, userAnswer);
        if (userAnswer == current ->answer) {
            cout << "Your answer is correct. You receive " << current ->pointVal << " points.\n";
            totalPoints += current ->pointVal;
        }
        else {
            cout << "Your answer is wrong. The correct answer is: " << current ->answer << "\n";
        }

        cout << "Your Total points: " << totalPoints << "\n\n"; 
        counter++;
        current = current->next;
    }
    if (test) {
        if (counter < asked) {
            cout << "Warning - there are not enough trivia questions in list to ask " 
            << asked << " questions. Only " << counter << " questions were asked.\n";
            return false;
        }
    }
    return true;
}




int main() {

    #ifdef Unit_Testing
        
        triviaNode noPrompt = gameSetUp(true);

        cout << "*** This is a debugging version ***\nUnit Test Case 1: Ask no question. The program should give a warning message.\n";
        assert(!runGame(noPrompt, 0, true));
        cout << "Case 1 Passed\n\n";

        cout << "Unit Test Case 2.1: Ask 1 question in the linked list. The tester enters an incorrect answer.\n";
        runGame(noPrompt, 1, true);
        assert(totalPoints == 0);
        cout << "Case 2.1 Passed\n\n";

        cout << "Unit Test Case 2.2: Ask 1 question in the linked list. The tester enters a correct answer.\n";
        runGame(noPrompt, 1, true);
        assert(totalPoints == 100);
        cout << "\nCase 2.2 passed\n\n";

        cout << "Unit Test Case 3: Ask all the questions in the linked list.\n";
        assert(runGame(noPrompt, 3, true));
        cout << "\nCase 3 passed\n\n";

        cout << "Unit Test Case 4: Ask 5 questions in the linked list.\n";
        assert(!runGame(noPrompt, 5, true));
        cout << "\nCase 4 passed\n\n";

        cout << "*** End of debugging version ***\n";
        

    #else
        cout << "*** Welcome to Will’s trivia quiz game ***\n";

        triviaNode startGame = gameSetUp(false);
        runGame(startGame, 10000000, false);

        cout << "*** Thank you for playing the trivia quiz game. Goodbye! ***\n";
    #endif

}