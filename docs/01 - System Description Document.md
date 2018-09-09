# System Description Document

The idea is to communicate smart contract security to the general public by creating a browsable history of the steps of the development of a smart contract. This will create incentives for a developer to use security practices early on.

## Actors

### Smart contract developers
Developers can create records and request third-party reviewers to sign specific events. Developers decided what metadata is attached to an event.

### Third party reviewers
Reviewers choose to sign or not sign events that they were requested (approved) to sign by developers. They put their brand reputation behind a statement made by the metadata since it will be visible on the blockchain. The metadata can be a hash of some private information that can be later revealed to a select party for investigative purposes.

### Consumers
Consumers will be the general public. They will access the data either directly through the web app, browser extensions, third-party aggregators or integrations in wallets or other services.

## The record

A record will consist of a metadata hash (that can be used to retrieve the actual data), timestamp, an ID and an optional third-party signature. It is an immutable entry made by a developer for each step of the development of a smart contract. Steps can include:
- deployment to mainnet
- audit for mainnet deployment
- deployment to testnet
- audit for testnet deployment
- started a bounty program
- paid out a bounty on the program
- initial software assessment
- code review complete
- incident occurred
- incident response took place
- upgrade occurred

## Business Incentives

This information has many potential benefits:
- Supplies data to determine a level of trust for a contract
- Allows investigation of the quality process used in the contract development
- Supplies data to determine the reputation of auditors and developers
- Incentivizes developer for think about security early

Auditor or reviewers will sign metadata only if they are comfortable with its statements and this can be a part of the audit package.
Third party services will want to use the data for their core features or just for improved user experience  (e.g. a wallet, an aggregator service, a reputation system, Panvala etc.)

## Producs

### Web Tracker
There will be a web UI that will allow:
Developers to manage events
Third parties to sign events they were approved to sign
General public to search a product and see the history of events

### Library
There will be a Javascript, iOS and Android library that will allow easy consumption of the metadata information.

