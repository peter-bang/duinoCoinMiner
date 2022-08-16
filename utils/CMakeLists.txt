add_library(utils INTERFACE)
add_library(ducoutils INTERFACE)

target_include_directories(utils INTERFACE ./)
target_include_directories(ducoutils INTERFACE ./)

target_sources(ducoutils INTERFACE duinoCoinUtils.cpp)
target_sources(utils INTERFACE Wire.cpp charbuffer.cpp hwSetupUtils.cpp)

target_link_libraries(utils INTERFACE
    hardware_i2c
    hardware_irq
    i2c_slave
)