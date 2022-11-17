//
// Copyright (c) 2022 Jamie Kenyon. All Rights Reserved.
//
// SPDX-License-Identifier: MIT.
//

#if defined (__cplusplus)
#   include <cstdint>
#else
#   include <inttypes.h>
#endif // !defined(__cplusplus)

/// Obtain the product of all positive integers less than or equal to n.
/// \param n A positive integer.
/// \return The product of all positive integers less than or equal to n.
extern "C" uint64_t al_factorial(uint64_t n);

/// Sum a sequence of doubles.
/// \param sequence An array of numbers to sum.
/// \param length The length of the array.
/// \return The sum of the numbers in the sequence.
extern "C" double al_sumd(double const* sequence, uint64_t length);
