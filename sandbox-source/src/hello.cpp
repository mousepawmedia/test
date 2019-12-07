#include "sandbox/hello.hpp"

void hello()
{
    pawlib::ioc << pawlib::IOFormatTextFG::blue
                << pawlib::IOFormatTextAttr::bold
                << "Hello, world!"
                << pawlib::IOCtrl::endl;
}
