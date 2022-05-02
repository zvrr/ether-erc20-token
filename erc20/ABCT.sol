pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token//ERC20/ERC20.sol";


contract Token is ERC20 {
    string public token_name = "ABC Coin";
    string public token_ticker = "ABCT";

    constructor () ERC20(token_name, token_ticker) {
        _mint(msg.sender, 10000000000 * (10 ** uint256(decimals())));
    }
}