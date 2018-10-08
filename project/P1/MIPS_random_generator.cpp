#include <iostream>
#include <cstdlib>      
#include <ctime> 
#include <fstream>
using namespace std;

#define MIN 30    
#define MAX 90  
#define SIZE 60

int main(int argc, char *argv[]) {
	ofstream oFile;
	oFile.open("generated_array.s");
	int* arr = new int[SIZE];
	srand((unsigned)time(NULL));  
    cout<<"Generate "<< SIZE <<" random numbers from "
    	<<MIN<<" to "<<MAX<<" :\n["; 
    for(int i=0; i<SIZE; i++) 
    {  
    	arr[i] = MIN + rand() % (MAX - MIN - 1); 
    	oFile<<"\taddi $t0, $0, "<<arr[i]<<"  \t# $t0 = "
    		<<arr[i]<<endl;
    	oFile<<"\tsw $t0, "<< 4*i <<"($s4)"<<"  \t# testArray["
    		<<i<<"] = $t0"<<endl;
    	cout << arr[i];
    	if(i == SIZE - 1)break;
    	cout << ", ";  
    }
    cout<<"]"<<endl;  
    delete[] arr;
    oFile.close();
    return 0;  
}