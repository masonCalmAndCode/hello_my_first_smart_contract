var HelloWorld = artifacts.require("HelloWorld"); // 取得準備部署的合約

module.exports = function(deployer) {
  deployer.deploy(HelloWorld);
};


// migration檔案會依照檔案的編號來執行。例如2_就會在1_之後執行