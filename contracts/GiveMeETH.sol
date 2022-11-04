// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract GiveMeETH{
    string message;
    address owner;
    event NewMessage(string message);


    constructor(string memory _message) payable {
       message = _message;
       owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    function payMe() public payable {
    }
    function changeMesage(string calldata _m) public {
        message = _m;
        emit NewMessage(_m);
    }
    function showMessage()public view returns(string memory){
        return message;
    }
    function withdrawl()public onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }


  
}