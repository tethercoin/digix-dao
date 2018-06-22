pragma solidity ^0.4.19;

contract MockDaoFundingManager {
  uint256 public ethInDao;
  address public oldFundingManager;

  function MockDaoFundingManager(address _oldFundingManager) public {
    oldFundingManager = _oldFundingManager;
  }

  function () payable public {
    require(msg.value > 0);
    require(msg.sender == oldFundingManager);
  }

  function updateEthInDao() public {
    ethInDao = address(this).balance;
  }

  function manuallyFundDao() payable public {
    require(msg.value > 0);
    ethInDao += msg.value;
  }
}
