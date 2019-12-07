#include <iostream>
#include <string>

#include "sandbox/hello.hpp"
#include "sandbox/eigen_test.hpp"

int main()
{
    Hello::hello();
    eigen_test();
    return 0;
}
