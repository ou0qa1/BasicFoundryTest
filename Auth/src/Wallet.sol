// https://github.com/t4sk/hello-foundry/blob/main/test/Auth.t.sol 

pragma solidity ^0.8.18;

contract Wallet {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    receive() external payable{}

    function withdraw(uint256 _amount) external {
        require(msg.sender == owner, "caller is not owner");
        payable(msg.sender).transfer(_amount);
    }

    function setOwner(address _owner) external {
        require(msg.sender == owner, "caller is not owner");
        owner = payable(_owner);
    }
}
