if(NOT MSGPACK_INCLUDE_PATH)
  set(MSGPACK_URL "https://github.com/msgpack/msgpack-c/releases/download/cpp-3.3.0/msgpack-3.3.0.tar.gz")
  set(MSGPACK_PATH "${CMAKE_CURRENT_BINARY_DIR}/msgpack-3.3.0.tar.gz")
  set(MSGPACK_EXTRACT_PATH "${CMAKE_CURRENT_BINARY_DIR}/msgpack-3.3.0")
  set(MSGPACK_SHA256 "6e114d12a5ddb8cb11f669f83f32246e484a8addd0ce93f274996f1941c1f07b")

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
