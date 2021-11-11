cmake_minimum_required(VERSION 3.20)
project(woodland)
set(CMAKE_C_STANDARD 90)

find_package(Curses REQUIRED)
include_directories(${CURSES_INCLUDE_DIR})

add_executable (
    ${PROJECT_NAME} src/woodland.c
)

target_compile_options(
    ${PROJECT_NAME} PRIVATE -Wall -Wextra -Wpedantic -Werror
)

target_compile_options("${PROJECT_NAME}" PRIVATE -Wall -Wextra -pedantic -Werror)

set_property(TARGET ${PROJECT_NAME} PROPERTY C_STANDARD 90)

set(CURSES_NEED_NCURSES TRUE)
target_link_libraries(${PROJECT_NAME} ${CURSES_LIBRARIES})

