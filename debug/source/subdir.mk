################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/vntfene/Documents/hexiwear/gpio_input_interrupt.c 

OBJS += \
./source/gpio_input_interrupt.o 

C_DEPS += \
./source/gpio_input_interrupt.d 


# Each subdirectory must supply rules for building sources it contributes
source/gpio_input_interrupt.o: C:/Users/vntfene/Documents/hexiwear/gpio_input_interrupt.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -fno-builtin -Wall  -g -DDEBUG -DCPU_MK82FN256VLL15 -DFRDM_K82F -DFREEDOM -I../../../../../../../CMSIS/Include -I../../../../../../../devices -I../.. -I../../../../.. -I../../../../../../../devices/MK82F25615/drivers -I../../../../../../../devices/MK82F25615/utilities -I../../../../../../../devices/MK82F25615 -std=gnu99 -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


