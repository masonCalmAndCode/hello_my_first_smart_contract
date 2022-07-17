// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// 讀入zeppelin-solidity提供的StandardToken合約
import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

// is 繼承了StandardToken合約
contract HelloToken is StandardToken{
  string public name = "HelloCoin";
  string public symbol = "H@"; // 代幣的代號
  uint8 public decimals = 2; // 最小分割單位
  uint256 public INITIAL_SUPPLY = 100000; // 初始代幣數目

  constructor() public {
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
  }

}
