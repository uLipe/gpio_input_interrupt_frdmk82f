################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../uLipeRtosPico/arch/arm_cm3_4_7/k_port_cm3_4_7.c 

S_UPPER_SRCS += \
../uLipeRtosPico/arch/arm_cm3_4_7/k_port_cm3_4_7_a.S 

OBJS += \
./uLipeRtosPico/arch/arm_cm3_4_7/k_port_cm3_4_7.o \
./uLipeRtosPico/arch/arm_cm3_4_7/k_port_cm3_4_7_a.o 

C_DEPS += \
./uLipeRtosPico/arch/arm_cm3_4_7/k_port_cm3_4_7.d 

S_UPPER_DEPS += \
./uLipeRtosPico/arch/arm_cm3_4_7/k_port_cm3_4_7_a.d 


# Each subdirectory must supply rules for building sources it contributes
uLipeRtosPico/arch/arm_cm3_4_7/%.o: ../uLipeRtosPico/arch/arm_cm3_4_7/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -fno-builtin -Wall  -g -DDEBUG -DCPU_MK82FN256VLL15 -DFRDM_K82F -DFREEDOM -I../boards -I../CMSIS -I../devices -I../devices/drivers -I../devices/gcc -I../devices/utilities -I../uLipeRtosPico -std=gnu99 -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

uLipeRtosPico/arch/arm_cm3_4_7/%.o: ../uLipeRtosPico/arch/arm_cm3_4_7/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU Assembler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -fno-builtin -Wall  -g -x assembler-with-cpp -DDEBUG -D__STARTUP_CLEAR_BSS -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


