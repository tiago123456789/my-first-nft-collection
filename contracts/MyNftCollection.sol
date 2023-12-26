// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyNftCollection is ERC721URIStorage {

    address private _owner; 

    constructor() ERC721("My first NFT collection", "MFNC") {
        _owner = msg.sender;
    }

    function mint(
        address _to,
        uint256 _tokenId,
        string calldata _uri
    ) external onlyOwner {
        _mint(_to, _tokenId);
        _setTokenURI(_tokenId, _uri);
    }

    function _checkOwner() internal view virtual {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
    }

    modifier onlyOwner() {
        _checkOwner();
        _;
    }

}