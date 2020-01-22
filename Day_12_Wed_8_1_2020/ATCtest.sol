pragma solidity ^0.5.12;

/// @title A simulator for trees
/// @author Kees Geerligs
/// @notice You can use this contract for only the most basic simulation
/// @dev All function calls are currently implemented without side effects
contract AutomaticTradeContract{
/// @author Kees Geerligs
/// @notice Trade platform for everyone
/// @dev The contract is not complete yet
/// @param amount The value offered against the amount of potatos
/// @param  offerPotatos The amount of potatos offered against a certain value


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
 
  uint public storedData;
  
  constructor() public {
    storedData = 100;
  }
  
  function set(uint x) public {
    storedData = x;
  }
  
  function get() public view returns (uint retVal) {
    return storedData;
  }
  
  function ContractBalance() public returns (uint) { 
      uint balance = ContractBalance();
      require (balance > 0);
      return address(this).balance;
  }
  
  function Transfer(address payable to) public { 
      to.transfer(5 wei);
  }
}