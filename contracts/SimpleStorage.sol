// We want an SPDX license identifier thing, this is an open one
// SPDX-License-Identifier: MIT

// First thing we always need in solidity is the solidity verison
// Note could also just be a number for a specific version (eg. 0.6.0)
// Also could be (^0.6.0) meaning any version of 0.6
pragma solidity >=0.6.0 <0.9.0;

// Define our contract - contract is a keyword (similar to a class)
contract SimpleStorage {
    // Solidity types: uint8, int256, bool, string, address (eth address), bytes
    
    // Public defines visibility of variable or function, (external, public, internal, private)
    // External means only external contracts, internal for only this or derived contracts (default)
    // Private for only this contract (not derived)
    uint256 current_number = 5;


    struct People {
        uint256 current_number;
        string name;
    }

    // Could create one person as such:
    // People public person = People({current_number: 1, name: "One"});

    // No number means dynamic size, number in [] gives a limit
    People[] public people;

    // Here we are having a map from name to num
    mapping(string => uint256) public nameToNumber;

    // Define funciton with keyword
    function store(uint256 _current_number) public returns(uint256){
        current_number = _current_number;
        return _current_number;
    }

    // view and pure
    // view means we want to read state off the blockchain, we're not making a state change so no transaction. public variables are view functions
    // pure functions 'purely' do some maths, but NOT saving state;

    // We can have a function which retuns something
    function retrieve() public view returns(uint256) {
        return current_number;
    }

    // Two ways to store information: memory or storage
    // memory: only stored during execution of function or contract call
    // Storage: data will persist after function finishes executing
    // Here, string is an object, but only needed during execution so memory
    function addPerson(string memory _name, uint256 _current_number) public {
        people.push(People({current_number: _current_number, name: _name}));
        nameToNumber[_name] = _current_number;
    }
}
