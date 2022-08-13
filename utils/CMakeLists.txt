add_library(utils INTERFACE)

target_include_directories(utils
    INTERFACE
    ./)

target_sources(utils INTERFACE Wire.cpp charbuffer.cpp)

target_link_libraries(utils INTERFACE
    hardware_i2c
    hardware_irq
)
