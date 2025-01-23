#include <iostream>
#include <cmath>
using namespace std;

float calculateSD(float data[], int size);
int factorial(int num);

int main()
{
    int i, numElements;
    float data[10];

    cout << "Enter the number of elements (less than 10): ";
    cin >> numElements;

    if (numElements <= 0 || numElements > 10)
    {
        cout << "Invalid input. Please enter a number between 1 and 9." << endl;
        return 1;
    }

    cout << "Enter " << numElements << " elements: ";
    for (i = 0; i < numElements; ++i)
        cin >> data[i];

    cout << endl
         << "Standard Deviation = " << calculateSD(data, numElements) << endl;

    cout << "Factorial of " << numElements << " = " << factorial(numElements) << endl;

    return 0;
}

float calculateSD(float data[], int size)
{
    float sum = 0.0, mean, standardDeviation = 0.0;

    for (int i = 0; i < size; ++i)
    {
        sum += data[i];
    }

    mean = sum / size;

    for (int i = 0; i < size; ++i)
        standardDeviation += pow(data[i] - mean, 2);

    return sqrt(standardDeviation / size);
}

int factorial(int num)
{
    int result = 1;

    for (int i = 1; i <= num; ++i)
    {
        result *= i;
    }

    return result;
}
