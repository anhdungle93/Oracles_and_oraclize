contract CoinFlipOracle is usingOraclize {
  
  string public result;
  bytes32 public oraclizeID;

  function flipCoin() public payable {
    oraclizeID = oraclize_query("WolframAlpha", "flip a coin");
  }

  function __callback(bytes32 _oracleID, string _result) public {
    require(msg.sender == oraclize_sbAddress(), "you are not an oracle")
    result = _result;
  }
}