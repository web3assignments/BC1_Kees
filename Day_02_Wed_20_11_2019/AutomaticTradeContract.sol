pragma solidity ^0.5.12;

contract AutomaticTradeContract {
  
  mapping (address => uint) public Offers;
  
  function () external payable {
  }
  
  function TradeOffer(uint amount, string memory offerPotatos) public {
    Offers[msg.sender] = amount;
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

