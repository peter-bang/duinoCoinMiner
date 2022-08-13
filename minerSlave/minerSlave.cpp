#include <stdio.h>
#include <stdlib.h>
#include "pico/stdlib.h"
#include "pico/binary_info.h"
#include "charbuffer.h"
#include "Wire.h"
#include "hwSetupUtils.h"

CharBuffer receiveBuffer, requestBuffer;

static void slave_on_receive(int count) {
    // writes always start with the memory address
    hard_assert(Wire1.available());
    while (Wire1.available()) {
        // save into memory
        receiveBuffer.write((uint8_t)Wire1.read());
        // receiveBuffer.buffer[receiveBuffer.len++] = (uint8_t)Wire1.read();
        onBoardLedToggle();
    }
}

static void slave_on_request() {
    // load from memory
    if(!requestBuffer.isEmpty() && requestBuffer.indexOf('\n') != -1)
    Wire1.write(requestBuffer.read());
}

static void slaveLoop() {
    if(!receiveBuffer.isEmpty() && receiveBuffer.indexOf('\n') != -1){
        char lastblockhash[64] = "";
        char newblockhash[64] = "";
        char tempDifficulty[8] = "";
        char tempRequestBuffer[BUF_SIZE] = "";
        uint32_t difficulty;

        printf("message received: %s\n", receiveBuffer.buf());
        receiveBuffer.readStringUntil(',',lastblockhash);
        receiveBuffer.readStringUntil(',',newblockhash);
        receiveBuffer.readStringUntil('\n', tempDifficulty);
        difficulty = atoi(tempDifficulty);
        printf("Last block hash is %s\nNew block hash is %s\nDifficulty is %d\n", lastblockhash, newblockhash, difficulty);

        requestBuffer.clear();
        int length = sprintf(tempRequestBuffer, "Hello world %ld\n", get_absolute_time());
        requestBuffer.setBuffer(tempRequestBuffer,length);
        printf("%s =>> has been input. The length is %d\n",tempRequestBuffer, length);
    }
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
    printf("I2C Slave starts with address %d\n",getAddress());
    Wire1.begin(getAddress());//i2c1 slave start
    while(1){
        slaveLoop();
    }
}
