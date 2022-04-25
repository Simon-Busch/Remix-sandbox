pragma solidity ^0.4.21;

contract GuessTheRandomNumberChallenge {
    uint8 answer;

    function GuessTheRandomNumberChallenge() public payable {
        require(msg.value == 1 ether);
        answer = uint8(keccak256(block.blockhash(block.number - 1), now));
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function guess(uint8 n) public payable {
        require(msg.value == 1 ether);

        if (n == answer) {
            msg.sender.transfer(2 ether);
        }
    }
}


contract GuessTheRandomNumberChallengeHack {
    uint8 public answer;

    function hack() public {
        // previous block hash = "0xdd51bfbf089e41cca26c677a2d99c7b201321a0c4d5d0e15e6234deeea9b87da"
        // convert utc time to epoch
        answer = uint8(keccak256(bytes32(0xdd51bfbf089e41cca26c677a2d99c7b201321a0c4d5d0e15e6234deeea9b87da), uint256(1650791377)));
    }
}
