pragma solidity ^0.4.24;
 
import "./iPool.sol";
import "./Timed.sol";
import "./iFishToken.sol";
import "./FishToken.sol";
import "node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";


contract Pool is iPool, Timed {
    using SafeMath for uint256;

    string public name;
    address public token;
    uint256 public rate;

    constructor(string _name, uint256 _rate,  uint256 _deadline) public{
        require(_rate > 0);
        require(_deadline > block.timestamp);
        name = _name;
        rate = _rate;
        deadline = _deadline;
        token = new FishToken(_deadline);
    }

    function() public payable onlyWhileOpen {
        require(msg.value > 0);
        uint256 rewardTokens = rate.mul(msg.value);
        require(iFishToken(token).issueTokens(msg.sender, rewardTokens));
    }

    function withdraw() public onlyWhileClosed returns (bool success) {
        if(iFishToken(token).isShark(msg.sender)) {
            msg.sender.transfer(address(this).balance);
            return true;
        }

        return false;
    } 

}