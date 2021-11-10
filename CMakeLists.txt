cmake_minimum_required(VERSION 3.20)
project(woodland)
set(CMAKE_C_STANDARD 90)

find_package(Curses REQUIRED)
include_directories(${CURSES_INCLUDE_DIR})

add_executable (
    ${CMAKE_PROJECT_NAME} src/woodland.c
)

target_compile_options(
    ${CMAKE_PROJECT_NAME} PRIVATE -Wall -Wextra -Wpedantic -Werror
)

if(MSVC)
    target_compile_options(${CMAKE_PROJECT_NAME} PRIVATE /W4 /WX)
endif()

if(APPLE)
    add_definitions(-Weverything)
endif()

set_property(TARGET ${CMAKE_PROJECT_NAME} PROPERTY C_STANDARD 90)

set(CURSES_NEED_NCURSES TRUE)
target_link_libraries(${CMAKE_PROJECT_NAME} ${CURSES_LIBRARIES})

