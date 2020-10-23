// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract MapToMap {
  mapping(string => mapping(string => string)) private _earth;

  constructor() public {
    _earth['Europe']['France'] = 'Paris';
    _earth['Afrique']['Algerie'] = 'Alger';
  }

  function getCity(string memory continent, string memory pays)
    public
    view
    returns (string memory)
  {
    return _earth[continent][pays];
  }

  function setCity(
    string memory continent,
    string memory pays,
    string memory city
  ) public {
    _earth[continent][pays] = city;
  }
}
