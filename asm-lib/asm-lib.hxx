//
// Copyright (c) 2022 Jamie Kenyon. All Rights Reserved.
//
// SPDX-License-Identifier: MIT.
//

#include <asm-lib/asm-lib.h>
#include <string>
#include <vector>

namespace lib
{
    /// Obtain the product of all positive integers less than or equal to n.
    /// \param n A positive integer.
    /// \return The product of all positive integers less than or equal to n.
    static inline auto factorial(uint64_t n) -> uint64_t
    {
        return ::al_factorial(n);
    }

    /// Sum a sequence of numbers.
    /// \param sequence A sequence of numbers to sum.
    /// \return The sum of the numbers in the sequence.
    static inline auto sum(std::vector<double> const& sequence)
    {
        return ::al_sumd(sequence.data(), sequence.size());
    }

} // namespace lib
