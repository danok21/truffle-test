// migrations/2_deploy.js
const FooBarToken = artifacts.require('FoobarToken'); // Contract name

module.exports = async function(deployer) {
    await deployer.deploy(FooBarToken, "0x429ebD9365061DaBb853de89c134F9b79468a952");
};