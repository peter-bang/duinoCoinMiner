#include <stdio.h>
#include <stdlib.h>
#include <string.h> 
#include "pico/stdlib.h"
#include "hardware/gpio.h"
#include "hardware/i2c.h"
#include "hardware/timer.h"
#include "pico/binary_info.h"
#include "pico/unique_id.h"
#include "Wire.h"
#include "hwSetupUtils.h"

#define BUF_SIZE 256

static struct
{
    char buffer[BUF_SIZE];
    int len = 0;
    int position = 0;
} receiveBuffer;

static struct
{
    char buffer[BUF_SIZE];
    int len = 0;
    int position = 0;
} requestBuffer;

static void slave_on_receive(int count) {
    // writes always start with the memory address
    hard_assert(Wire1.available());
    while (Wire1.available()) {
        // save into memory
        receiveBuffer.buffer[receiveBuffer.len++] = (uint8_t)Wire1.read();
    }
}

static void slave_on_request() {
    // load from memory
    if(requestBuffer.len > 0 && requestBuffer.buffer[requestBuffer.len] == '\n')
    Wire1.write(requestBuffer.buffer[requestBuffer.position++]);
}

int main() {
    bi_decl(bi_program_description("Binary for the slave of the duino coin mining example. WIZnet Co,.Ltd"));
    bi_decl(bi_1pin_with_name(LED_PIN, "On-board LED"));

    stdio_init_all();
    hardwareInit();
    
    //initial delay
    sleep_ms(100);
    
    //i2c1 setup
    Wire1.onReceive(slave_on_receive);
    Wire1.onRequest(slave_on_request);
    // // in this implementation, the user is responsible for initializing the I2C instance and GPIO
    // // pins before calling Wire::begin()
    printf("Master mode\n");

    Wire1.begin();//i2c1 slave start

    char message[] = "4db808021dcee957da8b5f32e2a46a0ca0c6914f,24e948f4ff5a6984fa7b933c0cfa620fdde6c38b,25000\n";

    while(1){
        Wire1.beginTransmission(3);
        for(int i = 0 ; i < strlen(message) ; i++){
            Wire1.write(message[i]);
            }
        Wire1.endTransmission();
        sleep_ms(1000);
        onBoardLedToggle();
    }
}