/*
 * Calculator.h
 *
 *  Created on: Oct 12, 2018
 *      Author: yardmaster
 */

#ifndef CALCULATOR_H_
#define CALCULATOR_H_

class Calculator {
public:
	Calculator();
	virtual ~Calculator();

	int add(int a, int b);
	int subtract(int a, int b);

	int lastResult;

	void reset();
};

#endif /* CALCULATOR_H_ */
