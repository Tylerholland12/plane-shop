pragma solidity ^0.5.0;

contract Buying {

    address[16] public buyers;



    // buying a pet
    function buy(uint petId) public returns (uint) {
      require(petId >= 0 && petId <= 15);
    
      buyers[petId] = msg.sender;
    
      return petId;
    }
    
    // Retrieving the buyers
    function getBuyers() public view returns (address[16] memory) {
      return buyers;
    }
}
