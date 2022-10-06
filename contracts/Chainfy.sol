// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";

// NatSpec
/** @title A contract for notarize the certification in blockchain
 * @author Enrico Gava
 * @notice It stores the digest and IPFS CID of every certification 
 * @dev It is very easy, it is developed according to a project of a Startup 
 * that wants to create a platform for the Small-Medium Enterprises enabling them to interact with
 * the blockchain notarizing all the quality certificates of their products
 * in a simple and economic way. Obviously it's not for the supply chain tracking
 */ 

contract Chainfy is Ownable {
    string public contractName = "CryptoInnova";
    mapping(address => bool) public allowedAccounts;
    address[] public allAllowedAccounts;
    struct Product {
        string productName;
        uint productCode;
        string[] productDigests;
        string[] productCIDs;
    }

    //Product[] Products;
    mapping(string => Product) Products;
    mapping(string => bool) Existence;
    string[] productNameList;

    event newProduct(string name, uint code, string digest, string cid);
    event addInfo(string name, uint code, string digest, string cid);

    modifier authorizedAccounts() {
        require(checkAllowed(msg.sender), "l'utente non ha il permesso");
        _;
    }

    constructor(string memory _contractName) {
        contractName = _contractName;
        addAllowed(msg.sender);
    }

    // constructor() {
    //     contractName = "CryptoInnova";
    //     addAllowed(msg.sender);
    // }

    function setContractName(string memory _contractName)
        public
        authorizedAccounts
    {
        contractName = _contractName;
    }

    function getContractName() public view returns (string memory) {
        return contractName;
    }

    function addAllowed(address _newAllowed) public onlyOwner {
        require(
            !allowedAccounts[_newAllowed],
            "Account gia presente tra quelli autorizzati!"
        );
        allowedAccounts[_newAllowed] = true;
        allAllowedAccounts.push(_newAllowed);
    }

    function removeAllowed(address _removeAllowed) public onlyOwner {
        require(
            allowedAccounts[_removeAllowed],
            "Account gia privo di autorizzazione!"
        );
        allowedAccounts[_removeAllowed] = false;
        uint length = allAllowedAccounts.length;
        for (uint i; i <= length; i++) {
            if (allAllowedAccounts[i] == _removeAllowed) {
                allAllowedAccounts[i] = allAllowedAccounts[length - 1];
                allAllowedAccounts.pop();
                break;
            }
        }
    }

    function showAllowed()
        public
        view
        returns (address[] memory _allAllowedAccounts)
    {
        return allAllowedAccounts;
    }

    function checkAllowed(address _allowed)
        internal
        view
        returns (bool _check)
    {
        if (allowedAccounts[_allowed]) {
            return true;
        }
    }


    /**
     * @notice this function is to add product
     * @dev it add from zero
     * @param _productName, _productCode, _productDigest, _productCID,
     */ 
    function addProduct(
        string memory _productName,
        uint _productCode,
        string memory _productDigest,
        string memory _productCID
    ) public authorizedAccounts {
        require(!productExists(_productName), "nome prodotto gia in lista!");
        Existence[_productName] = true;
        Products[_productName].productName = _productName;
        Products[_productName].productCode = _productCode;
        Products[_productName].productDigests.push(_productDigest);
        Products[_productName].productCIDs.push(_productCID);

        productNameList.push(_productName);
        emit newProduct(
            _productName,
            _productCode,
            _productDigest,
            _productCID
        );
    }

    function checkProduct(string memory _name)
        public
        view
        returns (
            string memory _productName,
            uint _productCode,
            string[] memory _productDigests,
            string[] memory _productCIDs
        )
    {
        require(productExists(_name), "nome prodotto errato o non in lista!");
        return (
            Products[_name].productName,
            Products[_name].productCode,
            Products[_name].productDigests,
            Products[_name].productCIDs
        );
    }

    function addProductInfo(
        string memory _name,
        string memory _digest,
        string memory _cid
    ) public authorizedAccounts {
        require(productExists(_name), "nome prodotto errato o non in lista!");
        Products[_name].productDigests.push(_digest);
        Products[_name].productCIDs.push(_cid);
        emit addInfo(_name, Products[_name].productCode, _digest, _cid);
    }

    function showProductsByName()
        public
        view
        returns (string[] memory _allProducts)
    {
        return productNameList;
    }

    function productExists(string memory _productName)
        internal
        view
        returns (bool _exists)
    {
        if (Existence[_productName]) {
            return true;
        }
    }
}
