/*
 * Calculator.cpp
 *
 *  Created on: Oct 12, 2018
 *      Author: yardmaster
 */
#include <iostream>
using namespace std;
#include "Calculator.h"

Calculator::Calculator() {
	lastResult = 0;
}

Calculator::~Calculator() {
	// TODO Auto-generated destructor stub
}

void Calculator::reset()
{
	lastResult = 0;
}

int Calculator::add(int a, int b)
{
	lastResult = a + b;
	return lastResult;
}

int Calculator::subtract(int a, int b)
{
	lastResult = a - b;
	return lastResult;
}

int main(int argc, char **argv) {
	Calculator calculator;
	int result = calculator.add(1, 2);
	cout << "Output sentence " << result ;

}
