# @pragma evm-version cancun
# @pragma version >0.3.10

name: public(String[32])
symbol: public(String[32])
decimals: public(uint8)
balanceOf: public(HashMap[address, uint256])
allowance: public(HashMap[address, HashMap[address, uint256]])
totalSupply: public(uint256)
feeRate: public(uint256)
hasFee: public(bool)

@external
def __init__():
    init_supply: uint256 = 21000000000 * 10 ** 18
    self.name = "Trump Harris Debate"
    self.symbol = "THD"
    self.decimals = 18
    self.balanceOf[msg.sender] = init_supply
    self.totalSupply = init_supply
   


@external
def approve(_spender : address, _value : uint256) -> bool:
    """
    @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
         Beware that changing an allowance with this method brings the risk that someone may use both the old
         and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
         race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
         https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
    @param _spender The address which will spend the funds.
    @param _value The amount of tokens to be spent.
    """
    self.allowance[msg.sender][_spender] = _value
    return True