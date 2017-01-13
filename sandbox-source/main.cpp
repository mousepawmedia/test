#include <iostream>
#include "iochannel.hpp"

int main()
{
    pawlib::ioc << "Hello, world!" << pawlib::io_end;
    return 0;
}
