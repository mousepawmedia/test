#include "sandbox/hello.hpp"

void Hello::hello()
{
    pawlib::ioc << pawlib::IOFormatTextFG::fg_blue
                << pawlib::IOFormatTextAttributes::ta_bold
                << "Hello, world!"
                << pawlib::IOControl::io_end;
}
