/*
	 * compile this file using the command g++ synthload.C
	 * once compilation is successful run the test using
	 * ./a.out
	 * Ctrl C to stop the test
	 */
	 
	#include <iostream>
	#include <fstream>
	#include <cmath>
	#include <stdlib.h>
	#include <unistd.h>
	
	using namespace std;
	
	int main (int argc, char** argv) {
	
	  srand (time(NULL));
	
	  ofstream fptr;
	
	  while (1) {
	    fptr.open("synthetic.dat", ios::trunc);
	    for (int i = 0; i < 1000000; i++) {
	      double t = rand() % 10 + 1;
	      double tt = sqrt(t);
	      fptr << "Data is " << tt << endl;
	    }
	    fptr.close();
	    sleep(1);
	  }
	
	return 0;
}
