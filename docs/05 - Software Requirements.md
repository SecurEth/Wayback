# Software Requirements

1# Software Requirements
This document contains the software requirements for the Wayback.sol smartcontracts

1. The Wayback contract shall allow the creation and addition of records on the blockchain

- The front shall transmit a Product ID and a hash to the meta data for each record to be added
- If no owner address is associated with the Product ID then the sender address shall be associated with the Product ID
- Only the owner of the Product ID shall be able to add records or a error with revert shall occur
- The record shall contain the Product ID and a hash to the meta data
- The record shall be formatted as an event
- The wayback contract shall optionally allow a record to be signed by a third party
- In these cases, the front end shall supply the ethereum address of the entity that will sign
- In these cases, the Wayback contract shall store the ethereum address of the entity with the record with the Product ID and the hash to the meta data
- The Wayback contract shall allow third parties that are associated with a Product ID record to sign a record
- The signed contract shall be a standard Product ID and the hash to the meta data of that contract that is written by the signer
