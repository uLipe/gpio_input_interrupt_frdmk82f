################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../boards/board.c \
../boards/clock_config.c \
../boards/pin_mux.c 

OBJS += \
./boards/board.o \
./boards/clock_config.o \
./boards/pin_mux.o 

C_DEPS += \
./boards/board.d \
./boards/clock_config.d \
./boards/pin_mux.d 


# Each subdirectory must supply rules for building sources it contributes
boards/%.o: ../boards/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -fno-builtin -Wall  -g -DDEBUG -DCPU_MK82FN256VLL15 -DFRDM_K82F -DFREEDOM -I../boards -I../CMSIS -I../devices -I../devices/drivers -I../devices/gcc -I../devices/utilities -I../uLipeRtosPico -std=gnu99 -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


