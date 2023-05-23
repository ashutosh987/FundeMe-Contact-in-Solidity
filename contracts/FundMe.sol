// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConvertor.sol";

error NotOwner();

contract FundMe {

    using PriceConvertor for uint256;

    uint256 public constant minUsd = 50 * 1e18;

    address[] public funders;

    address public immutable ownerAddress;

    constructor () {
        ownerAddress = msg.sender;
    }

    mapping (address => uint256) public addressToAmountFunded;

    function fundMe() public payable {

        require(msg.value.getConversionRate() >= minUsd, "less value, hence reverting");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withDrawable() public onlyOwner {
        for(uint256 fundIndex = 0 ; fundIndex > funders.length ; fundIndex ++){
            address funder = funders[fundIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);

        (bool callSuccess, ) = payable(msg.sender).call{value : address(this).balance}("");

        require(callSuccess, "transfer not happend");
    }

    modifier onlyOwner{
        // require(msg.sender == ownerAddress, "only owner can withDrawan");
        if(msg.sender != ownerAddress){revert NotOwner();}
        _;
    }


}