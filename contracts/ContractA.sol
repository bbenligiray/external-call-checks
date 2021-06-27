//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.4;

import "./ContractB.sol";
import "./interfaces/IContractB.sol";

contract ContractA {
    address private contractB;

    constructor(address _contractB)
    {
        contractB = _contractB;
    }

    // This will revert
    function callContractB()
        external
        view
    {
        ContractB(contractB).alwaysReverts();
    }

    // This will revert too
    function callContractBInterface()
        external
        view
    {
        IContractB(contractB).alwaysReverts();
    }

    // This will not revert but the call will return false
    // If you don't check it you may think everything is fine
    function callFunctionDirectly()
        external
    {
        address(contractB).call(abi.encodeWithSignature("alwaysReverts()"));
    }

    function callFunctionDirectlyAndCheckTheReturnValue()
        external
    {
        (bool status, ) = address(contractB).call(abi.encodeWithSignature("alwaysReverts()"));
        require(status, "My call reverted");
    }
}
