// Will Gasser, wbg0023, project1_Gasser_wbg0023, g++ -o main.exe project1_Gasser_wbg0023.cpp
// Date: 8/23/2023
// Course: COMP 2710 (Software Construction)
/** This program will tell you how many months it will take you to pay off a loan in
particular and any loan in general. This program also calculates the total amount
of interest paid over the life of any loan. The program must output the monthly
amount of interest paid and remaining debt.
**/


// Some of these headers were not required in my personal IDE
// but they are required in the Auburn Terminal.
#include <stdio.h>
#include <iostream>
#include <iomanip>
#include <stdexcept>


using namespace std;

int main() {
    // Initialization of Variables
    float loanAmount;
    float interestRate;
    float monthlyPayment;
    int monthCount = 0;
    float principal = 0;
    float interest = 0;
    float totalInterest = 0;
    string formatSpace = "";

    // This is the start of output to the user;
    // prompts for user input on loan amount and interest rate.
        cout << "Loan Amount: ";
        cin >> loanAmount;
        

    // Includes thrown exceptions for invalid loans, interest rates, and payments.    
        if (loanAmount <= 0) {
        throw invalid_argument("Invalid Loan");
        }

        cout << "Interest Rate (% per year): ";
        cin >> interestRate;
        
        if (interestRate < 0) {
        throw invalid_argument("Invalid Interest Rate");
        }
        //Adjusted interest rate from percent to decimal and yearly to monthly
        interestRate = interestRate / 1200;
        cout << "Monthly Payments: ";
        cin >> monthlyPayment;
        
        if (monthlyPayment <= 0) {
        throw invalid_argument("Invalid Monthly Payment");
        }
        if (monthlyPayment <= interestRate * loanAmount) {
        throw invalid_argument("Insufficient Monthly Payment");
        }
        
    
    
    
    
    // Space holder for the setfill function
    const char fill = ' ';

    // Although the output below requires many lines, it is a simple implementation that addresses a wide
    // range of problems.
    // My thought process was that if the loan amount is very very large, it would take a complex function to
    // analyze the length and adjust the white space. Therefore, I used a the simple set/fill parameters to keep a constant
    // white space for very large loans up to about $9999999999.99 with this implementation in my source terminal.
    cout << "*****************************************************************************" 
    << "\n\tAmortization Table" << "\n*****************************************************************************";
    cout << left << setw(10) << setfill(fill) << "\nMonth";
    cout << left << setw(15) << setfill(fill) << "Balance";
    cout << left << setw(15) << setfill(fill) << "Payment";
    cout << left << setw(12) << setfill(fill) << "Rate";
    cout << left << setw(16) << setfill(fill) << "Interest";
    cout << left << "Principal";
    cout << endl;


    cout << left << setw(9) << setfill(fill) << monthCount;
    cout << left << "$" << setw(14) << setfill(fill) << fixed << setprecision(2) << loanAmount;
    cout << left << setw(15) << setfill(fill) << "N/A";
    cout << left << setw(12) << setfill(fill) << "N/A";
    cout << left << setw(16) << setfill(fill) << "N/A";
    cout << left << "N/A";
    cout << endl;


    // Basic while loop that prints using the same method for the initalization.
    // Simple calculations are made to accurately display interest and principal
    // as well as the declining balance.
    while (loanAmount > monthlyPayment) {
       monthCount++;
       interest = (loanAmount * interestRate);
       totalInterest = totalInterest + interest;
       principal = monthlyPayment - interest;
       loanAmount = loanAmount - principal;
       cout << left << setw(9) << setfill(fill) << monthCount;
       cout << left << "$" << setw(14) << setfill(fill) << fixed << setprecision(2) << loanAmount;
       cout << left << "$" << setw(14) << setfill(fill) << fixed << setprecision(2) << monthlyPayment;
       cout << left << setw(12) << setfill(fill) << fixed << setprecision(2) << interestRate * 100;
       cout << left << "$" << setw(15) << setfill(fill) << fixed << setprecision(2) << interest;
       cout << left << "$" << fixed << setprecision(2) << principal;
       cout << endl;

    }
       // The final calculations are changed in that the monthly payment is now
       // equal to the remaining loan plus the interest.
       // Remaining loan is then set to zero.
    monthCount++;
    interest = (loanAmount * interestRate);
    monthlyPayment = loanAmount + interest;
    totalInterest = totalInterest + interest;
    principal = loanAmount;
    loanAmount = 0;

    cout << left << setw(9) << setfill(fill) << monthCount;
    cout << left << "$" << setw(14) << setfill(fill) << fixed << setprecision(2) << loanAmount;
    cout << left << "$" << setw(14) << setfill(fill) << fixed << setprecision(2) << monthlyPayment;
    cout << left << setw(12) << setfill(fill) << fixed << setprecision(2) << interestRate * 100;
    cout << left << "$" << setw(15) << setfill(fill) << fixed << setprecision(2) << interest;
    cout << left << "$" << fixed << setprecision(2) << principal;
    cout << endl;
       
       cout << "*****************************************************************************\n\n"; 

       // I used printf which required an additional header in the Auburn Terminal, but it was just easier than typing
       // all of the << for cout. 
       printf("It takes %d month(s) to pay off the loan. \nTotal interest payed is: $%.2f\n", monthCount, totalInterest);
}



