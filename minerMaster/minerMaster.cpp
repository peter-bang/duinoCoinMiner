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

//Duino coin server functions
uint32_t readJob(uint8_t * job, uint8_t socketNumber);
uint8_t sendResult(uint8_t * result);

uint32_t writeCmd(uint8_t slaveAddress, uint8_t cmd, uint8_t * follow, uint32_t len);
uint32_t readData(uint8_t slaveAddress, uint32_t len);
uint32_t busScan(uint8_t * slaveAddressArray);
bool reserved_addr(uint8_t addr);

int main() {
    bi_decl(bi_program_description("Binary for the slave of the duino coin mining example. WIZnet Co,.Ltd"));
    bi_decl(bi_1pin_with_name(LED_PIN, "On-board LED"));

    stdio_init_all();
    hardwareInit();
    
    onBoardLedOn();
    
    //initial delay
    sleep_ms(2000);
    
    Wire1.begin();

    printf("Master starts\n");

    uint8_t job[BUF_SIZE];
    printf("I2C Bus scanning..\n");

    uint32_t slaveCount = busScan(ducoSlave);

    printf("%d of slaves are detected.\n",slaveCount);
        
    for(int i = 0 ; i < slaveCount ; i++)
        printf("Detected slave address[%d]: %d\n",i, ducoSlave[i]);


    while(1){        
        for(int i = 0; i < slaveCount; i++){
            writeCmd(ducoSlave[i],CMD_STATUS,NULL,0);//read status command
            readData(ducoSlave[i], 128);//read status data
            uint8_t core0 = receiveBuffer.read();
            uint8_t core1 = receiveBuffer.read();
            receiveBuffer.clear();
            if(core0 == '0' || core1 =='0'){//HASH_IDLE
                //get the job from the duino coin server
                uint8_t socketNumber = rand()%99;
                uint32_t length = readJob(job, socketNumber);
                //send the write job command and the job string
                printf("Job allocated => %s\n",job);
                writeCmd(ducoSlave[i],CMD_WRITE_JOB, (uint8_t *)job, length);
            } else if (core0 == '2' || core1 == '2'){//HASH_DONE
                //send the read result command
                writeCmd(ducoSlave[i],CMD_READ_RESULT,NULL,0);
                //read results
                readData(ducoSlave[i],128);

                //do something with the result

                //send result to the duino coin server
                sendResult((uint8_t*)receiveBuffer.buf());
                //clear receive Buffer
                receiveBuffer.clear();
            }
        }
        sleep_ms(1000);
        onBoardLedToggle();
    }
}

uint32_t busScan(uint8_t * slaveAddressArray){
    uint8_t slaveCount = 0;
    int8_t ret = 0;
    uint8_t dummy;
    for(int addr = 0 ; addr < (1 << 7); ++addr){
        if (reserved_addr(addr))
            {
                ret = PICO_ERROR_GENERIC;
            }
        else{
            absolute_time_t i2c_timeout;
            i2c_timeout = get_absolute_time();
            i2c_timeout._private_us_since_boot += 100000;
            ret = i2c_read_blocking_until(i2c1, addr, &dummy, 1, true,i2c_timeout);
        }
        if(ret > 0){
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

uint32_t readData(uint8_t slaveAddress, uint32_t len){
    uint32_t count;
    uint8_t status;
    count = Wire1.requestFrom(slaveAddress,len,false);// Status: Core0 | Core1 | '\n'
    while(Wire1.available()){
        receiveBuffer.write((uint8_t)Wire1.read());
    }
    return receiveBuffer.length();
}

uint32_t readJob(uint8_t * job, uint8_t socketNumber){
    //소켓번호 할당해야함.

    char dummyMessage[] = "4db808021dcee957da8b5f32e2a46a0ca0c6914f,24e948f4ff5a6984fa7b933c0cfa620fdde6c38b,25000\n";
    
    sprintf((char*)job, "%02d,%s", socketNumber, dummyMessage);

    return strlen((char*)job);
}

uint8_t sendResult(uint8_t * result){
    printf("Result: %s\n",result);
    return 0;
}