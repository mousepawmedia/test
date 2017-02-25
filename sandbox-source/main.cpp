#include <iostream>
#include "pawlib/iochannel.hpp"
#include "cinder/audio/audio.h"
int main()
{


    pawlib::ioc << "Hello, world!" << pawlib::io_end;
    return 0;
}
