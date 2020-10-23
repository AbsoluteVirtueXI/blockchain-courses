// SPDX-License-Identifier: MIT                 r
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

contract Contact {
  struct Info {
    string name;
    uint8 age;
    string email;
    string phone;
  }

  mapping(address => Info) private _contacts;

  constructor() public {
    _contacts[0x57D401B8502bC5CBBaAfD2564236dE4571165051] = Info(
      'Alice',
      25,
      'alice@mail.com',
      '123123'
    );
  }

  function getContact(address _addr) public view returns (Info memory) {
    return _contacts[_addr];
  }

  function setContact(
    address _addr,
    string memory _name,
    uint8 _age,
    string memory _email,
    string memory _phone
  ) public {
    _contacts[_addr] = Info(_name, _age, _email, _phone);
  }
}
