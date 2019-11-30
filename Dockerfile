# Testing Dockerfile (MousePaw Media Build System)
# Version: 2.2.0
# Tailored For: Sandbox
#
# Author(s): Jason C. McDonald

# LICENSE
# Copyright (c) 2019 MousePaw Media.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its contributors
# may be used to endorse or promote products derived from this software without
# specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
# THE POSSIBILITY OF SUCH DAMAGE.
#
# CONTRIBUTING
# See https://www.mousepawmedia.com/developers for information
# on how to contribute to our projects.

FROM ubuntu:bionic

# Install C/C++ Development Environment
# TODO: This should eventually be in a pre-defined image.
RUN \
    apt-get update && \
    apt-get install -y lsb-release wget gnupg2 apt-utils && \
    echo "deb http://apt.llvm.org/`lsb_release -sc`/ llvm-toolchain-`lsb_release -sc` main" > /etc/apt/sources.list.d/llvm.list && \
    wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    apt-get update && \
    apt-get install -y python-lldb-7 && \
    apt-get install -y libllvm7 llvm-7 llvm-7-dev \
    llvm-7-runtime clang-7 clang-tools-7 libclang-common-7-dev libclang-7-dev \
    libclang1-7 libfuzzer-7-dev lldb-7 lld-7 libc++-7-dev libc++abi-7-dev \
    libomp-7-dev && \
    ln -sf /usr/bin/llvm-symbolizer-7 /usr/bin/llvm-symbolizer && \
    ln -sf /usr/bin/lldb-server-7 /usr/lib/llvm-7/bin/lldb-server-7.0.0 && \
    apt-get install -y gcc g++ gcc-multilib g++-multilib libc6-dev-i386 \
    git cppcheck build-essential cmake valgrind cccc autoconf automake libtool

# Install system dependencies.
RUN \
    apt-get install -y libcairo2-dev libsdl2-dev

# Clone and build third-party dependencies
RUN \
    git clone https://github.com/mousepawmedia/libdeps.git && \
    cd libdeps/opus && autoreconf -f -i && cd .. && make ready && cd

# Clone and build PawLIB
RUN \
    git clone https://github.com/mousepawmedia/pawlib.git && \
    cd pawlib && make ready && cd

# Clone and build this repository
RUN \
    git clone https://github.com/mousepawmedia/test.git && \
    cd test && make tester_debug
