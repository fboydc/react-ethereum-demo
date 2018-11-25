pragma solidity ^0.4.24;
import "./FishToken.sol";
import "node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";

contract TimeMockedFishToken is FishToken{
    using SafeMath for uint256;

    constructor(uint256 _deadline) FishToken(_deadline) public{
            
    }

    function leapForwardInTime(uint256 _seconds) public returns (bool success){
        if(deadline.sub(_seconds) > deadline){
            return false;
        }

        deadline = deadline.sub(_seconds);
        return true;
    }

    function leapBackInTime(uint256 _seconds) public returns (bool success){
        if(deadline.add(_seconds) < deadline){
            return false;
        }
        deadline = deadline.add(_seconds);
        return true;

    }

    
}