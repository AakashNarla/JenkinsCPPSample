/*
 * Calculator.cpp
 *
 *  Created on: Oct 12, 2018
 *      Author: yardmaster
 */

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
