pragma solidity ^0.5.12;

contract AutomaticTradeContract {
  
  struct OfferInfo {uint amount; uint offerPotatos;}
  
  mapping (address => OfferInfo) public Offers;
  
  function () external payable {
  }
  
  function TradeOffer(uint amount, uint offerPotatos) public {
    Offers[msg.sender].amount = amount;
    Offers[msg.sender].offerPotatos = offerPotatos;
  }
  
  function ContractBalance() public view returns (uint) { 
      uint balance = ContractBalance();
      require (balance > 0);
      return address(this).balance;
  }
  
  function Transfer(address payable to) public { 
      to.transfer(5 wei);
  }
}

