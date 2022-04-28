pragma solidity >=0.7.0 <0.9.0;

contract kyc{
    address admin;

    struct Customer{
        uint rwaoId;
        string name;
        address add;
        bool status;
    }

    mapping(uint256 => Customer) private idToCustomer;


    constructor() public {
        admin = msg.sender;
    }

    function addRWAO(uint rwaoId,string memory name, address add) public {
        idToCustomer[rwaoId] =  Customer(
        rwaoId,
        name,
        add,
        false
      );
    }

    function checkStatus(uint rwaoId) view public returns (bool){
        return (idToCustomer[rwaoId].status);
    }

    function updateStatus(uint rwaoId, bool _status) public {
        idToCustomer[rwaoId].status = _status;
    }

    function getRwao(uint rwaoId) view public returns(string memory name, address add){
        return (idToCustomer[rwaoId].name, idToCustomer[rwaoId].add);
    }

    
}


