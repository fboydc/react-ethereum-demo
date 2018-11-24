pragma solidity ^0.4.24;

contract Timed {
    uint256 public deadline;

    modifier onlyWhileOpen {
        require(block.timestamp <= deadline);
        _;
    }

    modifier onlyWhileClosed {
        require(block.timestamp > deadline);
        _;
    }

}