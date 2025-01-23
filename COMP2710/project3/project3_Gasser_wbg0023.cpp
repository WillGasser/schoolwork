// Will Gasser, wbg0023, project3_Gasser_wbg0023, g++ -std=c++0x -o main.exe project3_Gasser_wbg0023.cpp, ./main.exe
// Date: 10/05/2023
// Course: COMP 2710 (Software Construction)

// I used some inspiration from the provided sample code as well as a bubble
// sort used in a previous COMP class.

// I also used an online resource to figure out the command line argument -std=c++0x
// because it was not running in the Auburn terminal.

#include <stdio.h>
#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <assert.h>
#include <vector>

using namespace std;

// Reads a file and converts the inputs into a vector
void readFile(vector<int>& v, ifstream& inStream) {
    string line;
    while (getline(inStream, line)) {
        try {
            v.push_back(stoi(line));
        } 
        catch(exception noInt) {
            
        }
    }
}

// this method takes two int vectors and creates a subsequent third vector and then sorts the created vector
// the sorted vector is returned
vector<int> createSort(vector<int> v1, vector<int> v2) {
    vector<int> returned;
    v1.insert(v1.end(), v2.begin(), v2.end());
    returned = v1;
    
    // bubble sort algorithm
    for (int i = 0; i < returned.size(); i++) {
        for (int j = 0; j < returned.size() - 1; j++) {
            int temp;
            if(returned[j] > returned[j + 1]) {
                temp = returned[j + 1];
                returned[j + 1] = returned[j];
                returned[j] = temp;
            }
        }
    }
    return returned;
}

// this method takes a vector and writes its objects to a file, including
// a new line after each object
void writeFile(vector<int> v, ofstream& out) {
    for (int element : v) {
        out << element << "\n";
    }
}

int main() {

    string fileName;
    
    ifstream fileIn;
    ofstream fileOut;

    vector<int> v1;
    vector<int> v2;
    vector<int> v3;

    cout << "\n*** Welcome to Will's sorting program ***";
    cout << "\nEnter the first input file name: ";

    cin >> fileName; 

    fileIn.open(fileName);
    if (fileIn.fail()) {
        cout << "Input file opening failed." << endl;
        exit(1);
    }

    readFile(v1, fileIn);
    fileIn.close();

    cout << "The list of " << v1.size() << " numbers in file " << fileName << " is:\n";
    for (int var : v1) {
        cout << var << "\n";
    }

    cout << "\nEnter the second input file name: ";

    cin >> fileName;

    fileIn.open(fileName);
    if (fileIn.fail()) {
        cout << "Input file opening failed." << endl;
        exit(1);
    }
    
    readFile(v2, fileIn);
    fileIn.close();

    cout << "The list of " << v2.size() << " numbers in file " << fileName << " is:\n";
    for (int var : v2) {
        cout << var << "\n";
    }

    v3 = createSort(v1, v2);

    cout << "\nThe sorted list of " << v3.size() << " numbers is: ";
    for (int var : v3) {
        cout << var << " ";
    }

    cout << "\nEnter the output file name: ";

    cin >> fileName;
    fileOut.open(fileName);
    if (fileOut.fail()) {
        cout << "Output file opening failed." << endl;
        exit(1);
    }

    writeFile(v3, fileOut);
    fileOut.close();

    cout << "*** Please check the new file - " << fileName << " ***\n*** Goodbye. ***\n";   

}