// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NewDataStorage {
    // Array to store the data
    string[] private dataArray;

    // Event to be emitted when new data is added
    event DataAdded(string data);

    // Function to add data to the array
    function addData(string[] memory newData) public {
        for (uint i = 0; i < newData.length ; i++) {
            dataArray.push(newData[i]);
            emit DataAdded(newData[i]);
        }
        // dataArray.push(newData);
        // emit DataAdded(newData);
    }

    // function addData(string[] memory _data) public {
    //     for (uint i = 0; i < _data.length; i++) {
    //         dataStorage.push(_data[i]);
    //     }
    // }

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
