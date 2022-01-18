const PatientsMan = artifacts.require("PatientsMan");

module.exports = function (deployer) {
  deployer.deploy(PatientsMan);
};
