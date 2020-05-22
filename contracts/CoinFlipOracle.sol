pragma solidity > 0.6.1 < 0.7.0;

import "./provableAPI_0.6.sol";
contract CoinFlipOracle is usingProvable {
  
  string public result;
  bytes32 public provableID;

  function flipCoin() public payable {
    provableID = provable_query("WolframAlpha", "flip a coin");
  }

  function __callback(bytes32 _provableID, string memory _result) override public {
    require(msg.sender == provable_cbAddress(), "you are not an oracle");
    result = _result;
  }
}