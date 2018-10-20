################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/Calculator.cpp \
../src/gtest_driver.cpp \
../src/sample_tests.cpp 

OBJS += \
./src/Calculator.o \
./src/gtest_driver.o \
./src/sample_tests.o 

CPP_DEPS += \
./src/Calculator.d \
./src/gtest_driver.d \
./src/sample_tests.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I"${pwd}/include" -O0 -g3 -Wall -c -fmessage-length=0 -std=c++0x -MMD -MP -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


