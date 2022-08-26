add_executable(minerSlave minerSlave.cpp)

pico_enable_stdio_usb(minerSlave 0)
pico_enable_stdio_uart(minerSlave 1)

pico_add_extra_outputs(minerSlave)

target_compile_options(minerSlave PRIVATE -Wall)

target_link_libraries(minerSlave pico_multicore hardware_i2c hardware_irq i2c_slave pico_stdlib pico_unique_id utils ducoutils mbedcrypto mbedx509 mbedtls)

