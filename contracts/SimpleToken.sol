// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract SimpleToken {
  // 初始代幣數目, uint 正整數的型別
  uint INITIAL_SUPPLY = 10000; 

  // 定義一個可以儲存鍵值對(key-value pair)的資料
  mapping(address => uint) balances; 

  constructor() public {
    // 將所有的初始代幣INITIAL_SUPPLY都指定給msg.sender帳戶
    balances[msg.sender] = INITIAL_SUPPLY;
  }

  // 轉帳
  // transfer token for a specified address
  function transfer(address _to, uint _amount) public {
    // 斷帳戶中是否還有足夠轉出的餘額，若存款小於想轉出的數目，就丟出錯誤。
    require(balances[msg.sender] > _amount);
    balances[msg.sender] -= _amount;
    balances[_to] += _amount;
  }

  // 查詢任一帳戶的餘額
  // Gets the balance of the specified address
  function balanceOf(address _owner) public returns (uint) {
    return balances[_owner];
  }
}

/* 
  - truffle console // 測試合約內容
    - 拿到目前用戶 
      - truffle(development)> web3.eth.getAccounts()
      [
        '0x7E541461B5ec6086B449B368D1cDa26cE891e043',
        '0x4DA9a720f065ce9FD95be896A0A437017934F4AD',
        '0x125d9Aa03a6e68c302980d695A46Cb2162c64371',
        '0x740202c9184e43e6Df75AEFa5ECe0E9C56143db5',
        '0xe37D9e82c481bFb283C778D7E01576F90400B207',
        '0x6F5493e8f636CD3e5bEc6bC2ADbD57F44Ff6752B',
        '0x909D7731413E34f149d64cAd03ed57713b5848d1',
        '0xc05817E0B9a212046017543d547df99Ec2E0870c',
        '0xe6Eb3f8688320ccF6ba20Ab441FC16Fcf54F4ec9',
        '0xE55E19e2D49B04164D603F413D76B8a0EBf818c1'
      ]
    - 隨便帶一個用戶測試
      contract.balanceOf.call('0x7E541461B5ec6086B449B368D1cDa26cE891e043')
      BN {
        negative: 0,
        words: [ 10000, <1 empty item> ],
        length: 1,
        red: null
      }
 */

