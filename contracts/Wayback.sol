pragma solidity ^0.4.24;

contract Wayback {

    mapping(bytes32 => address) projectToOwner;
    mapping(bytes32 => address) eventTxHashToApproved;

    event ActionWriteEvent(bytes32 projectId, bytes32 metaData);
    event ActionWriteApprove(bytes32 projectId, bytes32 metaData);
    event ActionSign(bytes32 projectId, bytes32 metaData);

    event Log(string message);

    function writeEvent(
        bytes32 projectId,
        bytes32 metaData
    )
    external
    {
        if (projectToOwner[projectId] == 0x0) {
            projectToOwner[projectId] = msg.sender;
        }
//        emit Log("Not owner");
        require(projectToOwner[projectId] == msg.sender);
        emit ActionWriteEvent(projectId, metaData);
    }

    function writeAndApprove(
        bytes32 projectId,
        bytes32 metaData,
        bytes32 eventTxHash,
        address thirdParty
    )
    external
    {
        require(projectToOwner[projectId] == msg.sender);
        eventTxHashToApproved[eventTxHash] = thirdParty;
        emit ActionWriteApprove(projectId, metaData);
    }
    
    function sign(
        bytes32 projectId,
        bytes32 metaData,
        bytes32 eventTxHash
    )
    external
    {
        require(eventTxHashToApproved[eventTxHash] == msg.sender,"NotOwner");
        emit ActionSign(projectId, metaData);
    }
}
