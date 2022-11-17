//
// Copyright (c) 2022 Jamie Kenyon. All Rights Reserved.
//
// SPDX-License-Identifier: MIT.
//

#include <array>
#include <asm-lib/asm-lib.hxx>
#include <catch2/catch_test_macros.hpp>

SCENARIO("sum")
{
    GIVEN("A set of 2 doubles")
    {
        std::vector<double> two_values = { 1.0, 2.0 };

        THEN("The sum can be obtained.")
        {
            REQUIRE(lib::sum(two_values) == 3.0);
        }
    }

    GIVEN("A set of 3 doubles")
    {
        std::vector<double> three_values = { 1.0, 2.0, 3.0 };

        THEN("The sum can be obtained.")
        {
            REQUIRE(lib::sum(three_values) == 6.0);
        }
    }

    GIVEN("A set of 4 doubles")
    {
        std::vector<double> four_values = { 1.0, 2.0, 3.0, 3.0 };

        THEN("The sum can be obtained.")
        {
            REQUIRE(lib::sum(four_values) == 9.0);
        }
    }
}
