# Architecture

## R&D

Problem: How do we pick a product id so that products are searchable by name or keywords?
- Option 1: Use plaintext names
- Option 2: Use a random id and an external resolver contract
- Solution: Go with option 1 for simplicity
Problem: How to search metadata?
- Since metadata is stored off-chain it needs to be searchable off-chain
- Solution: Store metadata in a MongoDB and reference it by its hash
Problem: How to tie the product id to the real product in a reliable way?
- Option 1: Pick a plaintext name same as the real product name and verify its developer’s identity
- Solution: Postpone to v2 or delegate to an external service
Problem: How to verify developers identity?
- Solution: Use GitHub verification (GitCoin approach [link?])
Problem: How to verify auditors identity?
- Use GitHub verification (GitCoin approach [link?])
- Solution: Postpone to v2 or delegate to an external service

## Flow

### Developer
The developer adds a new initial record that refers to a  new product with its new GitHub:
- Go to the system web UI
- Press “Add new project”
- Provide a name for the product
- Provide a name for the first record
- Provide an optional note
- Press Record
- Approve Metamask pop-up

The developer adds a new record for an existing product:
- Go to the system web UI
- Select the product from the owned products list
- Press “Add new record”
- Provide a name for the new record
- Provide an optional note
- Press Record
- Approve Metamask pop-up

The developer requests a third-party verification:
- Go to the system web UI
- Select the product from the owned products list
- Select record
- Press “Request verification”
- Provide the address of the third-party
- Provide the email of the third-party
- Press “Request”
- Approve Metamask pop-up

### Third-party verifier
A third-party verifies the record:
- Open email with the verification request
- Click on the link in the email
- Look at the record name and note and make sure it’s all good
- Set up Metamask to use the branding wallet
- Press “Verify Record”
- Approve Metamask pop-up

### Consumer
A user looks up a product:
- Go to the system web UI
- Enter product real name or part of it in a search field
- Select the product from results
- Observe developer address
- Observe the list of records each containing:
- Record name
- Record note
- Optional signature of a third-party

## Sub-Features

- Make a smart contract
- Make truffle tests
- Home scene
  - Search field with clickable suggestions. Enter goes to first suggestion.
  - List of owned products
  - Add product button
- Product scene
  - Product name
  - Developer address
  - List of records. Each row contains:
  - Record name
  - Verification signature with the address of the verifier (if present)
  - Add record button (only for the owner)
- Record scene
  - Record name
  - Product name
  - Developer Address
  - Verificator Address (if present)
  - Record note
  - “Verify” button (if approved)

## API

### Wayback.sol
```sol
contract Wayback {

mapping(bytes32 => address) projectToOwner;
mapping(bytes32 => address) eventTxHashToApproved;

event action(bytes32 projectId, bytes32 metaData);

function writeEvent(
  bytes32 projectId,
  bytes32 metaData
) external {}

function writeAndApprove(
  bytes32 projectId,
  bytes32 metaData,
  bytes32 eventTxHash,
  address thirdParty
) external {}

function sign(
  bytes32 projectId,
  bytes32 metaData,
  bytes32 eventTxHash
) external {}
}
```
