// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./Interfaces.sol";

contract Addition is IAddition {
    uint256 number = 1;

    function addition(uint256 value) public {
        number += value;
    }
}

contract Subtraction is ISubtraction {
    uint256 number = 100;

    function subtraction(uint256 value) public {
        number -= value;
    }
}

contract Division is IDivision {
    function divisionBy2(uint256 number) public pure returns (uint256) {
        return number / 2;
    }

    function divisionBy128(uint256 number) public pure returns (uint256) {
        return number / 128;
    }
}

contract AdditionOptimized is IAddition {
    uint256 number = 1;

    function addition(uint256 value) public {
        unchecked {
            number += value; // Убираем проверки на overflow, уменьшая газ.
        }
    }
}

contract SubtractionOptimized is ISubtraction {
    uint256 number = 100;

    function subtraction(uint256 value) public {
        unchecked {
            number -= value; // Аналогично убираем проверки на underflow.
        }
    }
}

contract DivisionOptimized is IDivision {
    function divisionBy2(uint256 number) public pure returns (uint256) {
        // Заменяем деление на сдвиг вправо на 1 бит
        return number >> 1;
    }

    function divisionBy128(uint256 number) public pure returns (uint256) {
        // Заменяем деление на сдвиг вправо на 7 бит
        return number >> 7;
    }
}
