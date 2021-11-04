pragma solidity >=0.6.6;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BonusToken is ERC20 {
    address public admin;
    address public liquidator;

    constructor() ERC20("WOLFGANG", "WLFG") {
        admin = msg.sender;
    }
    function setLiquidator(address _liquidator) external {
        require(msg.sender == admin, "Only admin can set the liquidator");
        liquidator = _liquidator;
        admin = liquidator;
    }

    function mint(address to, uint amount) external {
        require(msg.sender == admin, "Only liquidator can mint");
        _mint(to, amount);
    }
}
