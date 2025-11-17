# Boilerplate.sol — Contract README

This README documents `src/Boilerplate.sol` — a simple template contract used in the 30-Day challenge. It explains the contract purpose, public API, how to build and test locally with Foundry, and a few suggested improvements.

## Repository path
`Day01-Boilerplate/src/Boilerplate.sol`

## Purpose
`Boilerplate.sol` is a minimal, well-documented Solidity template showing common sections used in production-quality contracts:
- SPDX and pragma
- NatSpec comments
- Custom errors
- Events
- State variables
- Modifiers
- Constructor
- External / public / internal / private functions

It's intended as a starting point for exercises in the 30-Day challenge — replace or extend sections as needed.

## Contract overview
Contract: `Boilerplate`

Key symbols:
- Errors
  - `ZeroAddress()` — revert when a zero address is provided.
  - `InvalidInput(string message)` — revert with a message for invalid inputs.
- Event
  - `ValueUpdated(uint256 oldValue, uint256 newValue)` — emitted when `storedValue` changes.
- State
  - `uint256 private storedValue` — example storage slot.
- Modifier
  - `nonZeroAddress(address _addr)` — checks a non-zero address (used as example).
- Constructor
  - `constructor(uint256 _initialValue)` — initializes `storedValue`.
- External
  - `setValue(uint256 _newValue)` — sets `storedValue` and emits `ValueUpdated`.
- Public
  - `getValue() public view returns (uint256)` — returns `storedValue`.
- Internal
  - `_double(uint256 _x) internal pure returns (uint256)` — returns `_x * 2` (helper example).
- Private
  - `_validate(uint256 _number) private pure` — example validation function (reverts on 0).

## Quick API reference
- constructor(uint256 _initialValue)
- setValue(uint256 _newValue) — external
- getValue() — public view returns (uint256)

Events
- ValueUpdated(uint256 oldValue, uint256 newValue)

Errors
- ZeroAddress()
- InvalidInput(string message)

## Build & test (Foundry)
This repo includes Foundry tooling (Forge). From the repo root run:

```bash
# build contracts
forge build

# run tests
forge test
```

If you want to run only tests for this package or file, use test filters:

```bash
# run tests for Day01-Boilerplate package (if using monorepo structure)
forge test --match-path src/Boilerplate.sol
```

## Simple interaction examples
Using `cast` (from Foundry) to interact with a local node or Anvil:

1) Deploy (example with `cast send` requires a compiled bytecode and constructor args, easiest with a Foundry script or `forge create`):

```bash
# quick local script-based deploy (recommended):
forge create --rpc-url http://127.0.0.1:8545 --private-key <KEY> src/Boilerplate.sol:Boilerplate --constructor-args 42
```

2) Call read-only function with `cast`:

```bash
# call getValue (replace <ADDRESS> with deployed contract address)
cast call <ADDRESS> "getValue()(uint256)"
```

3) Send transaction to set value:

```bash
cast send <ADDRESS> "setValue(uint256)" 100 --private-key <KEY> --rpc-url http://127.0.0.1:8545
```

## Notes & suggested improvements
The contract is intentionally minimal — here are a few suggestions before using it as a production template:

- Modifier implementation: the `nonZeroAddress` modifier in the file has misplaced braces/semicolons which will cause compilation errors. Ensure modifier braces and `_;` placement are correct.
- Private `_validate` currently reverts without a trailing semicolon in the source shown; fix the missing semicolon after the `revert` statement.
- Add `emit` docs or access-control where appropriate (e.g., onlyOwner if needed).
- Add unit tests that cover happy paths and failure cases (zero address, invalid inputs).
- Consider adding `immutable`/`constant` for values that don't change to save gas.

## Security
This is a teaching template. Always audit and add tests before deploying real value. Watch for:
- Access control on mutative functions.
- Reentrancy where relevant.
- Proper input validation.

## License
See the repository `LICENSE` files for license terms. The contract header references the repository license.

---

If you want, I can:
- Fix the small syntax issues in `src/Boilerplate.sol` and run `forge build` to verify compilation.
- Add a small Foundry test file that exercises `setValue` and `getValue` (happy path + one revert case).
- Replace this README into the root `README.md` or update an existing top-level README instead of creating a package-specific file.

Which of these would you like next?