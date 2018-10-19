/*
 * mytest.cpp
 *
 *  Created on: Aug 14, 2018
 *      Author: yardmaster
 */

#include <iostream>
// Google test
#include <gtest/gtest.h>

#include "Calculator.h"


using namespace std;

// ========================================================================================
// Test fixture setup
// ========================================================================================

struct SampleTestSuite : public testing::Test {
protected:
	Calculator calculator;

	SampleTestSuite() {
	}

	virtual ~SampleTestSuite() {
	}

	virtual void SetUp() {
		calculator.reset();
	}

	virtual void TearDown() {
	}

};

// ========================================================================================
// Basic data init test cases
// ========================================================================================

TEST_F(SampleTestSuite, basicAdd) {
	// arrange

	// act
	int result = calculator.add(1, 2);

	// assert
	EXPECT_TRUE(result == 3);
}

TEST_F(SampleTestSuite, basicSubtract) {
	// arrange

	// act
	int result = calculator.subtract(5, 1);

	// assert
	EXPECT_EQ(4, result);
}
