pragma solidity ^0.4.18;


import './zeppelin/ownership/Ownable.sol';
import './zeppelin/lifecycle/Destructible.sol';
import './RWRDPToken.sol';

contract RWRDPAirdrop is Ownable, Destructible {
    BOBPToken public token;

    function RWRDPAirdrop() public {
        token = new RWRDPToken();
    }

    function airdrop(uint256 amount, address[] who) onlyOwner public returns(bool) {
        for(uint256 i=0; i < who.length; i++){
            assert(token.mint(who[i], amount));
        }
        return true;
    }

    /**
    * @notice Finish Airdrop and transfer ownerhip of the token to Airdrop owner
    */
    function finish() onlyOwner public {
        token.transferOwnership(owner);
    }

}