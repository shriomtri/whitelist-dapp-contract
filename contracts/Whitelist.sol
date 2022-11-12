//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {

  // Max number of whitelisted addresses allowed
  uint8 public maxWhitelistedAddresses;

  // Create a mapping of whitelistedAddresses
  //if an address is whitelisted, we would set it to true, it is false by default for all other addresses
  mapping(address => bool) public whitelistedAddress;

  // numAddressesWhitelisted would be used to keep track of how man address have we been whitelisetd
  // NOTE: Don't change this variable name, as it will be part of verification
  uint8 public numAddressesWhitelisted;

  // Setting the Max number of whitelisted addresses
  // User will put the value at the time of deployment
  constructor(uint8 _maxWhitelistedAddresses) {
    maxWhitelistedAddresses = _maxWhitelistedAddresses;
  }

  /**
   * addAddressToWhitelist - This function adds the address of the sender to the whitelist
  */
  function addAddressToWhitelist() public {
     // check if the user has already been whitelisted
     require(!whitelistedAddress[msg.sender], "Sender has already been whitelisted");
     // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error
     require(numAddressesWhitelisted < maxWhitelistedAddresses, "More address cant be added, limit reached");
      // Add the address which called the fhunction to the whitelistedAddress array
      whitelistedAddress[msg.sender] = true;
      // Increase the number of whitelisetd addresses
      numAddressesWhitelisted += 1;
  } 

}