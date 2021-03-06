# CMake Config (MousePaw Media Build System)
# Version: 3.3.0

######################
# USAGE INSTRUCTIONS
# 1. Place in the folder containing your include/ and/or src/ directories.
# 2. Customize the values below to suit your purposes.
# 3. Delete these instructions in your final file.
######################

# CHANGE: Name your project here
project("Project")

# Specify the verison being used.
cmake_minimum_required(VERSION 3.8)

# Import user-specified library path configuration
message("Using ${CONFIG_FILENAME}.config")
include(${CMAKE_HOME_DIRECTORY}/../${CONFIG_FILENAME}.config)

# CHANGE: Specify output binary name
set(TARGET_NAME "project_name")

# SELECT: Project artifact type
set(ARTIFACT_TYPE "library")
#set(ARTIFACT_TYPE "executable")

# CHANGE: Find dynamic library dependencies.
find_library(CAIRO_LIB cairo)
find_path(CAIRO_INCLUDE_DIR cairo/cairo.h)

find_library(SDL2_LIB SDL2)
find_path(SDL2_INCLUDE_DIR SDL2/SDL.h)

# CHANGE: Include headers of dependencies.
set(INCLUDE_LIBS
    ${SIMPLEXPRESS_DIR}/include
    ${NIMBLY_DIR}/include
    ${GOLDILOCKS_DIR}/include
    ${IOSQUEAK_DIR}/include
    ${ONESTRING_DIR}/include
    ${ARCTICTERN_DIR}/include
    ${EIGEN_DIR}/include
    ${EVENTPP_DIR}/include
    ${OPUS_DIR}/include
    ${PUGIXML_DIR}/include
    ${CAIRO_INCLUDE_DIR}/cairo
    ${SDL2_INCLUDE_DIR}/SDL2
)

# CHANGE: Include files to compile.
set(FILES
    include/sandbox/eigen_test.hpp
    include/sandbox/hello.hpp
    include/sandbox/test_test.hpp

    src/eigen_test.cpp
    src/hello.cpp
    src/test_test.cpp
)

# CHANGE: Link against dependencies.
set(LINK_LIBS
    ${SIMPLEXPRESS_DIR}/lib/libsimplexpress
    ${NIMBLY_DIR}/lib/libnimbly
    ${GOLDILOCKS_DIR}/lib/libgoldilocks
    ${IOSQUEAK_DIR}/lib/libiosqueak

    ${CAIRO_LIB}
    ${SDL2_LIB}
    ${OPUS_DIR}/lib/libopus
    ${PUGIXML_DIR}/lib/libpugixml
)

# Imports build script. (Change if necessary to point to build.cmake)
include(${CMAKE_HOME_DIRECTORY}/../build_system/build.cmake)
