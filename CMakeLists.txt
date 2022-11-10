# CMakeLists -- build instructions for CMake
# ~ Mark J. Duvall ~ duvall3.git@gmail.com ~ 11/2022 ~ #

cmake_minimum_required(VERSION 3.16)
project(Roll)
add_executable(roll main.cpp)
install(TARGETS roll DESTINATION ${PROJECT_SOURCE_DIR})
