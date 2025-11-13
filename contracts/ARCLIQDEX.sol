// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transferFrom(address, address, uint256) external returns (bool);
    function transfer(address, uint256) external returns (bool);
    function balanceOf(address) external view returns (uint256);
}

contract ARCLIQDEX {
    IERC20 public ARLIQ;
    IERC20 public USDC;

    constructor(address _ARLIQ, address _USDC) {
        ARLIQ = IERC20(_ARLIQ);
        USDC = IERC20(_USDC);
    }

    function addLiquidity(uint amountARLIQ, uint amountUSDC) external {
        ARLIQ.transferFrom(msg.sender, address(this), amountARLIQ);
        USDC.transferFrom(msg.sender, address(this), amountUSDC);
    }

    function swapARLIQtoUSDC(uint amountIn) external {
        uint reserveA = ARLIQ.balanceOf(address(this));
        uint reserveB = USDC.balanceOf(address(this));

        uint amountOut = (amountIn * reserveB) / (reserveA + amountIn);

        ARLIQ.transferFrom(msg.sender, address(this), amountIn);
        USDC.transfer(msg.sender, amountOut);
    }

    function swapUSDCtoARLIQ(uint amountIn) external {
        uint reserveA = ARLIQ.balanceOf(address(this));
        uint reserveB = USDC.balanceOf(address(this));

        uint amountOut = (amountIn * reserveA) / (reserveB + amountIn);

        USDC.transferFrom(msg.sender, address(this), amountIn);
        ARLIQ.transfer(msg.sender, amountOut);
    }
}
