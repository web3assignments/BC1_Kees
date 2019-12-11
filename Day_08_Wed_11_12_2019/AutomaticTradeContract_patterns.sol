pragma solidity ^0.5.12;

import "github.com/provable-things/ethereum-api/provableAPI.sol";


contract AutomaticTradeContract is usingProvable{
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


//------------------------------------------------------------------------------------------------------------------
  /*
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
 */
//------------------------------------------------------------------------------------------------------------------ 
 

string public name="Initial";

    function SetName(string memory NewName) public {
        name = NewName;
    }
    function destroy() public {
        selfdestruct(msg.sender);
    }
    function destroyAndSend(address payable recipient) public {
        
        selfdestruct(recipient);
    }
}

contract Factory {
    bytes mmcode= type(AutomaticTradeContract).creationCode;
    AutomaticTradeContract public deployedMortal;

    function NameDeployedMortal() public view returns (string memory) {
        return deployedMortal.name();
    }
    function DestroyDeployedMortal() public {
        deployedMortal.destroy();
    }
    function DeployViaCreate() public returns (AutomaticTradeContract){
        deployedMortal=AutomaticTradeContract(Create(mmcode));
        deployedMortal.SetName("Created via create");
        return deployedMortal;
    }
    function Create(bytes memory code) private returns(address addr) {   
        assembly {
            addr := create(0, add(code, 0x20), mload(code))
            if iszero(extcodesize(addr)) { revert(0, 0) }
        }
    }
    function DeployViaCreate2() public returns (AutomaticTradeContract){
        deployedMortal=AutomaticTradeContract(Create2(mmcode,0x00));
        deployedMortal.SetName("Created via create2");
        return deployedMortal;
    }
    function Create2(bytes memory code, bytes32 salt) 
        private returns(address addr) {
        assembly {
            addr := create2(0, add(code, 0x20), mload(code), salt)
            if iszero(extcodesize(addr)) { revert(0, 0) }
        }
    }
}