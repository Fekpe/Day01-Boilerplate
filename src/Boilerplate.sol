// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

/**
 * @title Boilerplate
 * @author ZerosAndOnes
 * @notice This contract serves as a template for all solidity projects in the 30-Day challenge.
 * @dev Replace sections as needed per project. Follow the structure for clean and professional contracts.
 */

contract Boilerplate {

    // Errors
    /// @dev Throw when a zero address is provided where not allowed.
    error ZeroAddress();
    /// @dev Throw when an invalid input is passed to a function.
    error InvalidInput(string message);

    // Events    
    /// @notice Emmitted when a value is updated.
    event ValueUpdated(uint256 oldValue, uint256 newValue);

    // State Variables
    /// @notice Example state variable to store a value.
    uint256 private storedValue;

    // Modifiers
    /// @notice Restricts execution to a non-zero address
    modifier nonZeroAddress(address _addr) {
        if (_addr == address(0)) {
            revert ZeroAddress();
        _;
        }
    }

    // Constructor
    /**
     * @notice Initializes the contract with an initial value.
     * @param _initialValue The starting value for 'storedValue'.
     */
    constructor(uint256 _initialValue) {
        storedValue = _initialValue;
    }

    // External Functions
    /**
     * @notice Sets a new value.
     * @dev Emits {ValueUpdated}. Add validation inside as needed.
     * @param _newValue The new value to store.
     */
    function setValue(uint256 _newValue) external {
        uint256 old = storedValue;
        storedValue = _newValue;
        emit ValueUpdated(old, _newValue);
    }

    // Public Functions
    /**
     * @notice Returns the currently stored value.
     * @return The value of 'storedValue'.
     */
    function getValue() public view returns (uint256) {
        return storedValue;
    }

    // Internal Functions
    /**
     * @notice Internal helper logic (replace or extend).
     * @param _x An input number.
     * @return doubled The doubled result of `_x`.
     */
    function _double(uint256 _x) internal pure returns (uint256 doubled) {
        doubled = _x * 2;
    }

    // Private Functions
    /**
     * @dev Private validation function example.
     * @param _number Input number must be non-zero.
     */
    function _validate(uint256 _number) private pure {
        if (_number == 0) {
            revert InvalidInput("Number cannot be zero")
        }
    }
}