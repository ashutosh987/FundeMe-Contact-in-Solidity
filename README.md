# FundeMe-Contact-in-Solidity

I have written FundMe smart contract in solidity.

In this contract , any one can donate ethers and only the owner of contract can withdraw all the ethers.

## Key features of FundMe contract

**Function fundMe()** - which is public and payable , also it comes with minimum threshold 50 USD. So, User have to donate atleast this much amount.
**Function withDrawable()** - which is public but only called by owner of contract, for owner check I have used modifier which check msg.sender should be equal to owner address.

## I have also written PriceConvertor contract

As I have mentioned earlier , FundMe() has min. threshold of 50 USD. So as we have threshold in USD and the caller will pay in ethers, therefore we will need the PriceConvertor.
**ChainLink/Contract** Chainlink is a decentralized oracle network that enables smart contracts on blockchain platforms to securely and reliably interact with real-world data and external APIs. An oracle, in the context of blockchain, is a trusted source of off-chain data that can be accessed by smart contracts.

So we have used imported chainLink for data request and convert ethers to USD for checking threshold.

Note : you can be confused when seeing multiple with 1e18 or 1e10. Pls go through chainLink doc to know more.
![Smart Contract](https://e7.pngegg.com/pngimages/93/538/png-clipart-smart-contract-computer-icons-ethereum-solidity-symbol-miscellaneous-angle.png)


