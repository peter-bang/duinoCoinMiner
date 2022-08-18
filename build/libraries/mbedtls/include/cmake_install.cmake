# Install script for directory: /Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Applications/ARM/bin/arm-none-eabi-objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mbedtls" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/aes.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/aria.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/asn1.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/asn1write.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/base64.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/bignum.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/build_info.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/camellia.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ccm.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/chacha20.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/chachapoly.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/check_config.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/cipher.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/cmac.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/compat-2.x.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/config_psa.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/constant_time.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ctr_drbg.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/debug.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/des.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/dhm.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ecdh.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ecdsa.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ecjpake.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ecp.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/entropy.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/error.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/gcm.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/hkdf.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/hmac_drbg.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/mbedtls_config.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/md.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/md5.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/memory_buffer_alloc.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/net_sockets.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/nist_kw.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/oid.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/pem.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/pk.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/pkcs12.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/pkcs5.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/platform.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/platform_time.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/platform_util.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/poly1305.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/private_access.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/psa_util.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ripemd160.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/rsa.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/sha1.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/sha256.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/sha512.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ssl.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ssl_cache.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ssl_ciphersuites.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ssl_cookie.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ssl_ticket.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/threading.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/timing.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/version.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/x509.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/x509_crl.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/x509_crt.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/x509_csr.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/psa" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_builtin_composites.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_builtin_primitives.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_compat.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_config.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_driver_common.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_driver_contexts_composites.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_driver_contexts_primitives.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_extra.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_platform.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_se_driver.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_sizes.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_struct.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_types.h"
    "/Volumes/ExtSSD/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_values.h"
    )
endif()

