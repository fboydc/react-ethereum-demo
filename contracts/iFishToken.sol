pragma solidity ^0.4.24;

contract iFishToken {
    function balanceOf(address _owner) public view returns(uint256 balance);

    function transfer(address _to, uint256 _amount) public returns (bool success);

    function issueTokens(address _beneficiary, uint256 _amount) public returns (bool success);

    function getShark() public view returns (address sharkAddress, uint256 sharkBalance);

    function isShark(address _address) public view returns (bool success);

    event LogTransfer(address indexed _from, address indexed _to, uint256 _value);

    event LogIssue(address indexed _member, uint256 _value);

    event LogNewShark(address indexed _shark, uint256 _value);
}