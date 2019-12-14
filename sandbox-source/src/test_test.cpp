#include "sandbox/test_test.hpp"

void Test_TestSuite::load_tests()
{
    register_test("tB01", new Test_AssertEqual);
}
