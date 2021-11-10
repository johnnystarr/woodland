cmake_minimum_required(VERSION 3.21)
project(woodland)
set(CMAKE_C_STANDARD 90)

find_package(Curses REQUIRED)
include_directories(${CURSES_INCLUDE_DIR})

add_executable (
    ${CMAKE_PROJECT_NAME} src/woodland.c
)

target_link_libraries(${CMAKE_PROJECT_NAME} ${CURSES_LIBRARIES})
