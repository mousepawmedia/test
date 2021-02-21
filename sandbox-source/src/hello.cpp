#include "sandbox/hello.hpp"

#include "iosqueak/channel.hpp"

void hello()
{
	channel << IOFormatTextFG::blue << IOFormatTextAttr::bold << "Hello, world!"
			<< IOCtrl::endl;
}
