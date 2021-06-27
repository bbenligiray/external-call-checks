const { expect } = require("chai");

describe("External calls", function() {
  it("revert", async function() {
    const ContractB = await ethers.getContractFactory("ContractB");
    const contractB = await ContractB.deploy();

    const ContractA = await ethers.getContractFactory("ContractA");
    const contractA = await ContractA.deploy(contractB.address);

    await expect(contractA.callContractB()).to.be.revertedWith("I always revert");
    await expect(contractA.callContractBInterface()).to.be.revertedWith("I always revert");
    await expect(contractA.callFunctionDirectly()).to.not.be.reverted;
    await expect(contractA.callFunctionDirectlyAndCheckTheReturnValue()).to.be.revertedWith("My call reverted");
  });
});
