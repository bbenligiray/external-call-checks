//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.4;

contract ContractB {
    function alwaysReverts()
        external
        pure
    {
        revert("I always revert");
    }
}
