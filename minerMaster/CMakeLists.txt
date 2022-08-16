add_executable(minerMaster minerMaster.cpp)

pico_add_extra_outputs(minerMaster)

pico_enable_stdio_usb(minerMaster 0)
pico_enable_stdio_uart(minerMaster 1)

target_compile_options(minerMaster PRIVATE -Wall)

target_link_libraries(minerMaster i2c_slave pico_stdlib pico_unique_id utils mbedcrypto mbedx509 mbedtls hardware_i2c
hardware_irq)