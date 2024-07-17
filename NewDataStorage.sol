// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NewDataStorage {
    // Array to store the data
    string[] private dataArray;
    
    // Mapping to store data by transaction hash
    mapping(bytes32 => string) private dataByTxHash;

    // Event to be emitted when new data is added
    event DataAdded(string data, bytes32 txHash);

    // Function to add data to the array and map it by transaction hash
    function addData(string[] memory newData) public {
        for (uint256 i = 0; i < newData.length; i++) {
            dataArray.push(newData[i]);
            bytes32 txHash = keccak256(abi.encodePacked(msg.sender, block.timestamp, newData[i]));
            dataByTxHash[txHash] = newData[i];
            emit DataAdded(newData[i], txHash);
        }
    }

    // Function to retrieve data from the array by index
    function getData(uint256 index) public view returns (string memory) {
        require(index < dataArray.length, "Index out of bounds");
        return dataArray[index];
    }

    // Function to retrieve data by transaction hash
    function getDataByTxHash(bytes32 txHash) public view returns (string memory) {
        string memory data = dataByTxHash[txHash];
        require(bytes(data).length > 0, "Data not found for the given transaction hash.");
        return data;
    }

    // Function to retrieve all data from the array
    function getAllData() public view returns (string[] memory) {
        return dataArray;
    }
}


