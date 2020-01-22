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
  address owner = msg.sender;

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  event Log(string message, uint amount, uint offerPotatos);
  event Log(uint tradeCounter);

  uint tradeCounter = 0;
  
  struct offerInfo {uint amount; uint offerPotatos; uint status; address offerTaker;}
  
  mapping (uint => offerInfo) public offers;
  
  
  function () external payable {
  }
  
  function tradeOffer(uint amount, uint offerPotatos) public returns(uint){
    offers[tradeCounter].amount = amount;
    offers[tradeCounter].offerPotatos = offerPotatos;
    offers[tradeCounter].status = 1;
    emit Log("Trade agreemant", amount, offerPotatos);
    emit Log(tradeCounter);
    tradeCounter ++;
    return (tradeCounter-1);
  }

  function contractBalance() public returns (uint) { 
      uint balance = contractBalance();
      require (balance > 0);
      return address(this).balance;
  }
  
  function transfer(address payable to) public { 
      to.transfer(5 wei);
      require(msg.sender == owner);
  }
  
  function returnTradeOffer(uint _tradeCounter)public view returns (uint amount, uint offerPotatos, uint status, address offerTaker) {
        return (offers[_tradeCounter].amount, offers[_tradeCounter].offerPotatos, offers[_tradeCounter].status, offers[_tradeCounter].offerTaker);
  }
  function takeOffer(uint _tradeCounter) public {
      offers[_tradeCounter].offerTaker = msg.sender;
      offers[_tradeCounter].status = 0;
  }
}