// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NewDataStorage {
    // Array to store the data
    string[] private dataArray;

    // Event to be emitted when new data is added
    event DataAdded(string data);

    // Function to add data to the array
    function addData(string memory newData) public {
        dataArray.push(newData);
        emit DataAdded(newData);
    }

    // Function to retrieve data from the array by index
    function getData(uint index) public view returns (string memory) {
        require(index < dataArray.length, "Index out of bounds");
        return dataArray[index];
    }

    // Function to retrieve all data from the array
    function getAllData() public view returns (string[] memory) {
        return dataArray;
    }
}
