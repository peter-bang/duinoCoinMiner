# Install script for directory: /Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include

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
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/aes.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/aria.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/asn1.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/asn1write.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/base64.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/bignum.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/build_info.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/camellia.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ccm.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/chacha20.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/chachapoly.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/check_config.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/cipher.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/cmac.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/compat-2.x.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/config_psa.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/constant_time.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ctr_drbg.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/debug.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/des.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/dhm.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ecdh.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ecdsa.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ecjpake.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ecp.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/entropy.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/error.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/gcm.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/hkdf.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/hmac_drbg.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/mbedtls_config.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/md.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/md5.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/memory_buffer_alloc.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/net_sockets.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/nist_kw.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/oid.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/pem.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/pk.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/pkcs12.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/pkcs5.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/platform.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/platform_time.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/platform_util.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/poly1305.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/private_access.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/psa_util.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ripemd160.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/rsa.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/sha1.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/sha256.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/sha512.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ssl.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ssl_cache.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ssl_ciphersuites.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ssl_cookie.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/ssl_ticket.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/threading.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/timing.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/version.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/x509.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/x509_crl.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/x509_crt.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/mbedtls/x509_csr.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/psa" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_builtin_composites.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_builtin_primitives.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_compat.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_config.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_driver_common.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_driver_contexts_composites.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_driver_contexts_primitives.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_extra.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_platform.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_se_driver.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_sizes.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_struct.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_types.h"
    "/Volumes/외장하드/workspace/rpi-pico/duinoCoinMiner/libraries/mbedtls/include/psa/crypto_values.h"
    )
endif()

