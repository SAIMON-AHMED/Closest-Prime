// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LeastPrimeDifference {
    
    function primeDifference(uint256 n) public pure returns (uint256) {
        if (n == 0) {
            return 2;  // Special case: Nearest prime to 0 is 2
        }
        if (n == 1) {
            return 1;  // Special case: Nearest prime to 1 is 2, so the difference is 1
        }

        uint256 upperPrime = n;
        bool isUpperPrime = false;

        // Find the nearest prime greater than or equal to n
        while (!isUpperPrime) {
            isUpperPrime = true;  // Assume it is prime
            for (uint256 i = 2; i <= upperPrime / 2; i++) {
                if (upperPrime % i == 0) {
                    isUpperPrime = false;  // It's not prime
                    upperPrime++;
                    break;
                }
            }
        }

        uint256 lowerPrime = n;
        bool isLowerPrime = false;

        // Find the nearest prime less than or equal to n
        while (!isLowerPrime && lowerPrime > 1) {
            isLowerPrime = true;  // Assume it is prime
            for (uint256 i = 2; i <= lowerPrime / 2; i++) {
                if (lowerPrime % i == 0) {
                    isLowerPrime = false;  // It's not prime
                    lowerPrime--;
                    break;
                }
            }
        }

        // Compare distances and return the smallest difference
        if (n - lowerPrime > upperPrime - n) {
            return upperPrime - n;
        } else {
            return n - lowerPrime;
        }
    }
}
