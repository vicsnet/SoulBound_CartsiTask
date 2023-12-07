// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import 'lib/openzeppelin-contracts/contracts/token/ERC1155/ERC1155.sol';

contract SoulBound is ERC1155{
address owner;

uint256 AllowTransfer = 1;
uint256 DontTransfer = 2;

mapping (address=>uint256) myToken;

constructor()ERC1155(""){
owner = msg.sender;
}

/**
* @notice Token are required to be claimed by all user before they can mint token, receive token or transfer token 
 */
function claimToken(uint256 _myToken) public returns(uint256){

        myToken[msg.sender] = _myToken;
        return _myToken;

}
/**
*@notice function to set the uri
 */
function setURI(string memory _uri) external{
        _setURI(_uri);
}

/**
@notice function to mint token
 */
function mintToken() public{
        require(myToken[msg.sender] == 0, 'GO_AND_CLAIM_TOKEN');
        uint256 id = myToken[msg.sender];
        uint256 value;
         if (id % 2 == 0) {
            value= 1e18;
        } else {
            value = 1e27;
        }
        _mint(msg.sender, id , value, '');
}
 
/**
@notice The original safeTraansfer From was overriten
*/ 
     function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        uint256 amount,
        bytes memory data
    ) public override {
        revert();
        // super.safeTransferFrom(from, to, id, amount, data);
    }

/**
*@notice function to transfer token
* @dev only token with divisible ID by 2 can transfer Token
*/
  function transfer(address to) external  {
        require(myToken[msg.sender] == 0, 'GO_AND_CLAIM_TOKEN');
        require(myToken[to] ==0, 'NO_TOKEN_CLAIMED_BY_USER_YET');
          uint256 id = myToken[msg.sender];
          require(id %2 == 0, 'YOU_CAN_NOT_TRANSFER');
          require(myToken[to] %2 == 0, 'YOU_CAN_NOT_TRANSFER_TO_THE_ADDRESS');

     
           _safeTransferFrom(msg.sender, to, id, 1e18, '');
   
    }
}