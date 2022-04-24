pragma solidity ^0.4.21;

// Relevant part of the CaptureTheEther contract.
contract CaptureTheEther {
    mapping (address => bytes32) public nicknameOf;

    function setNickname(bytes32 nickname) public {
        nicknameOf[msg.sender] = nickname;
    }
}

// Challenge contract. You don't need to do anything with this; it just verifies
// that you set a nickname for yourself.
contract NicknameChallenge {
    CaptureTheEther cte = CaptureTheEther(msg.sender);
    address player;

    // Your address gets passed in as a constructor parameter.
    function NicknameChallenge(address _player) public {
        player = _player;
    }

    // Check that the first character is not null.
    function isComplete() public view returns (bool) {
        return cte.nicknameOf(player)[0] != 0;
    }
}

contract TestContract {

        bytes32 public lastTestBytes32Result; //


    function stringToBytes32(string memory source) pure returns (bytes32 result) {
        // require(bytes(source).length <= 32); // causes error
        // but string have to be max 32 chars
        // https://ethereum.stackexchange.com/questions/9603/understanding-mload-assembly-function
        // http://solidity.readthedocs.io/en/latest/assembly.html
        assembly {
        result := mload(add(source, 32))
        }
    }

    function stringToBytes32Test(string _string) public  returns (bytes32) {
        bytes32 _bytes32 = stringToBytes32(_string);
        lastTestBytes32Result = _bytes32;
        return _bytes32;
    }
}
