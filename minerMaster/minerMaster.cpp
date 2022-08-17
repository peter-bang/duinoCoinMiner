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
#include "charbuffer.h"

#define BUF_SIZE 256

#define CMD_STATUS 0x00
#define CMD_WRITE_JOB 0x01
#define CMD_READ_RESULT 0x02

#define MAX_NUM_SLAVE 10

uint8_t ducoSlave[10];

CharBuffer receiveBuffer;

uint32_t writeCmd(uint8_t slaveAddress, uint8_t cmd, uint8_t * follow, uint32_t len);
uint32_t readData(uint8_t slaveAddress);
uint32_t busScan(uint8_t * slaveAddressArray);
bool reserved_addr(uint8_t addr);


int main() {
    bi_decl(bi_program_description("Binary for the slave of the duino coin mining example. WIZnet Co,.Ltd"));
    bi_decl(bi_1pin_with_name(LED_PIN, "On-board LED"));

    stdio_init_all();
    hardwareInit();
    
    onBoardLedOn();
    
    //initial delay
    sleep_ms(100);
    
    // // pins before calling Wire::begin()
    printf("Master starts\n");
    Wire1.begin();//i2c1 master start

    char core0, core1;

    
    while(1){
        char message[] = "10,4db808021dcee957da8b5f32e2a46a0ca0c6914f,24e948f4ff5a6984fa7b933c0cfa620fdde6c38b,25000\n";

        printf("I2C slave scanning.\n");
        sleep_ms(100);
        uint32_t slaveCount = busScan(ducoSlave);
        printf("%d of slaves are detected.\n",slaveCount);
        
        for(int i = 0 ; i < slaveCount ; i++)
            printf("Detected slave address[%d]: %d\n",i, ducoSlave[i]);

        for(int i = 0; i < slaveCount; i++){
            writeCmd(ducoSlave[i],CMD_STATUS,NULL,0);//read status command
            readData(ducoSlave[i]);//read status data
            core0 = receiveBuffer.read();
            core1 = receiveBuffer.read();
            receiveBuffer.clear();
            printf("Address: %d \t", ducoSlave[i]);
            printf("Core0: ");
            if(core0 == '0') printf("IDLE");
            else if(core0 == '1') printf("BUSY");
            else printf("DONE");

            printf("\tCore1: ");
            if(core1 == '0')printf("IDLE");
            else if(core1 == '1') printf("BUSY");
            else printf("DONE");
            printf("\n");
            if(core0 == '0' || core1 =='0'){
                writeCmd(ducoSlave[i],CMD_WRITE_JOB, (uint8_t *)message, strlen(message));
            }
            sleep_ms(1000);
        }
        // sleep_ms(1000);
        onBoardLedToggle();
    }
}

uint32_t busScan(uint8_t * slaveAddressArray){
    uint8_t slaveCount = 0;
    int8_t ret = 0;
    uint8_t dummy;
    for(int addr = 100 ; addr < (1 << 7); ++addr){
        if (reserved_addr(addr))
            ret = PICO_ERROR_GENERIC;
        else{
            // sleep_ms(10);
            ret = i2c_read_blocking(i2c1, addr, &dummy, 1, false);
        }
        if(ret > 0)
        {
            slaveAddressArray[slaveCount++] = addr;
        }
        if(slaveCount > 10){
            printf("maximum number of slaves are 10\n");
            return 10;
        }
    }
    return slaveCount;
}

bool reserved_addr(uint8_t addr) {
    return (addr & 0x78) == 0 || (addr & 0x78) == 0x78;
}

uint32_t writeCmd(uint8_t slaveAddress, uint8_t cmd, uint8_t * follow, uint32_t len){
    uint32_t count;
    Wire1.beginTransmission(slaveAddress);
    //write command
    Wire1.write(cmd);
    //write follow
    if(follow)
        Wire1.write((const uint8_t *)follow, len);
    count = Wire1.endTransmission(true);
    return count;
    //should do something with counter
}

uint32_t readData(uint8_t slaveAddress){
    uint32_t count;
    uint8_t status;
    count = Wire1.requestFrom(slaveAddress,128,false);// Status: Core0 | Core1 | '\n'
    while(Wire1.available()){
        receiveBuffer.write((uint8_t)Wire1.read());
    }
    return receiveBuffer.length();
}
