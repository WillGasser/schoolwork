#include<stdio.h>#include<iostream>#include<iomanip># include<stdlib.h># include<assert.h># include<ctime>using namespace std;int randNum=0;const int runs=10000;const int aProb=33;const int bProb=50;bool at_least_two_alive(bool A_alive,bool B_alive,bool C_alive){if((A_alive+B_alive+C_alive)>=2){return!0}
return!1}
void Aaron_shoots1(bool&B_alive,bool&C_alive){if(C_alive){randNum=rand()%100;if(randNum<aProb){C_alive=!1}}else if(B_alive){randNum=rand()%100;if(randNum<aProb){B_alive=!1}}}
void Bob_shoots(bool&A_alive,bool&C_alive){if(A_alive&&!C_alive){randNum=rand()%100;if(randNum<bProb){A_alive=!1}}
if(C_alive==!0){randNum=rand()%100;if(randNum<bProb){C_alive=!1}}}
void Charlie_shoots(bool&A_alive,bool&B_alive){if(A_alive&&!B_alive){A_alive=!1}
if(B_alive==!0){B_alive=!1}}
void Aaron_shoots2(bool&B_alive,bool&C_alive){if(!B_alive||!C_alive){if(C_alive){randNum=rand()%100;if(randNum<aProb){C_alive=!1}}else if(B_alive){randNum=rand()%100;if(randNum<aProb){B_alive=!1}}}}
void test_at_least_two_alive(void){cout<<"Unit Testing 1: Function – at_least_two_alive()\n";cout<<"\tCase 1: Aaron alive, Bob alive, Charlie alive\n";assert(!0==at_least_two_alive(!0,!0,!0));cout<<"\tCase passed ...\n";cout<<"\tCase 2: Aaron dead, Bob alive, Charlie alive\n";assert(!0==at_least_two_alive(!1,!0,!0));cout<<"\tCase passed ...\n";cout<<"\tCase 3: Aaron alive, Bob dead, Charlie alive\n";assert(!0==at_least_two_alive(!0,!1,!0));cout<<"\tCase passed ...\n";cout<<"\tCase 4: Aaron alive, Bob alive, Charlie dead\n";assert(!0==at_least_two_alive(!0,!0,!1));cout<<"\tCase passed ...\n";cout<<"\tCase 5: Aaron dead, Bob dead, Charlie alive\n";assert(!1==at_least_two_alive(!1,!1,!0));cout<<"\tCase passed ...\n";cout<<"\tCase 6: Aaron dead, Bob alive, Charlie dead\n";assert(!1==at_least_two_alive(!1,!0,!1));cout<<"\tCase passed ...\n";cout<<"\tCase 7: Aaron alive, Bob dead, Charlie dead\n";assert(!1==at_least_two_alive(!0,!1,!1));cout<<"\tCase passed ...\n";cout<<"\tCase 8: Aaron dead, Bob dead, Charlie dead\n";assert(!1==at_least_two_alive(!1,!1,!1));cout<<"\tCase passed ...\n"}
void test_Aaron_shoots1(void){cout<<"Unit Testing 2: Function – test_Aaron_shoots1(Bob_alive, Charlie_alive)\n";cout<<"\tCase 1: Bob alive, Charlie alive\n";bool B=!0;bool C=!0;while(C&&B){Aaron_shoots1(B,C)}
assert(!C&&B);cout<<"\t\tAaron is shooting at Charlie\n";cout<<"\tCase 2: Bob dead, Charlie alive\n";B=!1;C=!0;while(C){Aaron_shoots1(B,C)}
assert(!C&&!B);cout<<"\t\tAaron is shooting at Charlie\n";cout<<"\tCase 3: Bob alive, Charlie dead\n";B=!0;C=!1;while(B){Aaron_shoots1(B,C)}
assert(!C&&!B);cout<<"\t\tAaron is shooting at Bob\n"}
void test_Bob_shoots(void){cout<<"Unit Testing 3: Function – test_Bob_shoots(Aaron_alive, Charlie_alive)\n";cout<<"\tCase 1: Aaron alive, Charlie alive\n";bool A=!0;bool C=!0;while(C&&A){Aaron_shoots1(A,C)}
assert(!C&&A);cout<<"\t\tBob is shooting at Charlie\n";cout<<"\tCase 2: Aaron dead, Charlie alive\n";A=!1;C=!0;while(C){Aaron_shoots1(A,C)}
assert(!C&&!A);cout<<"\t\tBob is shooting at Charlie\n";cout<<"\tCase 3: Aaron alive, Charlie dead\n";A=!0;C=!1;while(A){Aaron_shoots1(A,C)}
assert(!C&&!A);cout<<"\t\tBob is shooting at Aaron\n"}
void test_Charlie_shoots(void){cout<<"Unit Testing 4: Function – test_Charlie_shoots(Aaron_alive, Bob_alive)\n";cout<<"\tCase 1: Aaron alive, Bob alive\n";bool A=!0;bool B=!0;Charlie_shoots(A,B);assert(!B&&A);cout<<"\t\tCharlie is shooting at Bob\n";cout<<"\tCase 2: Aaron dead, Bob alive\n";A=!1;B=!0;Charlie_shoots(A,B);assert(!B&&!A);cout<<"\t\tCharlie is shooting at Bob\n";cout<<"\tCase 3: Aaron alive, Bob dead\n";A=!0;B=!1;while(A){Aaron_shoots1(A,B)}
assert(!B&&!A);cout<<"\t\tCharlie is shooting at Aaron\n"}
void test_Aaron_shoots2(void){cout<<"Unit Testing 5: Function – test_Aaron_shoots2(Bob_alive, Charlie_alive)\n";cout<<"\tCase 1: Bob alive, Charlie alive\n";bool B=!0;bool C=!0;for(int i=0;i<15;i++){Aaron_shoots2(B,C)}
assert(C&&B);cout<<"\t\tAaron intentionally misses his first shot\n";cout<<"\t\tBoth Bob and Charlie are alive.\n";cout<<"\tCase 2: Bob dead, Charlie alive\n";B=!1;C=!0;while(C){Aaron_shoots2(B,C)}
assert(!C&&!B);cout<<"\t\tAaron is shooting at Charlie\n";cout<<"\tCase 3: Bob alive, Charlie dead\n";B=!0;C=!1;while(B){Aaron_shoots2(B,C)}
assert(!C&&!B);cout<<"\t\tAaron is shooting at Bob\n"}
void wait(){cout<<"Press enter to continue...\n";cin.ignore().get()}
void duel(){bool A=!0;bool B=!0;bool C=!0;int aWin=0;int bWin=0;int cWin=0;float a1Percent=0;float a2Percent=0;cout<<"Ready to test strategy 1 (run 10000 times):\n";wait();for(int i=0;i<=runs;i++){srand(time(0)+i*200);while(at_least_two_alive(A,B,C)){if(A){Aaron_shoots1(B,C)}
if(B){Bob_shoots(A,C)}
if(C){Charlie_shoots(A,B)}}
A?aWin++:(B?bWin++:cWin++);A=!0;B=!0;C=!0}
a1Percent=(float)aWin/runs*100;float bPercent=(float)bWin/runs*100;float cPercent=(float)cWin/runs*100;printf("Aaron won %d/%d duels or %0.2f%%\n",aWin,runs,a1Percent);printf("Bob won %d/%d duels or %0.2f%%\n",bWin,runs,bPercent);printf("Charlie won %d/%d duels or %0.2f%%\n\n",cWin,runs,cPercent);cout<<"Ready to test strategy 2 (run 10000 times):\n";wait();A=!0;B=!0;C=!0;aWin=0;bWin=0;cWin=0;for(int i=0;i<=runs;i++){srand(time(0)+i*200);while(at_least_two_alive(A,B,C)){if(A){Aaron_shoots2(B,C)}
if(B){Bob_shoots(A,C)}
if(C){Charlie_shoots(A,B)}}
A?aWin++:(B?bWin++:cWin++);A=!0;B=!0;C=!0}
a2Percent=(float)aWin/runs*100;bPercent=(float)bWin/runs*100;cPercent=(float)cWin/runs*100;printf("Aaron won %d/%d duels or %0.2f%%\n",aWin,runs,a2Percent);printf("Bob won %d/%d duels or %0.2f%%\n",bWin,runs,bPercent);printf("Charlie won %d/%d duels or %0.2f%%\n\n",cWin,runs,cPercent);a2Percent>a1Percent?cout<<"Strategy 2 is better than strategy 1.\n":cout<<"Strategy 1 is better than strategy 2.\n"}
int main(){cout<<"\n*** Welcome to Will's Duel Simulator ***\n";test_at_least_two_alive();wait();test_Aaron_shoots1();wait();test_Bob_shoots();wait();test_Charlie_shoots();wait();test_Aaron_shoots2();wait();duel()}