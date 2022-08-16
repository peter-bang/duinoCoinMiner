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

CharBuffer receiveBuffer;

int main() {
    bi_decl(bi_program_description("Binary for the slave of the duino coin mining example. WIZnet Co,.Ltd"));
    bi_decl(bi_1pin_with_name(LED_PIN, "On-board LED"));

    stdio_init_all();
    hardwareInit();
    
    onBoardLedOn();
    
    //initial delay
    sleep_ms(100);
    
    // // pins before calling Wire::begin()
    printf("Master mode\n");
    Wire1.begin();//i2c1 master start

    char message[] = "4db808021dcee957da8b5f32e2a46a0ca0c6914f,24e948f4ff5a6984fa7b933c0cfa620fdde6c38b,25000\n";

    uint8_t test_buffer[256] = "";
    uint8_t result;
    char core0, core1;
    while(1){
        uint8_t count;
        uint8_t temp;
        //status reading operation
        Wire1.beginTransmission(3);
        Wire1.write(0x00);//ready status
        Wire1.endTransmission(true);

        //read the status
        count = Wire1.requestFrom(3,3,false);//status is only 2
        while(Wire1.available()){
            temp = Wire1.read();
            printf("core status: %02x\n",temp);
            receiveBuffer.write(temp);
        }
        core0 = receiveBuffer.read();
        core1 = receiveBuffer.read();
        receiveBuffer.clear();
        if(core0 == '0' || core1 =='0'){
            Wire1.beginTransmission(3);
            Wire1.write(0x01);//job
            Wire1.write((const uint8_t *)message, strlen(message));
            Wire1.endTransmission(true);
        }
        sleep_ms(1000);
        onBoardLedToggle();
    }
}