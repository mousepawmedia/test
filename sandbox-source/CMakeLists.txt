# CMake Config (MousePaw Media Build System)
# Version: 3.3.0

# CHANGE: Name your project here
project("Sandbox")

# Specify the version being used.
cmake_minimum_required(VERSION 3.8)

# Import user-specified library path configuration
message("Using ${CONFIG_FILENAME}.config")
include(${CMAKE_HOME_DIRECTORY}/../${CONFIG_FILENAME}.config)

# CHANGE: Specify output binary name
set(TARGET_NAME "sandbox")

# SELECT: Project artifact type
set(ARTIFACT_TYPE "library")
#set(ARTIFACT_TYPE "executable")

# CHANGE: Header-only library dependencies.
set(INCLUDE_LIBS
    #simplexpress
    nimbly
    goldilocks
    iosqueak
    onestring
    arctictern
    eigen
    eventpp
    opus
    pugixml
    cairo
    sdl2
)

# CHANGE: Link against dependencies.
set(LINK_LIBS
    #simplexpress
    nimbly
    goldilocks
    iosqueak
    cairo
    SDL2
    opus
    pugixml
)

# CHANGE: Override library directories if necessary.
# Uses value from your .config file first.
#set(sandbox_dir ../sandbox-source)

# CHANGE: Override include directories as necessary.
# Uses '<library>_dir/include' by default
find_path(cairo_include cairo/cairo.h)
set(cairo_include ${cairo_include}/cairo)
find_path(sdl2_include SDL2/SDL.h)
set(sdl2_include ${sdl2_include}/SDL2)

# CHANGE: Additional directories to include.
set(ADDITIONAL_INCLUDES
)

# CHANGE: Include files to compile.
set(FILES
    include/sandbox/eigen_test.hpp
    include/sandbox/hello.hpp
    include/sandbox/sdl2_hello.hpp
    include/sandbox/test_test.hpp

    src/eigen_test.cpp
    src/hello.cpp
    src/sdl2_hello.cpp
    src/test_test.cpp
)

# Imports build script. (Change if necessary to point to build.cmake)
include(${CMAKE_HOME_DIRECTORY}/../build_system/build.cmake)
