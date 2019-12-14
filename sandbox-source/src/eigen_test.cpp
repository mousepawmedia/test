#include "sandbox/eigen_test.hpp"

void eigen_test()
{
    Eigen::MatrixXd answer(3, 3);
    answer(0,0) = 10;
    answer(0,1) = 12;
    answer(0,2) = 20;

    answer(1,0) = 1;
    answer(1,1) = answer(0,0) + answer(0,2);
    answer(1,2) = 11;

    answer(2,0) = answer(1,0) + answer(1,1);
    answer(2,1) = 0;
    answer(2,2) = answer(1,2);

    //ioc << answer << IOCtrl::endl;  // does not work
    std::cout << "Testing Eigen..." << std::endl;
    std::cout << answer << std::endl;
}
