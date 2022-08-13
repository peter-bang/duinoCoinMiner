add_executable(minerSlave hwSetupUtils.cpp minerSlave.cpp)

pico_add_extra_outputs(minerSlave)

pico_enable_stdio_usb(minerSlave 0)
pico_enable_stdio_uart(minerSlave 1)

target_compile_options(minerSlave PRIVATE -Wall)

target_link_libraries(minerSlave pico_stdlib pico_unique_id i2c_slave utils)