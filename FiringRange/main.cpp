#include <iostream>
#include "rigid_stack.hpp"

using std::cout;
using std::endl;

int main()
{
    pawlib::RigidStack<uint32_t,10> stk;
    std::cout << "Size: " << stk.length() << std::endl;

    stk.push(42);
    stk.push(76);
    std::cout << stk.pop() << std::endl;
    std::cout << stk.pop() << std::endl;

    for(int i=0; i < 10; i++)
    {
        stk.push(i+1);
        std::cout << stk.top() << std::endl;
    }

    while(true)
    {
        try
        {
            std::cout << stk.pop() << std::endl;
        }
        catch(std::out_of_range)
        {
            break;
        }
    }

    return 0;
}
