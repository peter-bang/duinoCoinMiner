#include <stdio.h>
#include <stdlib.h>
#include "pico/stdlib.h"
#include "pico/binary_info.h"
#include "pico/multicore.h"

#include "charbuffer.h"
#include "Wire.h"
#include "hwSetupUtils.h"
#include "duinoCoinUtils.h"

CharBuffer receiveBuffer, requestBuffer;

typedef enum _HashCalStatus {
    HASH_IDLE = '0',
    HASH_BUSY = '1',
    HASH_DONE = '2',
} HashCalStatus;

static HashCalStatus HashCalStatusCore0 = HASH_IDLE;
static HashCalStatus HashCalStatusCore1 = HASH_IDLE;

uint8_t HashOrder = 0;

uint8_t TempBufferCore0[256];
uint8_t TempBufferCore1[256];

void core1_entry() {
    while(1){
        if(HashOrder == 1 && !receiveBuffer.isEmpty() && receiveBuffer.indexOf('\n') != -1){
            
            uint32_t startTime = 0;
            uint32_t endTime = 0;
            uint32_t elapsed_time_s = 0;
            uint8_t jobnumber[2] = "";// this should be number between 0 to 99
            uint8_t lastblockhash[64] = "";
            uint8_t newblockhash[64] = "";
            uint8_t tempDifficulty[8] = "";

            uint32_t difficulty = 0;

            static float hashRate = 0;

            printf("message received: %s\n", receiveBuffer.buf());
            printf("time_us_ms: %d\n", time_us_32());

            receiveBuffer.readStringUntil(',',(char *)jobnumber);
            receiveBuffer.readStringUntil(',',(char *)lastblockhash);
            receiveBuffer.readStringUntil(',',(char *)newblockhash);
            receiveBuffer.readStringUntil('\n', (char *)tempDifficulty);
            difficulty = atoi((char *)tempDifficulty);

            printf("Form Core1: Last block hash is %s\nNew block hash is %s\nDifficulty is %d\n", lastblockhash, newblockhash, difficulty);
            HashCalStatusCore1 = HASH_BUSY;
            startTime = time_us_32();
            //while hash calculation on core 0, it's not able to assign a hash job to core 1.
            uint32_t result = calculateHash(lastblockhash, newblockhash, difficulty);
            startTime = time_us_32();
            
            elapsed_time_s = endTime - startTime;//us
            hashRate = 
            //hash rate needs to be calculated.
            //Update Buffer

            HashCalStatusCore1 = HASH_DONE;
            // uint32_t result = 0;
            printf("Form Core1: The hash result is %d\n",result);
        }
    }
}

static void slave_on_receive(int count) {
    uint8_t command;
    hard_assert(Wire1.available());
    command = (uint8_t)Wire1.read();//first byte is command.

    switch (command){
    case 0x00: //read if it's available?
        /* code */
        while (Wire1.available()) { //clear the receive buffer
            Wire1.read();
        }
        printf("%c, %c\n",HashCalStatusCore0,HashCalStatusCore1);
        requestBuffer.write(HashCalStatusCore0);//Core 0 status
        requestBuffer.write(HashCalStatusCore1);//Core 1 status
        requestBuffer.write('\n');
        break;
    
    case 0x01: //job allocation
        while (Wire1.available())
        {
            receiveBuffer.write((uint8_t)Wire1.read());
        }//job copy done. => HashCalStatusCore0(코어0 해쉬가 돌고 있나?) 그럼 코어 2에서 들고 가도록 하고... 둘다 돌고 있나? 그럼 무시해야지. 버퍼 비워버려.
        if(HashCalStatusCore0 == HASH_IDLE){
                HashOrder = 0;
        }// hash core 0 우선.
        else if(HashCalStatusCore1 == HASH_IDLE){
                HashOrder = 1;
        }// hash core 1 없다면 코어 1
        break;

    case 0x02: //Read result
        /* code */
        while (Wire1.available()) { //clear the receive buffer
            Wire1.read();
        }
        if(HashCalStatusCore0 == HASH_DONE)
            requestBuffer.setBuffer((char *)TempBufferCore0,256);//hash result + socket number
        else if(HashCalStatusCore1 == HASH_DONE)
            requestBuffer.setBuffer((char *)TempBufferCore1,256);//hash result + socket number
        else {}//do nothing!}
        break;
    default:
        break;
    }
}

//request callback
static void slave_on_request() {
    //if requestBuffer is not empty && requestBuffer has '\n'
    uint8_t value = requestBuffer.read();
        Wire1.write(value);//send requestBuffer
}

static void slaveLoop() {
    if(!receiveBuffer.isEmpty() && receiveBuffer.indexOf('\n') != -1){
        
        uint32_t startTime = 0;
        uint32_t endTime = 0;

        uint8_t jobnumber[2] = "";// this should be number between 0 to 99
        uint8_t lastblockhash[64] = "";
        uint8_t newblockhash[64] = "";
        uint8_t tempDifficulty[8] = "";

        uint32_t difficulty;

        printf("message received: %s\n", receiveBuffer.buf());
        printf("time_us_ms: %d\n", time_us_32());

        // receiveBuffer.readStringUntil(',',(char *)jobnumber);
        receiveBuffer.readStringUntil(',',(char *)lastblockhash);
        receiveBuffer.readStringUntil(',',(char *)newblockhash);
        receiveBuffer.readStringUntil('\n', (char *)tempDifficulty);
        difficulty = atoi((char *)tempDifficulty);

        printf("Last block hash is %s\nNew block hash is %s\nDifficulty is %d\n", lastblockhash, newblockhash, difficulty);
        HashCalStatusCore0 = HASH_BUSY;

        startTime = time_us_32();
        //while hash calculation on core 0, it's not able to assign a hash job to core 1.
        uint32_t result = calculateHash(lastblockhash, newblockhash, difficulty);
        startTime = time_us_32();

        //hash rate needs to be calculated.

        HashCalStatusCore0 = HASH_DONE;
        // uint32_t result = 0;
        printf("The hash result is %d\n",result);
        // requestBuffer.clear();
        // int length = sprintf((char *)tempRequestBuffer, "Hello world %ld\n", get_absolute_time());
        // requestBuffer.setBuffer((char *)tempRequestBuffer,length);
        // printf("%s =>> has been input. The length is %d\n",tempRequestBuffer, length);
    }
}

int main() {
    bi_decl(bi_program_description("Binary for the slave of the duino coin mining example. WIZnet Co,.Ltd"));
    bi_decl(bi_1pin_with_name(LED_PIN, "On-board LED"));

    stdio_init_all();
    hardwareInit();
    
    // multicore_launch_core1(core1_entry);

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