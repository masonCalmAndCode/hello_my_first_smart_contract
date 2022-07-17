// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0; // 目前使用的solidity版本，不同版本的solidity可能會編譯出不同的bytecode

//宣告contract後即內建了開發智能合約所需的功能。也可以把這句理解為 class HelloWorld extends Contract
contract HelloWorld {
  constructor() public {
  }
    // 如果有輸入、輸出值，都必須定義型別
   function sayHello() public returns (string memory) { 
        return ("Hello World");
    }

  function echo(string memory name) public returns (string memory) {
    return name;
  }
}


/* 
  開啟專案前的環境準備：
    - npm install -g truffle ganache-cli
    - ganache-cli  命令來啟動乙太坊測試環境
      - truffle-config.js 裡的 network port 號要填對，連接成功後在 truffle migrate 就可以看到對應
      - https://trufflesuite.com/tutorial/
      - 
    - npm uninstall -g truffle // 要先反安裝
    - npm install -g truffle
  truffle CLI 指令：
    - truffle init // 建立專案
    - truffle create contract [HelloWorld] // 建立新合約
    - truffle version // 查詢 truffle 與 solidity 版本
    - truffle compile // 將 solidity 原始碼編譯成Ethereum bytecode, may need to add sudo permissions
        - [why need to add sudo permissions] (https://ethereum.stackexchange.com/questions/115377/error-with-truffle-compile-could-not-find-a-compiler-version-matching)
    - truffle migrate // 將合約部署到 ganache 中
    - truffle publish // 將 solidity  
    - truffle console // 測試合約內容
        > let contract
        > HelloWorld.deployed().then(instance => contract = instance)
        > contract.sayHello.call()
        'Hello World'
        > contract.echo.call("I love U")
        'I love U'

  note: Solidity 中定義好型別後，並不能隨時更改之後要儲存的型別
 */