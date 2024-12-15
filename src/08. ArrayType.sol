// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./Interfaces.sol";

contract ArrayType is IArrayType {
    uint256[] array;

    function initArray() public {
        for (uint256 i; i < 200; ++i) {
            array.push(i);
        }
    }
}

contract ArrayTypeOptimized is IArrayType {
    uint256[] array;

    function initArray() public {
        uint256[] storage arr = array;
        assembly {
            sstore(arr.slot, 200)
        }
        for (uint256 i; i < 200; ) {
            assembly {
                mstore(0, arr.slot)
                let hash := keccak256(0, 32)
                sstore(add(hash, i), i)
            }
            unchecked { ++i; }
        }
    }
}

