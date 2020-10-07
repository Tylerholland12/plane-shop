pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Buying.sol";

contract TestBuying {
 // The address of the buying contract to be tested
 Buying buying = Buying(DeployedAddresses.Buying());

 // The id of the pet that will be used for testing
 uint expectedPetId = 8;

 //The expected owner of bought pet is this contract
 address expectedBuyer = address(this);

    // Testing the buy() function
    function testUserCanBuyPet() public {
      uint returnedId = buying.buy(expectedPetId);

      Assert.equal(returnedId, expectedPetId, "Buying of the expected pet should match what is returned.");
    }

    // Testing retrieval of a single pet's owner
    function testGetBuyerAddressByPetId() public {
      address buyer = Buying.buyers(expectedPetId);

      Assert.equal(buyer, expectedBuyer, "Owner of the expected pet should be this contract");
    }

    // Testing retrieval of all pet owners
    function testGetBuyerAddressByPetIdInArray() public {
      // Store buyers in memory rather than contract's storage
      address[16] memory buyers = buying.getBuyers();

      Assert.equal(buyers[expectedPetId], expectedBuyer, "Owner of the expected pet should be this contract");
    }

}
