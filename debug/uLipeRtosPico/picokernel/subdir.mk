################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../uLipeRtosPico/picokernel/k_kernel.c \
../uLipeRtosPico/picokernel/k_message.c \
../uLipeRtosPico/picokernel/k_raw_timer.c \
../uLipeRtosPico/picokernel/k_sema.c \
../uLipeRtosPico/picokernel/k_thread.c 

OBJS += \
./uLipeRtosPico/picokernel/k_kernel.o \
./uLipeRtosPico/picokernel/k_message.o \
./uLipeRtosPico/picokernel/k_raw_timer.o \
./uLipeRtosPico/picokernel/k_sema.o \
./uLipeRtosPico/picokernel/k_thread.o 

C_DEPS += \
./uLipeRtosPico/picokernel/k_kernel.d \
./uLipeRtosPico/picokernel/k_message.d \
./uLipeRtosPico/picokernel/k_raw_timer.d \
./uLipeRtosPico/picokernel/k_sema.d \
./uLipeRtosPico/picokernel/k_thread.d 


# Each subdirectory must supply rules for building sources it contributes
uLipeRtosPico/picokernel/%.o: ../uLipeRtosPico/picokernel/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -fno-builtin -Wall  -g -DDEBUG -DCPU_MK82FN256VLL15 -DFRDM_K82F -DFREEDOM -I../boards -I../CMSIS -I../devices -I../devices/drivers -I../devices/gcc -I../devices/utilities -I../uLipeRtosPico -std=gnu99 -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


