pragma solidity >=0.7.0 <0.9.0;

contract kyc{
    address admin;

    struct Customer{
        uint rwaoId;
        string name;
        address add;
        bool status;
        uint exist;
    }

    mapping(uint256 => Customer) private idToCustomer;


    constructor() public {
        admin = msg.sender;
    }

    function addRWAO(uint rwaoId,string memory name, address add) public {
        require(idToCustomer[rwaoId].exist != 1, "rwao id already exist");
        idToCustomer[rwaoId] =  Customer(
        rwaoId,
        name,
        add,
        false,
        1
      );
    }

    function checkStatus(uint rwaoId) view public returns (bool){
        require(idToCustomer[rwaoId].exist == 1, "rwao id does not exist");
        return (idToCustomer[rwaoId].status);
    }

    function updateStatus(uint rwaoId, bool _status) public {
        require(idToCustomer[rwaoId].exist == 1, "rwao id does not exist");
        idToCustomer[rwaoId].status = _status;
    }

    function getRwao(uint rwaoId) view public returns(string memory name, address add){
        require(idToCustomer[rwaoId].exist == 1, "rwao id does not exist");
        return (idToCustomer[rwaoId].name, idToCustomer[rwaoId].add);
    }

    
}


