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
src/Calculator.o: ../src/Calculator.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++0x -I"../include" -O0 -g3 -Wall -c -fmessage-length=0 -fprofile-arcs -ftest-coverage -MMD -MP -MF"$(@:%.o=%.d)" -MT"src/Calculator.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/gtest_driver.o: ../src/gtest_driver.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++0x -I"../include" -O0 -g3 -Wall -c -fmessage-length=0 -fprofile-arcs -ftest-coverage -MMD -MP -MF"$(@:%.o=%.d)" -MT"src/gtest_driver.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++0x -I"../include" -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


