// contracts/Box.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//import "./path";

contract Auth {
    address private _administrator;

    constructor(address deployer) {
        // Make the deployer of the contract the administrator
        _administrator = deployer;
    }

    function isAdministrator(address user) public view returns (bool) {
        return user == _administrator;
    }
}


contract Box {
    uint256 private _value;
    Auth private _auth;

    // Emitted when the stored value changes
    event ValueChanged(uint256 value);

    constructor() {
        _auth = new Auth(msg.sender);
    }

    // Stores a new value in the contract
    function store(uint256 value) public {
        require(_auth.isAdministrator(msg.sender), "Unauthorized");
        _value = value;
        emit ValueChanged(value);
    }

    // Reads the last stored value
    function retrieve() public view returns (uint256) {
        return _value;
    }
}