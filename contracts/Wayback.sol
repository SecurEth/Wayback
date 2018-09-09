pragma solidity ^0.4.24;

contract Wayback {

    mapping(bytes32 => address) projectToOwner;
    mapping(bytes32 => address) SignerAddress;

    event ActionAddRecord(bytes32 projectId, bytes32 metaData);
    event ActionAddRecordAndApprove(bytes32 projectId, bytes32 metaData);
    event ActionSignRecord(bytes32 projectId, bytes32 metaData);

    event Log(string message);

    function AddRecord(
        bytes32 projectId,
        bytes32 metaData
    )
    external
    {
        if (projectToOwner[projectId] == 0x0) {
            projectToOwner[projectId] = msg.sender;
        }
        require(projectToOwner[projectId] == msg.sender);
        emit ActionAddRecord(projectId, metaData);
    }

    function AddRecordAndApprove(
        bytes32 projectId,
        bytes32 metaData,
        bytes32 eventTxHash,
        address thirdParty
    )
    external
    {
        require(projectToOwner[projectId] == msg.sender);
        SignerAddress[eventTxHash] = thirdParty;
        emit ActionAddRecordAndApprove(projectId, metaData);
    }
    
    function SignRecord(
        bytes32 projectId,
        bytes32 metaData,
        bytes32 eventTxHash
    )
    external
    {
        require(SignerAddress[eventTxHash] == msg.sender,"NotOwner");
        emit ActionSignRecord(projectId, metaData);
    }
}
