################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../uLipeRtosPico/arch/intel_quark_se_c1000/x86_ia_mcu/k_port_x86_iamcu.c 

S_UPPER_SRCS += \
../uLipeRtosPico/arch/intel_quark_se_c1000/x86_ia_mcu/k_port_x86_iamcu_a.S 

OBJS += \
./uLipeRtosPico/arch/intel_quark_se_c1000/x86_ia_mcu/k_port_x86_iamcu.o \
./uLipeRtosPico/arch/intel_quark_se_c1000/x86_ia_mcu/k_port_x86_iamcu_a.o 

C_DEPS += \
./uLipeRtosPico/arch/intel_quark_se_c1000/x86_ia_mcu/k_port_x86_iamcu.d 

S_UPPER_DEPS += \
./uLipeRtosPico/arch/intel_quark_se_c1000/x86_ia_mcu/k_port_x86_iamcu_a.d 


# Each subdirectory must supply rules for building sources it contributes
uLipeRtosPico/arch/intel_quark_se_c1000/x86_ia_mcu/%.o: ../uLipeRtosPico/arch/intel_quark_se_c1000/x86_ia_mcu/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -fno-builtin -Wall  -g -DDEBUG -DCPU_MK82FN256VLL15 -DFRDM_K82F -DFREEDOM -I../boards -I../CMSIS -I../devices -I../devices/drivers -I../devices/gcc -I../devices/utilities -I../uLipeRtosPico -std=gnu99 -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

uLipeRtosPico/arch/intel_quark_se_c1000/x86_ia_mcu/%.o: ../uLipeRtosPico/arch/intel_quark_se_c1000/x86_ia_mcu/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU Assembler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -fno-builtin -Wall  -g -x assembler-with-cpp -DDEBUG -D__STARTUP_CLEAR_BSS -mapcs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


