pragma solidity ^0.5.12;

import "github.com/OpenZeppelin/zeppelin-solidity/contracts/ownership/Ownable.sol";

contract AutomaticTradeContract is Ownable {
  constructor() public payable {}

  event Log(string message, uint amount, uint offerPotatos);
  
  struct OfferInfo {uint amount; uint offerPotatos;}
  
  mapping (address => OfferInfo) public Offers;
  
  function () external payable {
  }
  
  function TradeOffer(uint amount, uint offerPotatos) public {
    Offers[msg.sender].amount = amount;
    Offers[msg.sender].offerPotatos = offerPotatos;
    emit Log("Trade agreemant", amount, offerPotatos);
  }
  
  function ContractBalance() public view returns (uint) { 
      uint balance = ContractBalance();
      require (balance > 0);
      return address(this).balance;
  }
  
  function Transfer(address payable to) public onlyOwner { 
      to.transfer(5 wei);
  }
}