#ifndef __HWSETUPUTILS_H_
#define __HWSETUPUTILS_H_

#include "hardware/i2c.h"

//100khz
#define I2C_BAUDRATE 100000

// i2c pin number
#define I2C_SLAVE_SDA_PIN 26
#define I2C_SLAVE_SCL_PIN 27

//i2c number for the slave
#define I2C_SLAVE i2c1

//on board led pin number
#define LED_PIN 25

//address pin number
#define I2C_SLAVE_ADDRESS_PIN0 16
#define I2C_SLAVE_ADDRESS_PIN1 17
#define I2C_SLAVE_ADDRESS_PIN2 18
#define I2C_SLAVE_ADDRESS_PIN3 19


#define DEFAULT_SLAVE_ADDRESS 0x70

//hardware setup
void hardwareInit();


//utils
uint8_t getAddress();
void onBoardLedToggle();
void onBoardLedOff();
void onBoardLedOn();

#endif
