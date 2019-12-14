/** Hello [Sandbox]
  * Version: 1.0
  *
  * MousePaw Media's own Hello World.
  *
  * Author(s): Jason C. McDonald
  */

/* LICENSE (BSD-3-Clause)
 * Copyright (c) 2019 MousePaw Media.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its contributors
 * may be used to endorse or promote products derived from this software without
 * specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 *
 * CONTRIBUTING
 * See https://www.mousepawmedia.com/developers for information
 * on how to contribute to our projects.
 */

#ifndef SANDBOX_TEST_TEST_HPP
#define SANDBOX_TEST_TEST_HPP

#include "pawlib/goldilocks.hpp"
#include "pawlib/goldilocks_assertions.hpp"

class Test_AssertEqual : public Test
{
    public:
    Test_AssertEqual() = default;

    testdoc_t get_title() override
    {
        return "Test Goldilocks Assert Equal";
    }

    testdoc_t get_docs() override
    {
        return "Tests the PL_ASSERT_EQUAL with two integers.";
    }

    bool run() override
    {
        int left = 42;
        int right = 42;
        PL_ASSERT_EQUAL(left, right);
        return true;
    }

    ~Test_AssertEqual() = default;
};

class Test_TestSuite : public TestSuite
{
    public:
    Test_TestSuite() = default;

    testdoc_t get_title() override
    {
        return "Test Golidlocks Tests";
    }

    void load_tests() override;

    ~Test_TestSuite() = default;
};

#endif
