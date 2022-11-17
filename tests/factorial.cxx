//
// Copyright (c) 2022 Jamie Kenyon. All Rights Reserved.
//
// SPDX-License-Identifier: MIT.
//

#include <array>
#include <asm-lib/asm-lib.hxx>
#include <catch2/catch_test_macros.hpp>

SCENARIO("factorial")
{
    GIVEN("A set of integers")
    {
        std::array<uint64_t, 9> integers = { 0, 1, 2, 3, 4, 5, 6, 7, 8 };

        THEN("The factorials can be obtained.")
        {
            REQUIRE(lib::factorial(integers[0]) == 1);              // 0
            REQUIRE(lib::factorial(integers[1]) == 1);              // 1
            REQUIRE(lib::factorial(integers[2]) == 2);              // 2
            REQUIRE(lib::factorial(integers[3]) == 6);              // 3
            REQUIRE(lib::factorial(integers[4]) == 24);             // 4
            REQUIRE(lib::factorial(integers[5]) == 120);            // 5
            REQUIRE(lib::factorial(integers[6]) == 720);            // 6
            REQUIRE(lib::factorial(integers[7]) == 5040);           // 7
            REQUIRE(lib::factorial(integers[8]) == 40320);          // 8
        }
    }
}
