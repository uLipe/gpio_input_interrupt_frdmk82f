/*
 *  webinar demonstration demo
 *
 */


/*
 * Copyright (c) 2015, Freescale Semiconductor, Inc.
 * Copyright 2016-2017 NXP
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * o Redistributions of source code must retain the above copyright notice, this list
 *   of conditions and the following disclaimer.
 *
 * o Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 *
 * o Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from this
 *   software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "fsl_debug_console.h"
#include "fsl_port.h"
#include "fsl_gpio.h"
#include "fsl_common.h"
#include "board.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "ulipe_rtos_pico.h"



/** board definitions */
#define BOARD_LED_GPIO BOARD_LED_RED_GPIO
#define BOARD_LED_GPIO_PIN BOARD_LED_RED_GPIO_PIN
#define BOARD_SW_GPIO BOARD_SW2_GPIO
#define BOARD_SW_PORT BOARD_SW2_PORT
#define BOARD_SW_GPIO_PIN BOARD_SW2_GPIO_PIN
#define BOARD_SW_IRQ BOARD_SW2_IRQ
#define BOARD_SW_IRQ_HANDLER BOARD_SW2_IRQ_HANDLER
#define BOARD_SW_NAME BOARD_SW2_NAME


/** internal variables */
THREAD_CONTROL_BLOCK_DECLARE(demo_thread, 256, 2);
THREAD_CONTROL_BLOCK_DECLARE(yield_thread, 256, 3);
THREAD_CONTROL_BLOCK_DECLARE(button_handler, 256, 2);
SEMAPHORE_BLOCK_DECLARE(button_sync, 0, 1);


/**
 * @brief handles button interrrupt and defer the button handling task
 */
void BOARD_SW_IRQ_HANDLER(void)
{
	kernel_irq_in();
   /* Clear external interrupt flag. */
    GPIO_ClearPinsInterruptFlags(BOARD_SW_GPIO, 1U << BOARD_SW_GPIO_PIN);

    /* send a signal to waiting tasks */
    k_status_t err = semaphore_give(&button_sync, 1);
    ULIPE_ASSERT(err == k_status_ok);

    err = thread_set_signals(&demo_thread, 0x01);
    ULIPE_ASSERT(err == k_status_ok);

    err = thread_set_signals(&yield_thread, 0x01);
    ULIPE_ASSERT(err == k_status_ok);


    kernel_irq_out();
}


/**
 * @brief button handler deferrable task
 */
static void button_thread(void *args)
{
    /* Define the init structure for the input switch pin */
    gpio_pin_config_t sw_config = {
        kGPIO_DigitalInput, 0,
    };

    /* Define the init structure for the output LED pin */
    gpio_pin_config_t led_config = {
        kGPIO_DigitalOutput, 1,
    };

	(void)args;

    /* Init input switch GPIO. */
    PORT_SetPinInterruptConfig(BOARD_SW_PORT, BOARD_SW_GPIO_PIN, kPORT_InterruptFallingEdge);
    EnableIRQ(BOARD_SW_IRQ);
    GPIO_PinInit(BOARD_SW_GPIO, BOARD_SW_GPIO_PIN, &sw_config);

    /* Init output LED GPIO. */
    GPIO_PinInit(BOARD_LED_GPIO, BOARD_LED_GPIO_PIN, &led_config);

    for(;;) {
    	/* wait a signal from gpio */
    	k_status_t err = semaphore_take(&button_sync);
    	ULIPE_ASSERT(err == k_status_ok);
        GPIO_TogglePinsOutput(BOARD_LED_GPIO, 1U << BOARD_LED_GPIO_PIN);
    }
}


/**
 * @brief low priority demo thread
 */
static void low_prio_thread(void *args)
{
	(void)args;
	for(;;) {
		thread_wait_signals(&demo_thread, 0x01, k_match_pattern_consume,NULL);
	}
}

/**
 * @bried high priority demo thread
 */
static void hi_prio_thread(void *args)
{
	(void)args;
	for(;;) {
		thread_wait_signals(&yield_thread, 0x01, k_match_pattern_consume,NULL);
	}
}



/**
 * @brief user application entry point
 */
int main(void)
{

    BOARD_InitPins();
    BOARD_BootClockRUN();
    BOARD_InitDebugConsole();

    /* inits kernel before create objects */
    kernel_init();
    thread_create(button_thread,NULL, &button_handler);
    thread_create(low_prio_thread,NULL, &demo_thread);
    thread_create(hi_prio_thread,NULL, &yield_thread);
    kernel_start();

    return 0;
}
