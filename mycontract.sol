// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyToken is ERC721 {

    //NFT合约
    mapping(uint256 => string) private _tokenURIs;

    // Token name
    string private _name;

    // Token symbol
    string private _symbol;

    constructor(
        string memory name_,
        string memory symbol_
    ) ERC721(name_, symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    //铸造NFT
    function mint(address _to, uint256 _tokenId, string calldata _uri) public {
        _mint(_to, _tokenId);
        _setTokenURI(_tokenId, _uri);
    }
    //转移NFT
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public override {
        _transfer(from, to, tokenId);
    }

    //授权NFT
    function approve(address to, uint256 tokenId) public override {
        _approve(to, tokenId);
    }
    //全部授权
    function setApprovalForAll(address owner,address operator, bool _approved)
        public
    {
        _setApprovalForAll(owner,operator, _approved);
    }
    //设置NFT的URI
    function _setTokenURI(uint256 tokenId, string memory uri) internal virtual {
        require(
            _exists(tokenId),
            "ERC721Metadata: URI set of nonexistent token"
        );
        _tokenURIs[tokenId] = uri;
    }
    //以tokenid查询NFT的URI
    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        require(
            _exists(tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );
        string memory _tokenURI = _tokenURIs[tokenId];
        return _tokenURI;
    }
    //查询NFT的拥有者
    function ownerOf(uint256 tokenId) public view override returns (address) {
        return _ownerOf(tokenId);
    }
    //销毁NFT
    function burn(uint256 tokenId) public {
        _burn(tokenId);
    }
    //市场合约
    //匹配订单
    function atomicmatch



    
}
