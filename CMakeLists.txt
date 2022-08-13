cmake_minimum_required(VERSION 3.13)

include(pico_sdk_import.cmake)

project(test_project C CXX ASM)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

pico_sdk_init()

add_subdirectory(i2c_slave)
add_subdirectory(utils)
add_subdirectory(minerSlave)
add_subdirectory(minerMaster)