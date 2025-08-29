set(VENV_DIR "${CMAKE_CURRENT_BINARY_DIR}/msgpack-venv")
set(REQUIREMENTS "${CMAKE_SOURCE_DIR}/python/requirements.txt")
set(REQUIREMENTS_INSTALLED "${VENV_DIR}/requirements.installed")

if(WIN32)
  set(BASEPYEXE py.exe -3)
  set(PYEXE "${VENV_DIR}/Scripts/python.exe")
else()
  set(BASEPYEXE python3)
  set(PYEXE "${VENV_DIR}/bin/python3")
endif()

add_custom_command(
    OUTPUT ${PYEXE}
    COMMAND ${BASEPYEXE} -m venv ${VENV_DIR}
)

add_custom_command(
    OUTPUT ${REQUIREMENTS_INSTALLED}
    COMMAND ${PYEXE} -m pip install -r ${REQUIREMENTS}
    COMMAND ${CMAKE_COMMAND} -E touch ${REQUIREMENTS_INSTALLED}
    DEPENDS ${PYEXE} ${REQUIREMENTS}
)

add_custom_target(cpp_python_gen DEPENDS ${REQUIREMENTS_INSTALLED})
