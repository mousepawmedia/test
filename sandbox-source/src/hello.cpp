#include "sandbox/hello.hpp"

void hello()
{
    ioc << IOFormatTextFG::blue
        << IOFormatTextAttr::bold
        << "Hello, world!"
        << IOCtrl::endl;
}
