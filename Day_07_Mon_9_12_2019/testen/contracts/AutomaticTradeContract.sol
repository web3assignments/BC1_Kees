pragma solidity ^0.5.12;

import "./provableAPI.sol";

contract AutomaticTradeContract is usingProvable {
   string  public alarm;
   uint256 public priceOfUrl;
   constructor() public payable {}

   function __callback(bytes32 myid, string memory result ) public {
       if (msg.sender != provable_cbAddress()) revert();
       alarm = result;
   }

   function GetAlarm() public payable {
       priceOfUrl = provable_getPrice("URL");
       require (address(this).balance >= priceOfUrl,
            "please add some ETH to cover for the query fee");
       provable_query("URL", 
            "json(http://weerlive.nl/api/json-data-10min.php?key=demo&locatie=Amsterdam).liveweer[0].alarm");
   }


  
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
  
  function Transfer(address payable to) public { 
      to.transfer(5 wei);
  }
}
