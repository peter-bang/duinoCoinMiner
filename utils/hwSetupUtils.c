#include <stdio.h>
#include <stdlib.h>
#include "pico/stdlib.h"
#include "hardware/gpio.h"
#include "hardware/i2c.h"
#include "hwSetupUtils.h"

#define SLAVE

void hardwareInit(){
    
#ifdef SLAVE
    //gpio setup for i2c address
    gpio_init(I2C_SLAVE_ADDRESS_PIN0);
    gpio_init(I2C_SLAVE_ADDRESS_PIN1);
    gpio_init(I2C_SLAVE_ADDRESS_PIN2);
    gpio_init(I2C_SLAVE_ADDRESS_PIN3);
    
    gpio_set_dir(I2C_SLAVE_ADDRESS_PIN0, GPIO_IN);
    gpio_set_dir(I2C_SLAVE_ADDRESS_PIN1, GPIO_IN);
    gpio_set_dir(I2C_SLAVE_ADDRESS_PIN2, GPIO_IN);
    gpio_set_dir(I2C_SLAVE_ADDRESS_PIN3, GPIO_IN);
#endif
    //gpio and i2c function setup
    gpio_init(I2C_SLAVE_SDA_PIN);
    gpio_set_function(I2C_SLAVE_SDA_PIN, GPIO_FUNC_I2C);
    gpio_pull_up(I2C_SLAVE_SDA_PIN);
    
    gpio_init(I2C_SLAVE_SCL_PIN);
    gpio_set_function(I2C_SLAVE_SCL_PIN, GPIO_FUNC_I2C);
    gpio_pull_up(I2C_SLAVE_SCL_PIN);

    i2c_init(I2C_SLAVE, I2C_BAUDRATE);

    //gpio setup for LED
    gpio_init(LED_PIN);
    gpio_set_dir(LED_PIN, GPIO_OUT);

    //gpio setup for LED outside the board
    gpio_init(LED_PIN_OUT);
    gpio_set_dir(LED_PIN_OUT,GPIO_OUT);
}

uint8_t getAddress(){
    uint8_t tempAddress = 0;
    tempAddress = (gpio_get(I2C_SLAVE_ADDRESS_PIN0) << 0) |
    (gpio_get(I2C_SLAVE_ADDRESS_PIN1) << 1) |
    (gpio_get(I2C_SLAVE_ADDRESS_PIN2) << 2) |
    (gpio_get(I2C_SLAVE_ADDRESS_PIN3) << 3);
    
    //if there is something wrong with address read from GPIO, will return 1;
    return ((tempAddress > 0) && (tempAddress < 128)) ? DEFAULT_SLAVE_ADDRESS|tempAddress : DEFAULT_SLAVE_ADDRESS;
}


void onBoardLedToggle(){
    gpio_put(LED_PIN, !gpio_get(LED_PIN));
}

void onBoardLedOff(){
    gpio_put(LED_PIN, 0);
}

void onBoardLedOn(){
    gpio_put(LED_PIN, 1);
}

void outsideLedToggle(){
    gpio_put(LED_PIN_OUT, !gpio_get(LED_PIN_OUT));
}

void  outsideLedOn(){
    gpio_put(LED_PIN_OUT, 0);//pin low to turn on the led
}

void outsideLedOff(){
    gpio_put(LED_PIN_OUT, 1);//pin high to turn off the led
}