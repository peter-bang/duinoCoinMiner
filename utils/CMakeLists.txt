#Add utils library
add_library(utils INTERFACE)
target_include_directories(utils INTERFACE ./)
target_sources(utils INTERFACE Wire.cpp charbuffer.cpp hwSetupUtils.h hwSetupUtils.c)

#Link libraries
target_link_libraries(utils INTERFACE
    hardware_i2c
    hardware_irq
    i2c_slave
)

#Add ducoutils library
add_library(ducoutils INTERFACE)
target_include_directories(ducoutils INTERFACE ./)
target_sources(ducoutils INTERFACE duinoCoinUtils.cpp hwSetupUtils.h hwSetupUtils.c)


## can make hwSetupUtils as a library like belows.
# add_library(hwSetup INTERFACE)
# target_include_directories(hwSetup INTERFACE ./)
# target_sources(hwSetup INTERFACE hwSetupUtils.h hwSetupUtils.c)

## and use like this
# target_link_libraries(ducoutils INTERFACE
# hwSetup
# )

