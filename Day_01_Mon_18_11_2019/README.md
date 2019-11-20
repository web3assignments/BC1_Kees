### Day_01_Mon_18_11_2019 
Place the assignments in this subdirectory   

pragma solidity ^0.5.12;

contract AutomaticTradeContract {
  
  mapping (address => uint) public Offers;
  
  function TradeOffer(uint amount, string memory offerPotatos) public {
    Offers[msg.sender] = amount;
  }
}
