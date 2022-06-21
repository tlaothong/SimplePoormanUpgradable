// contracts/Box.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./IBox.sol";
 
contract MyBoxProxy is IBox {
    address private target;
 
    // Stores a new value in the contract
    function store(uint256 newValue) public {
        IBox realSubject = IBox(target);
        realSubject.store(newValue);
    }
 
    // Reads the last stored value
    function retrieve() public view returns (uint256) {
        IBox realSubject = IBox(target);
        return realSubject.retrieve();
    }

    function updateTo(address contractAddr) public {
        target = contractAddr;
    }
}