# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/pico-sdk/tools/pioasm"
  "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/build/pioasm"
  "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/build/pico-sdk/src/rp2_common/cyw43_driver/pioasm"
  "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/build/pico-sdk/src/rp2_common/cyw43_driver/pioasm/tmp"
  "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/build/pico-sdk/src/rp2_common/cyw43_driver/pioasm/src/PioasmBuild-stamp"
  "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/build/pico-sdk/src/rp2_common/cyw43_driver/pioasm/src"
  "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/build/pico-sdk/src/rp2_common/cyw43_driver/pioasm/src/PioasmBuild-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/build/pico-sdk/src/rp2_common/cyw43_driver/pioasm/src/PioasmBuild-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/build/pico-sdk/src/rp2_common/cyw43_driver/pioasm/src/PioasmBuild-stamp${cfgdir}") # cfgdir has leading slash
endif()
