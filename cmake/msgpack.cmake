if(NOT MSGPACK_INCLUDE_PATH)
  set(MSGPACK_URL "https://github.com/msgpack/msgpack-c/releases/download/cpp-2.1.5/msgpack-2.1.5.tar.gz")
  set(MSGPACK_PATH "${CMAKE_CURRENT_BINARY_DIR}/msgpack-2.1.5.tar.gz")
  set(MSGPACK_EXTRACT_PATH "${CMAKE_CURRENT_BINARY_DIR}/msgpack-2.1.5")
  set(MSGPACK_SHA256 "6126375af9b204611b9d9f154929f4f747e4599e6ae8443b337915dcf2899d2b")

  file(DOWNLOAD ${MSGPACK_URL} ${MSGPACK_PATH} EXPECTED_HASH SHA256=${MSGPACK_SHA256})

  add_custom_command(
      OUTPUT ${MSGPACK_EXTRACT_PATH}
      COMMAND ${CMAKE_COMMAND} -E tar xzf ${MSGPACK_PATH}
  )
  set(MSGPACK_INCLUDE_PATH "${MSGPACK_EXTRACT_PATH}/include")
  add_custom_target(msgpack-c DEPENDS ${MSGPACK_EXTRACT_PATH} ${REQUIREMENTS_INSTALLED})
else()
  add_custom_target(msgpack-c DEPENDS ${REQUIREMENTS_INSTALLED})
endif()

include_directories(${MSGPACK_INCLUDE_PATH})
